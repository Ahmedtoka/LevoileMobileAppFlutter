import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../common/config.dart';
import '../data/boxes.dart';
import '../data/secure_storage.dart';

/// A welcome coupon assigned to this device by the Le Voile dashboard.
class LvCoupon {
  final String code;
  final int discount;
  final bool used;
  final String type; // welcome | manual
  final String name;
  final String redeemLocation; // branches | online | both
  final String phone; // the customer phone this coupon is linked to

  const LvCoupon({
    required this.code,
    required this.discount,
    required this.used,
    this.type = 'welcome',
    this.name = 'Welcome Offer',
    this.redeemLocation = 'branches',
    this.phone = '',
  });

  bool get isWelcome => type == 'welcome';

  String get redeemLabel {
    switch (redeemLocation) {
      case 'online':
        return 'Redeem online';
      case 'both':
        return 'Redeem at branches or online';
      default:
        return 'Redeem at any branch';
    }
  }

  factory LvCoupon.fromJson(Map json) => LvCoupon(
        code: json['code']?.toString() ?? '',
        discount: (json['discount'] is num)
            ? (json['discount'] as num).toInt()
            : int.tryParse('${json['discount']}') ?? 0,
        used: json['used'] == true || json['status'] == 'used',
        type: json['type']?.toString() ?? 'welcome',
        name: json['name']?.toString() ??
            (json['type'] == 'manual' ? 'Discount Coupon' : 'Welcome Offer'),
        redeemLocation: json['redeem_location']?.toString() ?? 'branches',
        phone: json['phone']?.toString() ?? '',
      );
}

/// Welcome-popup configuration, controlled from the dashboard.
class LvPopup {
  final bool enabled;
  final String title;
  final String subtitle; // may contain {discount}
  final String redeem;
  final String note;

  const LvPopup({
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.redeem,
    required this.note,
  });

  factory LvPopup.fromJson(Map? json) => LvPopup(
        enabled: json?['enabled'] != false,
        title: json?['title']?.toString() ?? 'Congratulations!',
        subtitle: json?['subtitle']?.toString() ??
            'You earned a {discount}% discount coupon',
        redeem: json?['redeem']?.toString() ??
            'Redeem it now at any Le Voile branch',
        note: json?['note']?.toString() ??
            'You’ll always find this code in My Account → My Coupons',
      );

  String subtitleFor(int discount) =>
      subtitle.replaceAll('{discount}', '$discount');

  static const fallback = LvPopup(
    enabled: true,
    title: 'Congratulations!',
    subtitle: 'You earned a {discount}% discount coupon',
    redeem: 'Redeem it now at any Le Voile branch',
    note: 'You’ll always find this code in My Account → My Coupons',
  );
}

/// Handles claiming and refreshing the device's welcome coupon.
///
/// One unique coupon per device; the same device id always gets the same
/// coupon, so reinstalling keeps it. The id is stored in secure storage
/// (Keychain on iOS survives reinstall).
class CouponService {
  CouponService._();
  static final CouponService instance = CouponService._();

  static const _kDeviceIdKey = 'lv_device_id';
  // Stores the coupon code already shown in the popup, so a NEW/re-issued
  // coupon code shows the popup again (and same code stays dismissed).
  static const _kWelcomeShownKey = 'lv_coupon_welcome_code';
  // Same idea for the online (first app-order) coupon popup.
  static const _kOnlineShownKey = 'lv_coupon_online_code';

  /// Welcome coupon (null = none/unavailable). Used by the popup.
  final ValueNotifier<LvCoupon?> coupon = ValueNotifier<LvCoupon?>(null);

  /// All coupons for this device (welcome + pushed). Used by "My Coupons".
  final ValueNotifier<List<LvCoupon>> coupons =
      ValueNotifier<List<LvCoupon>>(<LvCoupon>[]);

  /// True when the first-launch welcome popup should be shown on the home page.
  final ValueNotifier<bool> shouldShowWelcome = ValueNotifier<bool>(false);

  /// True when we have no coupon yet because the customer's phone is required.
  final ValueNotifier<bool> needsPhone = ValueNotifier<bool>(false);

  /// Popup texts/enabled flag from the dashboard.
  LvPopup popup = LvPopup.fallback;

  /// Online (first app-order) coupon + its popup config. Shown right AFTER the
  /// branches popup, using the same phone.
  final ValueNotifier<LvCoupon?> onlineCoupon = ValueNotifier<LvCoupon?>(null);
  LvPopup onlinePopup = LvPopup.fallback;

  bool _initialized = false;

  /// The logged-in customer's phone, if any (used to auto-claim + dedupe).
  String? get accountPhone {
    try {
      final p = UserBox().userInfo?.phoneNumber;
      return (p != null && p.trim().isNotEmpty) ? p.trim() : null;
    } catch (_) {
      return null;
    }
  }

  /// Canonical phone identity — mirrors the dashboard's normalizer so
  /// "0100 882 0066", "01008820066" and "+201008820066" map to one customer.
  /// Returns null for junk / too-short input.
  static String? normalizePhone(String? input) {
    if (input == null) return null;
    var digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return null;
    if (digits.startsWith('20') && digits.length >= 12) {
      digits = digits.substring(2);
    }
    if (!digits.startsWith('0')) digits = '0$digits';
    return digits.length >= 10 ? digits : null;
  }

  String? get _base {
    if (!kAppConfig.startsWith('http')) return null;
    return kAppConfig.replaceFirst(RegExp(r'/config(/.*)?$'), '');
  }

  String _platform() => defaultTargetPlatform == TargetPlatform.iOS
      ? 'ios'
      : 'android';

  static const MethodChannel _deviceChannel =
      MethodChannel('com.levoile.stores/device');

  /// The persistent device id. Seeded from the hardware Android ID (which
  /// survives uninstall + clearing data/cache — only a factory reset changes
  /// it), so the same physical device can never farm a second welcome coupon.
  /// iOS keeps the Keychain-backed UUID (also survives reinstall).
  String get deviceId => _deviceId();

  String _randomId() {
    final rnd = Random.secure();
    final bytes = List<int>.generate(16, (_) => rnd.nextInt(256));
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  String _deviceId() {
    var id = SecureStorage().get(_kDeviceIdKey);
    if (id.isEmpty) {
      // Fallback only — init() seeds a stable id before any claim runs.
      id = _randomId();
      SecureStorage().set(_kDeviceIdKey, id);
    }
    return id;
  }

  Future<void>? _deviceIdFuture;

  /// Seeds a STABLE device id from the hardware Android ID on first run, so it
  /// stays the same after reinstalling / clearing data. Idempotent + memoized
  /// so concurrent callers (token register + claim) can't race to a random id.
  Future<void> ensureDeviceId() =>
      _deviceIdFuture ??= _ensureStableDeviceId();

  Future<void> _ensureStableDeviceId() async {
    await SecureStorage().init();
    final existing = SecureStorage().get(_kDeviceIdKey);
    if (existing.isNotEmpty) return; // already decided for this install

    String? id;
    if (defaultTargetPlatform == TargetPlatform.android) {
      try {
        final androidId =
            await _deviceChannel.invokeMethod<String>('getAndroidId');
        // Skip the known buggy emulator value.
        if (androidId != null &&
            androidId.isNotEmpty &&
            androidId != '9774d56d682e549c') {
          id = 'aid_$androidId';
        }
      } catch (e) {
        debugPrint('🎟️[Coupon] androidId unavailable: $e');
      }
    }
    id ??= _randomId();
    SecureStorage().set(_kDeviceIdKey, id);
    debugPrint('🎟️[Coupon] device id seeded: $id');
  }

  /// Re-attempts the claim when the first one failed (e.g. a transient
  /// connection drop at launch). Safe to call repeatedly; only acts while we
  /// still have no coupon and haven't been told to ask for the phone.
  Future<void> retryClaim() async {
    if (_base == null) return;
    if (coupon.value != null || needsPhone.value) return;
    debugPrint('🎟️[Coupon] retrying claim…');
    await SecureStorage().init();
    await ensureDeviceId();
    await _claim(phone: accountPhone);
  }

  /// Claims the coupon on app launch (using the account phone if logged in).
  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    await SecureStorage().init();
    await ensureDeviceId();
    debugPrint('🎟️[Coupon] init  base=$_base  device=${_deviceId()}  '
        'accountPhone=${accountPhone ?? "none"}');
    if (_base == null) {
      debugPrint('🎟️[Coupon] ⛔ no base URL (appConfig not http) — skipping');
      return;
    }

    // Record install / app open for analytics.
    track('open');

    await _claim(phone: accountPhone);
  }

  /// Claims the coupon after the customer typed their phone in the popup.
  /// Returns true when a coupon was granted.
  Future<bool> claimWithPhone(String phone) async {
    await _claim(phone: phone, decidePopup: false);
    return coupon.value != null;
  }

  Future<void> _claim({String? phone, bool decidePopup = true}) async {
    final base = _base;
    if (base == null) return;
    final normPhone = normalizePhone(phone);
    try {
      final res = await http
          .post(
            Uri.parse('$base/coupon/claim'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'device_id': _deviceId(),
              'platform': _platform(),
              if (normPhone != null) 'phone': normPhone,
            }),
          )
          .timeout(const Duration(seconds: 6));

      debugPrint('🎟️[Coupon] claim status=${res.statusCode} body=${res.body}');
      if (res.statusCode != 200) return;
      final body = jsonDecode(res.body);
      popup = LvPopup.fromJson(body['popup'] as Map?);

      // Online (first app-order) coupon — claimed with the same phone.
      if (body['onlinePopup'] != null) {
        onlinePopup = LvPopup.fromJson(body['onlinePopup'] as Map?);
      }
      onlineCoupon.value = body['onlineCoupon'] != null
          ? LvCoupon.fromJson(body['onlineCoupon'])
          : null;

      if (body['needs_phone'] == true) {
        needsPhone.value = true;
        debugPrint('🎟️[Coupon] → needs_phone=true (will ask phone in popup)');
        return;
      }

      if (body['success'] == true && body['coupon'] != null) {
        needsPhone.value = false;
        coupon.value = LvCoupon.fromJson(body['coupon']);
        coupons.value = _parseList(body['coupons']);

        if (decidePopup) {
          // Popup shows if enabled, coupon unused, and this code wasn't dismissed.
          final dismissedCode = SecureStorage().get(_kWelcomeShownKey);
          final code = coupon.value?.code ?? '';
          if (popup.enabled &&
              coupon.value?.used == false &&
              code.isNotEmpty &&
              dismissedCode != code) {
            shouldShowWelcome.value = true;
          }
          debugPrint('🎟️[Coupon] → coupon=$code used=${coupon.value?.used} '
              'popupEnabled=${popup.enabled} dismissed=$dismissedCode '
              'shouldShow=${shouldShowWelcome.value}');
        } else {
          debugPrint('🎟️[Coupon] → granted coupon=${coupon.value?.code} '
              '(from phone entry)');
        }
      }
    } catch (e) {
      debugPrint('🎟️[Coupon] ⛔ claim failed: $e');
    }
  }

  /// Refreshes the used/unused status (e.g. on resume or opening My Coupons).
  Future<void> refresh() async {
    await SecureStorage().init();
    final base = _base;
    if (base == null) return;
    try {
      final res = await http
          .get(Uri.parse('$base/coupon/status/${_deviceId()}'))
          .timeout(const Duration(seconds: 6));
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body['success'] == true) {
          if (body['coupon'] != null) {
            coupon.value = LvCoupon.fromJson(body['coupon']);
          }
          coupons.value = _parseList(body['coupons']);
        }
      }
    } catch (_) {
      // keep last known value
    }
  }

  List<LvCoupon> _parseList(dynamic raw) {
    if (raw is List) {
      return raw
          .whereType<Map>()
          .map((e) => LvCoupon.fromJson(e))
          .toList();
    }
    return coupons.value;
  }

  void markWelcomeShown() {
    SecureStorage().set(_kWelcomeShownKey, coupon.value?.code ?? '1');
    shouldShowWelcome.value = false;
    track('popup_shown');
  }

  /// True when the online (first app-order) popup should be shown: we have an
  /// online coupon, its popup is enabled, it's unused, and this code hasn't
  /// been dismissed yet.
  bool get shouldShowOnline {
    final c = onlineCoupon.value;
    if (c == null || !onlinePopup.enabled || c.used) return false;
    final dismissed = SecureStorage().get(_kOnlineShownKey);
    return c.code.isNotEmpty && dismissed != c.code;
  }

  void markOnlineShown() {
    SecureStorage().set(_kOnlineShownKey, onlineCoupon.value?.code ?? '1');
  }

  /// Reports a funnel/presence event to the dashboard, keyed by device id.
  /// event = open | signup | login | popup_shown | heartbeat
  Future<void> track(String event, {String? email}) async {
    final base = _base;
    if (base == null) return;
    try {
      await SecureStorage().init();
      await http
          .post(
            Uri.parse('$base/track'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'device_id': _deviceId(),
              'event': event,
              'platform': _platform(),
              if (email != null && email.isNotEmpty) 'user_email': email,
            }),
          )
          .timeout(const Duration(seconds: 6));
      debugPrint('🎟️[Track] event=$event'
          '${email != null ? " email=$email" : ""} sent');
    } catch (e) {
      debugPrint('🎟️[Track] event=$event failed: $e');
    }
  }
}
