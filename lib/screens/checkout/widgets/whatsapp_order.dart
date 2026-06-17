import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/utils/logs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/config.dart';
import '../../../models/order/index.dart';

enum _ReplacedParams {
  billingName('{billing_name}'),
  billingEmail('{billing_email}'),
  billingPhone('{billing_phone}'),
  billingAddress('{billing_address}'),
  shippingName('{shipping_name}'),
  shippingEmail('{shipping_email}'),
  shippingPhone('{shipping_phone}'),
  shippingAddress('{shipping_address}'),
  orderId('{order_id}'),
  orderDetails('{order_details}'),
  totalAmount('{total_amount}');

  final String param;
  const _ReplacedParams(this.param);
}

class WhatsappOrder extends StatefulWidget {
  const WhatsappOrder({super.key, this.order});

  final Order? order;

  @override
  State<WhatsappOrder> createState() => _WhatsappOrderState();
}

class _WhatsappOrderState extends State<WhatsappOrder> {
  Order? get _order => widget.order;
  String get _phone =>
      kWhatsAppOrderConfig['phoneNumber']?.toString().replaceAll('+', '') ?? '';

  String _buildMessage(String template) {
    var message = template;
    for (var element in _ReplacedParams.values) {
      switch (element) {
        case _ReplacedParams.billingName:
          message = message.replaceAll(
            element.param,
            _order?.billing?.fullName ?? '',
          );
          break;
        case _ReplacedParams.billingPhone:
          message = message.replaceAll(
            element.param,
            _order?.billing?.phoneNumber ?? '',
          );
          break;
        case _ReplacedParams.billingEmail:
          message = message.replaceAll(
            element.param,
            _order?.billing?.email ?? '',
          );
          break;
        case _ReplacedParams.billingAddress:
          message = message.replaceAll(
            element.param,
            _order?.billing?.fullInfoAddress ?? '',
          );
          break;
        case _ReplacedParams.shippingName:
          message = message.replaceAll(
            element.param,
            _order?.shipping?.fullName ?? '',
          );
          break;
        case _ReplacedParams.shippingPhone:
          message = message.replaceAll(
            element.param,
            _order?.shipping?.phoneNumber ?? '',
          );
          break;
        case _ReplacedParams.shippingEmail:
          message = message.replaceAll(
            element.param,
            _order?.shipping?.email ?? '',
          );
          break;
        case _ReplacedParams.shippingAddress:
          message = message.replaceAll(
            element.param,
            _order?.shipping?.fullInfoAddress ?? '',
          );
          break;
        case _ReplacedParams.orderId:
          message = message.replaceAll(element.param, _order?.id ?? '');
          break;
        case _ReplacedParams.orderDetails:
          final buffer = StringBuffer();
          for (var item in _order?.lineItems ?? <ProductItem>[]) {
            buffer.writeln('${item.name} x ${item.quantity}');
          }
          message = message.replaceAll(element.param, buffer.toString());
          break;
        case _ReplacedParams.totalAmount:
          var price = '';
          final currency = _order?.currencyCode ?? '';
          final total = _order?.total?.toString() ?? '';
          if (currency.isNotEmpty && total.isNotEmpty) {
            price = '$total ($currency)';
          } else {
            price = total;
          }
          message = message.replaceAll(element.param, price);
          break;
      }
    }
    return message;
  }

  void _onNavigateToWhatsApp() {
    final messageTemplate = kWhatsAppOrderConfig['message'] ?? '';

    final message = _buildMessage(messageTemplate);

    try {
      Tools.launchURL(
        'https://wa.me/$_phone?text=${Uri.encodeComponent(message)}',
        mode: LaunchMode.externalApplication,
      );
    } catch (e, stackTrace) {
      printError('Error launching WhatsApp URL: $e', stackTrace);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_phone.isNotEmpty &&
          (kWhatsAppOrderConfig['autoOpenWhatsAppAfterOrder'] == true)) {
        // Automatically open WhatsApp chat when the widget is loaded
        _onNavigateToWhatsApp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_phone.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).sendOrderViaWhatsAppMsg,
          style: TextStyle(
            height: 1.4,
            fontSize: 14,
            color: theme.colorScheme.secondary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              Expanded(
                child: ButtonTheme(
                  height: 45,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green,
                      elevation: 0,
                    ),
                    icon: const FluxImage(
                      imageUrl: 'assets/icons/brands/whatsapp.svg',
                      color: Colors.green,
                      width: 16,
                      height: 16,
                    ),
                    label: Text(S.of(context).sendOrderViaWhatsApp),
                    onPressed: _onNavigateToWhatsApp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
