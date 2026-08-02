import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/config.dart';
import '../data/boxes.dart';

/// Result of the version-gate check against the dashboard.
class AppUpdateInfo {
  AppUpdateInfo({
    required this.enabled,
    required this.latestVersionCode,
    required this.latestVersionName,
    required this.apkUrl,
    required this.storeUrl,
    required this.forceUpdate,
    required this.message,
    required this.currentVersionCode,
  });

  final bool enabled;
  final int latestVersionCode;
  final String latestVersionName;
  final String apkUrl;

  /// Play Store / App Store link for this platform. When set, "Update" opens
  /// the store (which installs + reopens itself) — the production path.
  final String storeUrl;
  final bool forceUpdate;
  final String message;
  final int currentVersionCode;

  /// True when the dashboard advertises a newer build and we have somewhere to
  /// send the user (the store link, or a direct APK for testing).
  ///
  /// Le Voile: the direct-APK fallback is Android-only — an .apk is useless on
  /// iOS, so there iOS requires a real App Store link before we tell the user
  /// an update exists (otherwise a force-update would trap them in a dialog
  /// with no working button).
  bool get updateAvailable =>
      enabled &&
      latestVersionCode > currentVersionCode &&
      (storeUrl.isNotEmpty || (apkUrl.isNotEmpty && Platform.isAndroid));
}

/// Le Voile OTA self-update: reads the version gate from the dashboard,
/// downloads the new APK (with progress) and hands it to the Android installer.
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
    // devices. The direct-APK path stays Android-only (see updateAvailable),
    // but iOS can and should be sent to the App Store via `iosUrl`.
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
        apkUrl: '${data['apkUrl'] ?? ''}',
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

  /// Downloads the APK to a temp path, reporting 0.0–1.0 progress.
  Future<File> downloadApk(
    String url,
    void Function(double progress) onProgress, {
    CancelToken? cancelToken,
  }) async {
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/levoile_update.apk';
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }

    await _dio.download(
      url,
      path,
      cancelToken: cancelToken,
      onReceiveProgress: (received, total) {
        if (total > 0) onProgress(received / total);
      },
    );

    return File(path);
  }
}
