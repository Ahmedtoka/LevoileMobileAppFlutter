import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

class WalletConfig {
  final bool enableTeraWallet;
  final bool enableTeraWalletWithdrawal;

  /// Use the `null` name as default to be compatible with old name if user
  /// changed in `overrideTranslation`
  final String? teraWalletName;

  const WalletConfig({
    this.enableTeraWallet = false,
    this.enableTeraWalletWithdrawal = false,
    this.teraWalletName,
  });

  Map<String, dynamic> toJson() {
    return {
      'enableTeraWallet': enableTeraWallet,
      'enableTeraWalletWithdrawal': enableTeraWalletWithdrawal,
      'teraWalletName': teraWalletName,
    };
  }

  factory WalletConfig.fromJson(Map map) {
    return WalletConfig(
      enableTeraWallet: bool.tryParse('${map['enableTeraWallet']}') ?? false,
      enableTeraWalletWithdrawal:
          bool.tryParse('${map['enableTeraWalletWithdrawal']}') ?? false,
      teraWalletName: map['teraWalletName']?.toString(),
    );
  }

  WalletConfig copyWith({
    bool? enableTeraWallet,
    bool? enableTeraWalletWithdrawal,
    String? teraWalletName,
  }) {
    return WalletConfig(
      enableTeraWallet: enableTeraWallet ?? this.enableTeraWallet,
      enableTeraWalletWithdrawal:
          enableTeraWalletWithdrawal ?? this.enableTeraWalletWithdrawal,
      teraWalletName: teraWalletName ?? this.teraWalletName,
    );
  }
}

extension WalletConfigExtension on WalletConfig {
  String getTeraWalletName(BuildContext context) {
    return (teraWalletName?.isNotEmpty ?? false)
        ? teraWalletName!
        : S.of(context).teraWallet;
  }
}
