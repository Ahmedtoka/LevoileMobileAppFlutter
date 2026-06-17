import 'dart:async';
import 'dart:convert';

import 'package:flux_localization/flux_localization.dart';
import 'package:http_auth/http_auth.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/order/order.dart';
import '../../../services/service_config.dart';
import '../../../services/services.dart';
import 'currency_helper.dart';

class RazorUserInfo {
  final String? fullName;
  final String? phone;
  final String? email;

  RazorUserInfo({
    required this.fullName,
    required this.phone,
    required this.email,
  });
}

class RazorServices {
  final razorPay = Razorpay();

  final double price;
  final RazorUserInfo userInfo;
  final String currencyCode;
  final Order? order;
  final Function(bool)? onLoading;
  String? _invoiceId;
  final Function(PaymentSuccessResponse response, Order? order)
  onPaymentSuccess;
  final Function(PaymentFailureResponse response) onPaymentFailure;

  RazorServices({
    required this.userInfo,
    required this.currencyCode,
    required this.price,
    this.order,
    this.onLoading,
    required this.onPaymentSuccess,
    required this.onPaymentFailure,
  }) {
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (
      PaymentSuccessResponse response,
    ) async {
      if (ServerConfig().isWooType) {
        await _completeWooOrder(response.paymentId);
      }
      onPaymentSuccess(response, order);
    });
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, onPaymentFailure);
  }

  // `amount` must be in integer format
  int get amount => RazorpayCurrencyHelper.formatAmount(price, currencyCode);

  Future<String?> createRazorpayInvoice(params) async {
    try {
      var client = BasicAuthClient(
        kRazorpayConfig['keyId'],
        kRazorpayConfig['keySecret'],
      );
      final response = await client.post(
        'https://api.razorpay.com/v1/invoices'.toUri()!,
        body: jsonEncode(params),
        headers: {'Content-Type': 'application/json'},
      );
      final responseJson = jsonDecode(response.body);

      if (responseJson != null && responseJson['id'] != null) {
        return responseJson['id'];
      } else if (responseJson['message'] != null) {
        throw responseJson['message'];
      } else if (responseJson['error'] != null &&
          responseJson['error']['description'] != null) {
        throw responseJson['error']['description'];
      } else {
        throw S.current.cantCreateRazorpayInvoice;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initializePayment() async {
    final orderId = order?.id;
    if (orderId.isEmptyOrNull) {
      throw Exception('Order ID is required');
    }

    try {
      final invoiceId = await createRazorpayInvoice({
        'type': 'invoice',
        'description': 'Payment for Order $orderId',
        'currency': currencyCode,
        'customer': {
          'name': userInfo.fullName,
          'email': userInfo.email,
          'contact': userInfo.phone,
        },
        'line_items': [
          {
            'name': 'Order Payment',
            'description': 'Payment for order $orderId',
            'amount': amount,
            'currency': currencyCode,
            'quantity': 1,
          },
        ],
        'sms_notify': false,
        'email_notify': true,
      });
      _invoiceId = invoiceId;
    } catch (e) {
      _invoiceId = null;
    }
  }

  Future<bool> _completeWooOrder(String? razorpayPaymentId) async {
    try {
      var response = await httpPost(
        '${Services().api.domain}/wp-json/api/flutter_razorpay/payment_success'
            .toUri()!,
        body: jsonEncode({
          'orderId': order?.id,
          'razorpayPaymentId': razorpayPaymentId,
        }),
        headers: {'content-type': 'application/json'},
      );

      final body = jsonDecode(response.body);
      if (response.statusCode == 200 && body == true) {
        return true;
      } else if (body['message'] != null) {
        throw body['message'];
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  /// RAZORPAY PAYMENT
  Future<String?> createRazorpayOrder(params) async {
    try {
      var client = BasicAuthClient(
        kRazorpayConfig['keyId'],
        kRazorpayConfig['keySecret'],
      );
      final response = await client.post(
        'https://api.razorpay.com/v1/orders'.toUri()!,
        body: jsonEncode(params),
        headers: {'Content-Type': 'application/json'},
      );
      final responseJson = jsonDecode(response.body);
      if (responseJson != null && responseJson['id'] != null) {
        return responseJson['id'];
      } else if (responseJson['message'] != null) {
        throw responseJson['message'];
      } else if (responseJson['error'] != null &&
          responseJson['error']['description'] != null) {
        final description = responseJson['error']['description'];
        if (description.contains('Currency is not supported')) {
          throw S.current.currencyNotSupportedRazorpayMessage(
            params['currency'],
          );
        }
        throw responseJson['error']['description'];
      } else {
        throw S.current.cantCreateRazorpayOrder;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future openPayment() async {
    await initializePayment();
    try {
      final razorpayOrderId = await createRazorpayOrder({
        'amount': amount,
        'currency': currencyCode,
      });

      final orderId = order?.id;
      final orderNumber = order?.number;
      var options = {
        'key': kRazorpayConfig['keyId'],
        'amount': amount,
        'currency': currencyCode,
        'description': 'Order $orderId',
        'order_id': razorpayOrderId,
        if (_invoiceId != null) 'invoice_id': _invoiceId,
        'prefill': {'contact': userInfo.phone, 'email': userInfo.email},
        'notes': {
          'woocommerce_order_id': orderId,
          'woocommerce_order_number': orderNumber,
        },
      };
      razorPay.open(options);
    } catch (e) {
      rethrow;
    }
  }
}
