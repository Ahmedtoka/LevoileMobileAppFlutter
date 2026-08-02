import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'boxes.dart';

class SecureStorage {
  // Le Voile: these were `static late final`, which made init() unsafe to call
  // concurrently. app.dart's initState fires three unawaited callers
  // (_registerDeviceToken, CouponService.init, PopupService.fetch) plus
  // boxes.dart, and the old `_isInitialized` flag was only set AFTER the
  // `await readAll()`. So a second caller passed the guard while the first was
  // still suspended, then re-assigned a `late final` field and threw
  // LateInitializationError. That error escaped CouponService.init() (which is
  // called without await, so it vanished into runZonedGuarded) and — worse —
  // poisoned the memoized ensureDeviceId() future for the rest of the session,
  // silently killing the coupon claim. Memoize the future instead of using a
  // boolean, so concurrent callers all await the same single initialisation.
  static FlutterSecureStorage? _secureStorage;

  static Map<String, dynamic> _storage = <String, dynamic>{};

  static Future<void>? _initFuture;

  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() => _instance;

  SecureStorage._internal();

  Future<void> init() => _initFuture ??= _init();

  Future<void> _init() async {
    if (kDisableWebCookies) {
      _storage = <String, dynamic>{};
      return;
    }
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(resetOnError: true),
    );
    try {
      _storage = await _secureStorage?.readAll() ?? <String, dynamic>{};
    } catch (e) {
      // Le Voile: this used to call deleteAll() on any read error, which wipes
      // lv_device_id and both coupon dismissal codes — making a returning
      // device look brand new to the dashboard (it would then be issued a
      // fresh coupon, or lose the one it had). AndroidOptions(resetOnError)
      // already recovers a corrupted Android keystore, so just start from an
      // empty view and let writes repopulate it.
      debugPrint('🔐[SecureStorage] readAll failed, starting empty: $e');
      _storage = <String, dynamic>{};
    }
  }

  String get(String key) {
    return _storage[key] ?? '';
  }

  void set(String key, String value) {
    _secureStorage?.write(key: key, value: value);
    _storage[key] = value;
  }

  /// Le Voile: same as [set] but awaits the platform write and reports whether
  /// it actually landed. Use this when the value must survive an immediate kill
  /// (the device id, the coupon dismissal codes) — [set] is fire-and-forget and
  /// silently loses the write if the app dies first.
  ///
  /// Returns false if the value only made it into the in-memory map, so callers
  /// that depend on durability (see CouponService.ensureDeviceId) can back off
  /// instead of proceeding on a value that will be gone next launch.
  Future<bool> write(String key, String value) async {
    _storage[key] = value;
    if (kDisableWebCookies) {
      return true; // in-memory is the intended backing store here
    }
    // Lazily construct: init() may have thrown before assigning this, and that
    // is exactly the case where a durable write matters most.
    _secureStorage ??= const FlutterSecureStorage(
      aOptions: AndroidOptions(resetOnError: true),
    );
    try {
      await _secureStorage!.write(key: key, value: value);
      return true;
    } catch (e) {
      debugPrint('🔐[SecureStorage] write failed for $key: $e');
      return false;
    }
  }
}
