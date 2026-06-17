import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../common/config.dart';
import '../screens/custom/announcement_popup.dart';

/// A dashboard-controlled in-app popup (text or image announcement).
class LvPopupItem {
  final String id;
  final String type; // text | image
  final List<String> screens; // home | category | cart | profile
  final String frequency; // once | session | daily | every | count
  final int maxCount;
  final String heading;
  final String body;
  final String image;
  final String buttonText;
  final String buttonAction; // none | url | collection | product
  final String buttonTarget;
  final String bgColor;
  final String textColor;

  const LvPopupItem({
    required this.id,
    required this.type,
    required this.screens,
    required this.frequency,
    required this.maxCount,
    required this.heading,
    required this.body,
    required this.image,
    required this.buttonText,
    required this.buttonAction,
    required this.buttonTarget,
    required this.bgColor,
    required this.textColor,
  });

  factory LvPopupItem.fromJson(Map json) => LvPopupItem(
        id: json['id']?.toString() ?? '',
        type: json['type']?.toString() ?? 'text',
        screens: (json['screens'] is List)
            ? (json['screens'] as List).map((e) => e.toString()).toList()
            : const ['home'],
        frequency: json['frequency']?.toString() ?? 'once',
        maxCount: int.tryParse('${json['maxCount'] ?? 1}') ?? 1,
        heading: json['heading']?.toString() ?? '',
        body: json['body']?.toString() ?? '',
        image: json['image']?.toString() ?? '',
        buttonText: json['buttonText']?.toString() ?? '',
        buttonAction: json['buttonAction']?.toString() ?? 'none',
        buttonTarget: json['buttonTarget']?.toString() ?? '',
        bgColor: json['bgColor']?.toString() ?? '#A51E8C',
        textColor: json['textColor']?.toString() ?? '#FFFFFF',
      );
}

/// Fetches dashboard-controlled popups and shows the right one per screen,
/// honouring its frequency cap. Logs impressions/clicks/dismissals back.
class PopupService {
  PopupService._();
  static final PopupService instance = PopupService._();

  List<LvPopupItem> _popups = <LvPopupItem>[];
  bool _couponAvailable = false;
  bool _fetched = false;
  final Set<String> _sessionShown = <String>{};

  /// Whether the welcome coupon currently has codes (so the coupon popup runs).
  bool get couponAvailable => _couponAvailable;

  String? get _base {
    if (!kAppConfig.startsWith('http')) return null;
    return kAppConfig.replaceFirst(RegExp(r'/config(/.*)?$'), '');
  }

  /// Fetches the popup list. Pass [force] to refetch after a config publish so
  /// frequency / content changes apply without a full app restart.
  Future<void> fetch({bool force = false}) async {
    if (_fetched && !force) return;
    final base = _base;
    if (base == null) return;
    try {
      final res = await http
          .get(Uri.parse('$base/popups'))
          .timeout(const Duration(seconds: 6));
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        _couponAvailable = body['couponAvailable'] == true;
        final list = body['popups'];
        _popups = (list is List)
            ? list.whereType<Map>().map((e) => LvPopupItem.fromJson(e)).toList()
            : <LvPopupItem>[];
        _fetched = true;
        debugPrint('📣[Popup] fetched ${_popups.length} popups '
            'couponAvailable=$_couponAvailable');
      }
    } catch (e) {
      debugPrint('📣[Popup] fetch failed: $e');
    }
  }

  /// Shows the first eligible popup for [screen], if any.
  Future<void> maybeShowFor(String screen, BuildContext context) async {
    if (!_fetched) await fetch();

    for (final p in _popups) {
      if (!p.screens.contains(screen)) continue;
      final ok = await _eligible(p);
      debugPrint('📣[Popup] ${p.id} screen=$screen freq=${p.frequency} '
          'eligible=$ok');
      if (!ok) continue;

      _sessionShown.add(p.id);
      await _record(p);
      _report(p.id, 'shown');

      if (!context.mounted) return;
      await AnnouncementPopup.show(
        context,
        p,
        onAction: () => _report(p.id, 'clicked'),
        onDismiss: () => _report(p.id, 'dismissed'),
      );
      break; // one popup per screen visit
    }
  }

  /// Frequency rules (one popup per screen visit; first eligible wins):
  ///  - once    : show one time ever on this device.
  ///  - session : show once per app launch (resets when the app is reopened).
  ///  - daily   : show once per calendar day.
  ///  - count   : show up to [maxCount] times ever, then stop.
  ///  - every   : show on every visit to the screen.
  Future<bool> _eligible(LvPopupItem p) async {
    final prefs = await SharedPreferences.getInstance();
    switch (p.frequency) {
      case 'every':
        return true;
      case 'session':
        return !_sessionShown.contains(p.id);
      case 'daily':
        return prefs.getString('popup_${p.id}_day') != _today();
      case 'count':
        final c = prefs.getInt('popup_${p.id}_count') ?? 0;
        return c < p.maxCount;
      case 'once':
      default:
        return !(prefs.getBool('popup_${p.id}_shown') ?? false);
    }
  }

  Future<void> _record(LvPopupItem p) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('popup_${p.id}_shown', true);
    await prefs.setString('popup_${p.id}_day', _today());
    final c = prefs.getInt('popup_${p.id}_count') ?? 0;
    await prefs.setInt('popup_${p.id}_count', c + 1);
  }

  String _today() {
    final n = DateTime.now();
    return '${n.year}-${n.month}-${n.day}';
  }

  void _report(String id, String event) async {
    final base = _base;
    if (base == null) return;
    try {
      await http
          .post(
            Uri.parse('$base/popups/event'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({'id': id, 'event': event}),
          )
          .timeout(const Duration(seconds: 6));
    } catch (_) {}
  }
}
