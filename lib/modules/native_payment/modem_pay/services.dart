import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../services/services.dart';

class ModemPayServices {
  String get _paymentUrl {
    if (kModemPayConfig['production'] == true) {
      return 'https://checkout.modempay.com/api/pay';
    }
    return 'https://test.checkout.modempay.com/api/pay';
  }

  List get _paymentMethods {
    final paymentMethods = kModemPayConfig['paymentMethods'];
    if (paymentMethods is List && paymentMethods.isNotEmpty) {
      return paymentMethods;
    }

    if (paymentMethods is String && paymentMethods.isNotEmpty) {
      return paymentMethods.split(',').map((e) => e.trim()).toList();
    }

    return [];
  }

  String get _callbackUrl {
    return '${Services().api.domain}/wp-json/api/flutter_modempay/payment_success';
  }

  Future<String?> getCheckoutUrlViaForm({
    required String amount,
    required String? customerName,
    required String? customerEmail,
    required String? customerPhone,
    required String cancelUrl,
    required String returnUrl,
    required String? currency,
    required String orderId,
  }) async {
    try {
      final body = {
        'public_key': kModemPayConfig['publicKey'] ?? '',
        if (_paymentMethods.isNotEmpty)
          'payment_methods': _paymentMethods.join(','),
        'amount': amount,
        'currency': ?currency,
        'customer_name': ?customerName,
        'customer_email': ?customerEmail,
        'customer_phone': ?customerPhone,
        'cancel_url': cancelUrl,
        'return_url': returnUrl,
        'callback_url': _callbackUrl,
        'metadata[source]': 'mobile_app',
        'metadata[order_id]': orderId,
        'skip_url_validation': 'true',
      };
      final response = await http.post(
        _paymentUrl.toUri()!,
        body: body,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      final statusCode = response.statusCode;
      if (statusCode == 307 || statusCode == 200) {
        return response.body;
      }

      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        final body = jsonDecode(response.body);
        if (body['message'] != null) {
          throw body['message'];
        }
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getCheckoutUrlViaApi({
    required String amount,
    required String? customerName,
    required String? customerEmail,
    required String? customerPhone,
    required String cancelUrl,
    required String returnUrl,
    required String? currency,
    required String orderId,
  }) async {
    try {
      final params = {
        'data': {
          if (_paymentMethods.isNotEmpty) 'payment_methods': _paymentMethods,
          'amount': amount,
          'currency': ?currency,
          'customer_name': ?customerName,
          'customer_email': ?customerEmail,
          'customer_phone': ?customerPhone,
          'cancel_url': cancelUrl,
          'return_url': returnUrl,
          'callback_url': _callbackUrl,
          'skip_url_validation': true,
          'metadata': {'source': 'mobile_app', 'order_id': orderId},
          'from_sdk': false,
        },
      };
      final response = await http.post(
        'https://api.modempay.com/v1/payments'.toUri()!,
        body: jsonEncode(params),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${kModemPayConfig['secretKey'] ?? ''}',
        },
      );

      final statusCode = response.statusCode;
      final body = jsonDecode(response.body);
      if (statusCode == 200 || statusCode == 201) {
        return body['data'] is Map ? body['data']['payment_link'] : null;
      } else if (body['message'] != null) {
        throw body['message'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
