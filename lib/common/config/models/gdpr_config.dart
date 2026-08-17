const _kDefaultShowPrivacyPolicyFirstTime = false;
const _kDefaultShowDeleteAccount = false;
const _kDefaultCaptcha = 'PERMANENTLY DELETE';

class GdprConfig {
  final bool showPrivacyPolicyFirstTime;
  final bool showDeleteAccount;
  final String confirmCaptcha;

  /// Where [deleteAccount] posts on Shopify.
  ///
  /// Shopify's Storefront API can create and update a customer but cannot
  /// delete one, and the Admin API token that can must never ship inside the
  /// app — so deletion goes through our own endpoint. Empty on frameworks whose
  /// own API deletes accounts directly (WooCommerce/WordPress), which ignore it.
  final String? deleteAccountEndpoint;

  const GdprConfig({
    required this.showPrivacyPolicyFirstTime,
    required this.showDeleteAccount,
    required this.confirmCaptcha,
    this.deleteAccountEndpoint,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GdprConfig &&
          runtimeType == other.runtimeType &&
          showPrivacyPolicyFirstTime == other.showPrivacyPolicyFirstTime &&
          showDeleteAccount == other.showDeleteAccount &&
          confirmCaptcha == other.confirmCaptcha &&
          deleteAccountEndpoint == other.deleteAccountEndpoint);

  @override
  int get hashCode =>
      showPrivacyPolicyFirstTime.hashCode ^
      showDeleteAccount.hashCode ^
      confirmCaptcha.hashCode ^
      deleteAccountEndpoint.hashCode;

  @override
  String toString() {
    return 'GdprConfig{ showPrivacyPolicyFirstTime: $showPrivacyPolicyFirstTime, showDeleteAccount: $showDeleteAccount, confirmCaptcha: $confirmCaptcha, deleteAccountEndpoint: $deleteAccountEndpoint,}';
  }

  GdprConfig copyWith({
    bool? showPrivacyPolicyFirstTime,
    bool? showDeleteAccount,
    String? confirmCaptcha,
    String? deleteAccountEndpoint,
  }) {
    return GdprConfig(
      showPrivacyPolicyFirstTime:
          showPrivacyPolicyFirstTime ?? this.showPrivacyPolicyFirstTime,
      showDeleteAccount: showDeleteAccount ?? this.showDeleteAccount,
      confirmCaptcha: confirmCaptcha ?? this.confirmCaptcha,
      deleteAccountEndpoint:
          deleteAccountEndpoint ?? this.deleteAccountEndpoint,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'showPrivacyPolicyFirstTime': showPrivacyPolicyFirstTime,
      'showDeleteAccount': showDeleteAccount,
      'confirmCaptcha': confirmCaptcha,
      'deleteAccountEndpoint': deleteAccountEndpoint,
    };
  }

  factory GdprConfig.fromMap(Map map) {
    return GdprConfig(
      showPrivacyPolicyFirstTime:
          map['showPrivacyPolicyFirstTime'] ??
          _kDefaultShowPrivacyPolicyFirstTime,
      showDeleteAccount: map['showDeleteAccount'] ?? _kDefaultShowDeleteAccount,
      confirmCaptcha: map['confirmCaptcha'] ?? _kDefaultCaptcha,
      deleteAccountEndpoint: map['deleteAccountEndpoint'],
    );
  }
}
