import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/config.dart';
import 'services.dart';

class ModemPayPayment extends StatefulWidget {
  const ModemPayPayment({
    super.key,
    this.onSuccess,
    this.onError,
    required this.price,
    this.currency,
    this.customerEmail,
    this.customerPhone,
    this.customerName,
    required this.orderId,
  });

  final Function(String transactionId)? onSuccess;
  final Function(String?)? onError;
  final double price;
  final String? currency;
  final String? customerEmail;
  final String? customerPhone;
  final String? customerName;
  final String orderId;

  @override
  State<ModemPayPayment> createState() => _ModemPayPaymentState();
}

class _ModemPayPaymentState extends State<ModemPayPayment> {
  String get _url => kModemPayConfig['returnUrl']?.toString() ?? '';
  String get returnUrl => _url.isEmpty ? 'fluxstore://inspireui.com' : _url;
  String get successUrl => '$returnUrl/modempay_payment_success';
  String get errorUrl => '$returnUrl/modempay_payment_error';

  String? checkoutUrl;
  bool _isLoading = true;
  ModemPayServices services = ModemPayServices();
  late final WebViewController controller;

  void _onCancelPayment() {
    widget.onError?.call('Payment cancelled by user');
  }

  Future<bool> _handleAndroidBack() async {
    _onCancelPayment();
    return true;
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        final url = await services.getCheckoutUrlViaForm(
          amount: widget.price.toString(),
          customerName: widget.customerName,
          customerEmail: widget.customerEmail,
          customerPhone: widget.customerPhone,
          cancelUrl: errorUrl,
          returnUrl: successUrl,
          currency: widget.currency,
          orderId: widget.orderId,
        );

        setState(() {
          _isLoading = false;
          checkoutUrl = url;

          controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) async {
                  final url = request.url;
                  if (url.startsWith(successUrl)) {
                    final uri = Uri.parse(url);
                    final transactionId = uri.queryParameters['transaction_id'];

                    setState(() {
                      _isLoading = true;
                    });

                    widget.onSuccess?.call(transactionId ?? '');
                    Navigator.of(context).pop();
                  } else if (url.startsWith(errorUrl)) {
                    setState(() {
                      _isLoading = true;
                    });

                    _onCancelPayment();
                    Navigator.of(context).pop();
                  } else if ([
                    'wave://',
                    'intent://',
                  ].any((scheme) => url.startsWith(scheme))) {
                    await Tools.launchURL(
                      url,
                      mode: LaunchMode.externalNonBrowserApplication,
                    );
                    return NavigationDecision.prevent;
                  } else if ([
                    'https://play.google.com',
                    'https://apps.apple.com',
                  ].any((scheme) => url.startsWith(scheme))) {
                    await Tools.launchURL(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                    return NavigationDecision.prevent;
                  }

                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(checkoutUrl.toString()));
        });
      } catch (e) {
        widget.onError?.call(e.toString());
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScopeWidget(
      onWillPop: _handleAndroidBack,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _onCancelPayment();
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0.0,
        ),
        body: !_isLoading && checkoutUrl != null
            ? WebViewWidget(controller: controller)
            : kLoadingWidget(context),
      ),
    );
  }
}
