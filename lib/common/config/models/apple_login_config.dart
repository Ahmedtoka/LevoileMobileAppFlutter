class AppleLoginConfig {
  const AppleLoginConfig({
    this.iOSBundleId,
    this.appleAccountTeamID,
    this.bridgeEndpoint,
  });

  final String? iOSBundleId;
  final String? appleAccountTeamID;

  /// Le Voile: endpoint that trades an Apple identity token for a Shopify
  /// Storefront customer access token. Shopify's native social sign-in only
  /// supports Google and Facebook, so Sign in with Apple has to go through our
  /// own bridge. Leave null to hide the Apple button.
  final String? bridgeEndpoint;

  factory AppleLoginConfig.fromJson(Map json) {
    return AppleLoginConfig(
      iOSBundleId: json['iOSBundleId'],
      appleAccountTeamID: json['appleAccountTeamID'],
      bridgeEndpoint: json['bridgeEndpoint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iOSBundleId': iOSBundleId,
      'appleAccountTeamID': appleAccountTeamID,
      'bridgeEndpoint': bridgeEndpoint,
    };
  }
}
