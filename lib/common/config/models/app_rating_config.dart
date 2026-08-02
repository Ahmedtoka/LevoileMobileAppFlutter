import '../../../modules/dynamic_layout/helper/helper.dart';

const int _defaultMinDays = 7;
const int _defaultMinLaunches = 10;
const int _defaultRemindDays = 7;
const int _defaultRemindLaunches = 10;
// Le Voile: the real store identifiers, NOT the FluxStore template's.
//
// These were `com.inspireui.fluxstore` / `1469772800`, so "Rate the app" sent
// every customer to InspireVUI's own FluxStore demo listing. Verified against
// App Store Connect on 2026-08-02: Bundle ID com.arenahere.levoile, Apple ID
// 6746816634.
const String _defaultGooglePlayIdentifier = 'com.arenahere.levoile';
const String _defaultAppStoreIdentifier = '6746816634';

class AppRatingConfig {
  final int minDays;
  final int minLaunches;
  final int remindDays;
  final int remindLaunches;
  final String googlePlayIdentifier;
  final String appStoreIdentifier;
  final bool showOnOpen;

  AppRatingConfig({
    this.minDays = _defaultMinDays,
    this.minLaunches = _defaultMinLaunches,
    this.remindDays = _defaultRemindDays,
    this.remindLaunches = _defaultRemindLaunches,
    this.googlePlayIdentifier = _defaultGooglePlayIdentifier,
    this.appStoreIdentifier = _defaultAppStoreIdentifier,
    this.showOnOpen = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'minDays': minDays,
      'minLaunches': minLaunches,
      'remindDays': remindDays,
      'remindLaunches': remindLaunches,
      'googlePlayIdentifier': googlePlayIdentifier,
      'appStoreIdentifier': appStoreIdentifier,
      'showOnOpen': showOnOpen,
    };
  }

  factory AppRatingConfig.fromMap(Map map) {
    return AppRatingConfig(
      minDays: Helper.formatInt(map['minDays']) ?? _defaultMinDays,
      minLaunches: Helper.formatInt(map['minLaunches']) ?? _defaultMinLaunches,
      remindDays: Helper.formatInt(map['remindDays']) ?? _defaultRemindDays,
      remindLaunches:
          Helper.formatInt(map['remindLaunches']) ?? _defaultRemindLaunches,
      googlePlayIdentifier:
          map['googlePlayIdentifier'] ??
          (map['android'] ?? _defaultGooglePlayIdentifier),
      appStoreIdentifier:
          map['appStoreIdentifier'] ??
          (map['ios'] ?? _defaultAppStoreIdentifier),
      showOnOpen: map['showOnOpen'] ?? !(map['disable'] ?? true),
    );
  }

  AppRatingConfig copyWith({
    int? minDays,
    int? minLaunches,
    int? remindDays,
    int? remindLaunches,
    String? googlePlayIdentifier,
    String? appStoreIdentifier,
    bool? showOnOpen,
  }) {
    return AppRatingConfig(
      minDays: minDays ?? this.minDays,
      minLaunches: minLaunches ?? this.minLaunches,
      remindDays: remindDays ?? this.remindDays,
      remindLaunches: remindLaunches ?? this.remindLaunches,
      googlePlayIdentifier: googlePlayIdentifier ?? this.googlePlayIdentifier,
      appStoreIdentifier: appStoreIdentifier ?? this.appStoreIdentifier,
      showOnOpen: showOnOpen ?? this.showOnOpen,
    );
  }
}
