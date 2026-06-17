import 'package:flutter/foundation.dart';

extension FluxDynamicStringExt on String {
  String addWebProxy({String? webProxy, bool isForceUseProxy = false}) {
    var url = this;

    if (kIsWeb || isForceUseProxy) {
      if (webProxy?.isNotEmpty ?? false) {
        if (contains(webProxy!) == false) {
          url = replaceAll('https://', '').replaceAll('http://', '');
          final proxyURL = '$webProxy$url';
          return proxyURL;
        }
      }
    }
    return this;
  }

  // Clone from `lib/common/extensions/string_ext.dart`
  bool isTheSameDomain(String? domain) {
    if (domain == null || domain.isEmpty) return false;

    final uri = Uri.tryParse(this);
    if (uri == null) return false;

    if (uri.host != domain) return false;

    return true;
  }
}
