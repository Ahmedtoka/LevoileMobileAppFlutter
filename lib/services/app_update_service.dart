import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/config.dart';
import '../data/boxes.dart';

/// Result of the version-gate check against the dashboard.
class AppUpdateInfo {
  AppUpdateInfo({
    required this.enabled,
    required this.latestVersionCode,
    required this.latestVersionName,
    required this.storeUrl,
    required this.forceUpdate,
    required this.message,
    required this.currentVersionCode,
  });

  final bool enabled;
  final int latestVersionCode;
  final String latestVersionName;

  /// Play Store / App Store link for this platform. "Update" opens the store
  /// (which installs + reopens itself) — the only update path, on both
  /// platforms. A direct-APK sideload path used to exist here for Android but
  /// was removed: Google Play flags REQUEST_INSTALL_PACKAGES on general
  /// (non-browser/file-manager/MDM) apps as Device and Network Abuse, and
  /// blocked publishing over it.
  final String storeUrl;
  final bool forceUpdate;
  final String message;
  final int currentVersionCode;

  /// True when the dashboard advertises a newer build AND we have a store link
  /// to send the user to. Without a store link there is nothing for the
  /// "Update" button to do, so no popup.
  bool get updateAvailable =>
      enabled && latestVersionCode > currentVersionCode && storeUrl.isNotEmpty;
}

/// Le Voile OTA gate: reads the version check from the dashboard and, when a
/// newer build exists, sends the user to the Play Store / App Store.
class AppUpdateService {
  AppUpdateService._();
  static final AppUpdateService instance = AppUpdateService._();

  final Dio _dio = Dio();

  /// Store URL for the "Rate the App" button (cached from /app-version).
  /// Returns null when not configured yet, so the caller can fall back.
  static Future<String?> rateUrl() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = Platform.isIOS ? 'lv_rate_ios' : 'lv_rate_android';
      final url = prefs.getString(key) ?? '';
      return url.isEmpty ? null : url;
    } catch (_) {
      return null;
    }
  }

  /// Derive `.../api/v1/app-version` from the configured app-config URL.
  String get _versionUrl {
    final base = kAppConfig; // e.g. https://host/api/v1/config/en
    const marker = '/api/v1/';
    final idx = base.indexOf(marker);
    if (idx != -1) {
      return '${base.substring(0, idx)}$marker' 'app-version';
    }
    return base;
  }

  Future<AppUpdateInfo?> check() async {
    // Le Voile: this used to `return null` on anything but Android, so iOS had
    // NO version gate at all — a broken build could not be forced off the
    // devices. Both platforms are sent to their respective store via
    // `androidUrl` / `iosUrl`.
    if (!Platform.isAndroid && !Platform.isIOS) return null;
    try {
      final pkg = await PackageInfo.fromPlatform();
      final current = int.tryParse(pkg.buildNumber) ?? 0;

      final res = await _dio.get(
        _versionUrl,
        options: Options(
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

      final data = res.data is Map
          ? Map<String, dynamic>.from(res.data as Map)
          : Map<String, dynamic>.from(jsonDecode(res.data.toString()) as Map);

      // Cache the store URLs for the "Rate the App" button.
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('lv_rate_android', '${data['androidUrl'] ?? ''}');
        await prefs.setString('lv_rate_ios', '${data['iosUrl'] ?? ''}');
      } catch (_) {}

      // Cache the splash slogan (shown under the logo on the next launch).
      try {
        final slogan = '${data['splashSlogan'] ?? ''}'.trim();
        if (slogan.isNotEmpty) SettingsBox().splashSlogan = slogan;
      } catch (_) {}

      final storeUrl = Platform.isIOS
          ? '${data['iosUrl'] ?? ''}'.trim()
          : '${data['androidUrl'] ?? ''}'.trim();

      // Le Voile: iOS compares against its OWN build counter. CFBundleVersion
      // and the Android versionCode are unrelated numbers (App Store uploads
      // must each be unique), so reusing latestVersionCode on iOS would gate
      // every iPhone against an Android build number. 0 = no iOS gate, which is
      // the default until AppLatestBuildIos is set in the dashboard.
      final latest = Platform.isIOS
          ? int.tryParse('${data['latestBuildIos'] ?? 0}') ?? 0
          : int.tryParse('${data['latestVersionCode'] ?? 0}') ?? 0;
      if (Platform.isIOS && latest <= 0) return null;

      return AppUpdateInfo(
        enabled: data['enabled'] == true,
        latestVersionCode: latest,
        latestVersionName: '${data['latestVersionName'] ?? ''}',
        storeUrl: storeUrl,
        // Le Voile: was `!= false`, i.e. a malformed or partial /app-version
        // response (missing the key) put every user behind a BLOCKING dialog
        // they could not dismiss. Fail open instead — the dashboard already
        // defaults AppForceUpdate to '1', so a real force-update still works.
        forceUpdate: data['forceUpdate'] == true,
        message: '${data['message'] ?? ''}',
        currentVersionCode: current,
      );
    } catch (_) {
      return null;
    }
  }
}
