import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools.dart';
import '../../../models/index.dart'
    show Order, OrderStatus, PointModel, UserModel, OrderStatusExtension;
import '../../../models/order/bank_account_item.dart';
import '../../../services/index.dart';
import '../../base_screen.dart';
import '../webview_checkout_screen.dart';
import 'price_row_item.dart';
import 'product_review.dart';
import 'whatsapp_order.dart';

class OrderedSuccess extends StatefulWidget {
  final Order order;
  final bool hasScroll;

  const OrderedSuccess({required this.order, this.hasScroll = true});

  @override
  BaseScreen<OrderedSuccess> createState() => _OrderedSuccessState();
}

class _OrderedSuccessState extends BaseScreen<OrderedSuccess> {
  Order? order;
  bool isLoading = false;

  ThemeData get theme => Theme.of(context);

  Color get secondaryColor => theme.colorScheme.secondary;
  String get paymentUrl => order?.paymentUrl ?? '';
  bool get showPaymentButton =>
      isLoading == false &&
      order?.status == OrderStatus.pending &&
      paymentUrl.isNotEmpty;

  /// The order number, only if it's a real value (web checkout sometimes can't
  /// read it back and returns 0 — in that case we hide it instead of "#0").
  String? get _validOrderNo {
    final n = (order?.number ?? order?.id ?? '').toString().trim();
    return (n.isEmpty || n == '0') ? null : n;
  }

  Future<void> _getOrderByOrderId(String orderId) async {
    if (orderId == '0') return;

    setState(() {
      isLoading = true;
    });
    LoadingHelper.show();

    try {
      final orderDetail = await Services().api.getOrderByOrderId(
        orderId: orderId,
      );

      if (orderDetail != null) {
        order = orderDetail;
      }
    } catch (e, trace) {
      printError(e, trace);
    }

    _handlePoint();
    _updateSmartCodRfOrder();

    LoadingHelper.hide();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _updateSmartCodRfOrder() {
    if (order?.smartCodIsRfOrder == true) {
      Services().api.smartCodUpdateOrderSuccess(order?.id ?? '');
    }
  }

  void _handlePoint() {
    final user = Provider.of<UserModel>(context, listen: false).user;
    if (user != null &&
        user.cookie != null &&
        kAdvanceConfig.enablePointReward) {
      Services().api.updatePoints(user.cookie, order);
      Provider.of<PointModel>(context, listen: false).getMyPoint(user.cookie);
    }
  }

  Future<void> _handlePayment() async {
    if (paymentUrl.isEmpty) {
      return;
    }

    final user = Provider.of<UserModel>(context, listen: false).user;
    var url = paymentUrl;
    if (user?.cookie != null) {
      url = url.addWooCookieToUrl(user!.cookie);
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebviewCheckout(
          url: url,
          onFinish: (orderId) async {
            // Reload order to get updated status
            if (orderId != null) {
              await _getOrderByOrderId(orderId);
            } else if (order?.id != null) {
              await _getOrderByOrderId(order!.id!);
            } else {
              setState(() {});
            }
          },
          onClose: () {},
        ),
      ),
    );
  }

  BoxDecoration get _cardDecoration => BoxDecoration(
    color: theme.colorScheme.surface,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: secondaryColor.withOpacity(0.10)),
  );

  /// Branded "Thank you" header with the order number.
  Widget _thankYouHeader(String? orderStatus) {
    final primary = theme.primaryColor;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primary.withOpacity(0.80)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle_rounded, color: Colors.white, size: 46),
          const SizedBox(height: 10),
          const Text(
            'Thank you for your order',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (_validOrderNo case final no?) ...[
            const SizedBox(height: 6),
            Text(
              'Order No.  #$no',
              style: const TextStyle(color: Colors.white, fontSize: 14.5),
            ),
          ],
          if (orderStatus != null && isLoading == false) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                orderStatus,
                style: const TextStyle(color: Colors.white, fontSize: 12.5),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Invoice-style summary: items with images, then subtotal / shipping / total.
  Widget _orderSummaryCard() {
    final lineItems = order?.lineItems ?? [];
    final isWalletTopup = lineItems.any((e) => e.name == 'Wallet Topup');
    final subtotal = isWalletTopup
        ? 0.0
        : order?.subtotal ?? order?.calculateSubtotal ?? 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).orderDetail,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          ...lineItems.map(
            (item) => ProductReviewWidget(
              item: item,
              isWalletTopup: isWalletTopup,
              currency: order?.currencyCode,
            ),
          ),
          Divider(color: secondaryColor.withOpacity(0.12), height: 24),
          if (!isWalletTopup) ...[
            PriceRowItemWidget(
              title: S.of(context).subtotal,
              total: subtotal,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: secondaryColor,
              ),
              isWalletTopup: isWalletTopup,
              currency: order?.currencyCode,
            ),
            if (order?.discountTotal case final discountTotal?)
              if (discountTotal > 0)
                PriceRowItemWidget(
                  title: S.of(context).discount,
                  total: discountTotal,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.error,
                  ),
                  isWalletTopup: isWalletTopup,
                  currency: order?.currencyCode,
                  isDiscount: true,
                ),
            PriceRowItemWidget(
              title: S.of(context).shipping,
              total: order?.totalShipping,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: secondaryColor,
              ),
              isWalletTopup: isWalletTopup,
              currency: order?.currencyCode,
            ),
          ],
          Divider(color: secondaryColor.withOpacity(0.12), height: 20),
          PriceRowItemWidget(
            title: S.of(context).total,
            total: order?.total,
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w800,
            ),
            isWalletTopup: isWalletTopup,
            currency: order?.currencyCode,
          ),
        ],
      ),
    );
  }

  /// "Delivery details" card built from the order's billing address.
  Widget? _customerCard() {
    final b = order?.billing;
    if (b == null) return null;
    final name = [
      b.firstName ?? '',
      b.lastName ?? '',
    ].where((e) => e.trim().isNotEmpty).join(' ').trim();
    final addressLine = [
      b.street,
      b.apartment,
      b.block,
      b.city,
      b.state,
      b.country,
    ].where((e) => (e ?? '').trim().isNotEmpty).join(', ');

    if (name.isEmpty &&
        (b.phoneNumber ?? '').isEmpty &&
        addressLine.isEmpty) {
      return null;
    }

    Widget row(IconData icon, String value) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: theme.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery details',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          if (name.isNotEmpty) row(Icons.person_outline_rounded, name),
          if ((b.phoneNumber ?? '').isNotEmpty)
            row(Icons.phone_outlined, b.phoneNumber!),
          if (addressLine.isNotEmpty)
            row(Icons.location_on_outlined, addressLine),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      order = widget.order;
    });

    if (order?.id != null) {
      // For WooCommerce
      _getOrderByOrderId(order!.id!);
    } else if (order?.number != null) {
      // For backward with other platforms
      _getOrderByOrderId(order!.number!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final orderStatus =
        order?.status == OrderStatus.unknown && order?.orderStatus != null
        ? order!.orderStatus
        : order?.status?.displayTitle(context);

    final body = ListView(
      physics: widget.hasScroll ? null : const NeverScrollableScrollPhysics(),
      shrinkWrap: widget.hasScroll == false,
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 200),
      children: <Widget>[
        _thankYouHeader(orderStatus),

        /// Thai PromptPay
        /// true: show Thank you message like on the web - https://tppr.me/xrNh1
        Services().thaiPromptPayBuilder(showThankMsg: true, order: order),

        if (order?.bacsInfo.isNotEmpty ?? false) ...[
          Text(
            S.of(context).ourBankDetails,
            style: TextStyle(fontSize: 18, color: secondaryColor),
          ),
          ...?order?.bacsInfo.map((e) => BankAccountInfo(bankInfo: e)),
          const SizedBox(height: 15),
        ],

        // Invoice-style order summary (items + totals).
        if (order != null && order!.lineItems.isNotEmpty) _orderSummaryCard(),

        // Customer / delivery details.
        if (_customerCard() case final card?) card,

        if (kWhatsAppOrderConfig
            .getValueList('paymentMethodIds')
            .contains(order?.paymentMethod))
          WhatsappOrder(order: order),
        if (!showPaymentButton)
          Text(
            S.of(context).orderSuccessMsg1,
            style: TextStyle(color: secondaryColor, height: 1.4, fontSize: 14),
          ),
      ],
    );

    return Stack(
      children: [
        body,
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: theme.colorScheme.surface),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showPaymentButton)
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _handlePayment,
                      icon: const Icon(Icons.payment, size: 20),
                      label: Text(
                        S.of(context).continueToPayment.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                if (userModel.user != null)
                  TextButton(
                    onPressed: () {
                      final user = Provider.of<UserModel>(
                        context,
                        listen: false,
                      ).user;
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(RouteList.orders, arguments: user);
                    },
                    child: Text(
                      S.of(context).showAllMyOrdered.toUpperCase(),
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                if (!showPaymentButton)
                  TextButton(
                    onPressed: () {
                      NavigateTools.navigateToDefaultTab(context);
                    },
                    child: Text(
                      S.of(context).backToShop.toUpperCase(),
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BankAccountInfo extends StatelessWidget {
  const BankAccountInfo({super.key, required this.bankInfo});

  final BankAccountItem bankInfo;

  @override
  Widget build(BuildContext context) {
    if ((bankInfo.accountName?.isEmpty ?? true) ||
        (bankInfo.accountNumber?.isEmpty ?? true)) {
      return const SizedBox();
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bankInfo.accountName ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 5),
          Row(
            children: <Widget>[
              Text(
                S.of(context).bank.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${bankInfo.bankName}',
                  textAlign: TextAlign.right,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: <Widget>[
              Text(
                S.of(context).accountNumber.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${bankInfo.accountNumber}',
                  textAlign: TextAlign.right,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          if (bankInfo.sortCode?.isNotEmpty ?? false) const SizedBox(height: 5),
          if (bankInfo.sortCode?.isNotEmpty ?? false)
            Row(
              children: <Widget>[
                Text(
                  S.of(context).sortCode.toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${bankInfo.sortCode}',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          if (bankInfo.iban?.isNotEmpty ?? false) const SizedBox(height: 5),
          if (bankInfo.iban?.isNotEmpty ?? false)
            Row(
              children: <Widget>[
                Text('IBAN', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${bankInfo.iban}',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          if (bankInfo.bic?.isNotEmpty ?? false) const SizedBox(height: 5),
          if (bankInfo.bic?.isNotEmpty ?? false)
            Row(
              children: <Widget>[
                Text(
                  'BIC / Swift: ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${bankInfo.bic}',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
