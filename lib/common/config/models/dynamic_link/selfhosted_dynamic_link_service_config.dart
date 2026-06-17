import 'dynamic_link_service_config.dart';

enum CustomPath {
  product,
  productList,
  category,
  brand,
  tag,
  vendor,
  listing,
  cart,
  blog,
  none;

  factory CustomPath.fromString(String value) {
    return CustomPath.values.firstWhere(
      (e) => e.name == value,
      orElse: () => CustomPath.none,
    );
  }
}

/// Configuration for SelfHosted service
class SelfHostedDynamicLinkServiceConfig extends DynamicLinkServiceConfig {
  /// List of domains that this app should handle
  /// Example: ['yourdomain.com', 'www.yourdomain.com']
  final List<String> supportedDomains;

  /// Whether to handle all HTTPS links for supported domains
  final bool handleHttpsLinks;

  /// Whether to handle custom scheme links
  final bool handleCustomScheme;

  /// Custom scheme to handle (e.g., 'myapp')
  final String? customScheme;

  final Map<CustomPath, List<String>> customPaths;

  SelfHostedDynamicLinkServiceConfig({
    this.supportedDomains = const [],
    this.handleHttpsLinks = true,
    this.handleCustomScheme = false,
    this.customScheme,
    this.customPaths = const {},
  });

  @override
  bool get allowShareLink => supportedDomains.isNotEmpty;

  /// Check if a URL is supported by this configuration
  bool isSupportedLink(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;

    // Check custom scheme
    if (handleCustomScheme &&
        customScheme != null &&
        uri.scheme == customScheme) {
      // Also validate the host against supportedDomains to avoid
      // intercepting links meant for other services (e.g. FluxDynamicLink)
      if (supportedDomains.isEmpty) return true;
      final host = uri.host.toLowerCase();
      return supportedDomains.any(
        (domain) =>
            host == domain.toLowerCase() ||
            host.endsWith('.${domain.toLowerCase()}'),
      );
    }

    // Check HTTPS links
    if (handleHttpsLinks && (uri.scheme == 'https' || uri.scheme == 'http')) {
      final host = uri.host.toLowerCase();
      return supportedDomains.any(
        (domain) =>
            host == domain.toLowerCase() ||
            host.endsWith('.${domain.toLowerCase()}'),
      );
    }

    return false;
  }

  /// Validate configuration
  bool get isValidate {
    if (supportedDomains.isEmpty && !handleCustomScheme) {
      return false;
    }

    if (handleCustomScheme && (customScheme?.isEmpty ?? true)) {
      return false;
    }

    return true;
  }

  factory SelfHostedDynamicLinkServiceConfig.fromJson(Map json) {
    final customPaths = Map.from(json['customPaths'] ?? {}).map(
      (key, value) =>
          MapEntry(CustomPath.fromString(key), List<String>.from(value)),
    );
    return SelfHostedDynamicLinkServiceConfig(
      supportedDomains: List<String>.from(json['supportedDomains'] ?? []),
      handleHttpsLinks: json['handleHttpsLinks'] ?? true,
      handleCustomScheme: json['handleCustomScheme'] ?? false,
      customScheme: json['customScheme'],
      customPaths: customPaths,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'supportedDomains': supportedDomains,
      'handleHttpsLinks': handleHttpsLinks,
      'handleCustomScheme': handleCustomScheme,
      'customScheme': customScheme,
      'customPaths': customPaths.map((key, value) => MapEntry(key.name, value)),
    };
  }

  SelfHostedDynamicLinkServiceConfig copyWith({
    List<String>? supportedDomains,
    bool? handleHttpsLinks,
    bool? handleCustomScheme,
    String? customScheme,
  }) {
    return SelfHostedDynamicLinkServiceConfig(
      supportedDomains: supportedDomains ?? this.supportedDomains,
      handleHttpsLinks: handleHttpsLinks ?? this.handleHttpsLinks,
      handleCustomScheme: handleCustomScheme ?? this.handleCustomScheme,
      customScheme: customScheme ?? this.customScheme,
    );
  }
}
