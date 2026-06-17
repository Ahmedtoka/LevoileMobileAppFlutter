import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/cart/cart_model.dart';
import '../../../models/order/order.dart';
import '../../../models/tera_wallet/wallet_model.dart';
import '../../../screens/index.dart';

/// Handler for ModemPay deeplinks in the main app
class ModemPayDeeplinkHandler {
  static bool canHandle(Uri uri) {
    // Check if this is a completed ModemPay payment success callback.
    // This must mirror handleDeeplink criteria to avoid false positives.
    final url = kModemPayConfig['returnUrl']?.toString() ?? '';
    final returnUrl = Uri.tryParse(
      url.isEmpty ? 'fluxstore://inspireui.com' : url,
    );

    final transactionId = uri.queryParameters['transaction_id'];
    final status = uri.queryParameters['status'];

    return returnUrl != null &&
        uri.host.endsWith(returnUrl.host) &&
        uri.path == '/modempay_payment_success' &&
        transactionId != null &&
        status?.toLowerCase() == 'completed';
  }

  /// Handle the deeplink URL
  ///
  /// For example: fluxstore://inspireui.com/modempay_payment_success?transaction_id=SPS6GD43MU&status=completed
  ///
  /// Returns true if the URL was handled, false otherwise
  static Future<bool> handleDeeplink(BuildContext context, Uri uri) async {
    if (!canHandle(uri)) return false;

    // Wait a bit to ensure the widget tree is ready
    await Future.delayed(const Duration(milliseconds: 500));

    if (!context.mounted) return false;

    // Clear the cart
    await context.read<CartModel>().clearCart();

    // Refresh wallet if using wallet payment
    await context.read<WalletModel>().refreshWallet();

    // Navigate to a success confirmation screen
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => WebviewCheckoutSuccessScreen(order: Order()),
      ),
      ModalRoute.withName(RouteList.dashboard),
    );
    return true;
  }
}
