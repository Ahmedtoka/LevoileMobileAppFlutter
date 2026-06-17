import '../../common/config/models/dynamic_link/dynamic_link.dart';
import '../../common/constants.dart';
import '../../models/entities/user.dart';
import 'dynamic_link_service.dart';

class SelfHostedDynamicLinkService extends DynamicLinkService {
  SelfHostedDynamicLinkService({
    required super.linkService,
    required this.selfhostedConfig,
  }) : super(DynamicLinkType.selfhosted);

  final SelfHostedDynamicLinkServiceConfig selfhostedConfig;

  @override
  Future<void> initialize() async {
    if (!selfhostedConfig.isValidate) {
      printLog('[SelfHostedDynamicLinkService] selfhostedConfig is not valid');
      return;
    }

    printLog('[SelfHostedDynamicLinkService] Initialized successfully');
    printLog(
      '[SelfHostedDynamicLinkService] Supported domains: ${selfhostedConfig.supportedDomains}',
    );
    if (selfhostedConfig.handleCustomScheme &&
        selfhostedConfig.customScheme != null) {
      printLog(
        '[SelfHostedDynamicLinkService] Custom scheme: ${selfhostedConfig.customScheme}',
      );
    }
  }

  Future<void> _handleUri(Uri uri) async {
    try {
      if (isSupportedLink(uri.toString())) {
        await linkService.handleWebLink(uri);
      } else {
        printLog('[SelfHostedDynamicLinkService] Unsupported link: $uri');
      }
    } catch (error) {
      printLog('[SelfHostedDynamicLinkService] Error handling URI: $error');
    }
  }

  @override
  Future<String?> createDynamicLink(
    String url, {
    required User? user,
    String? title,
    String? image,
    String? description,
  }) async {
    // It doesn't create dynamic links, it just handles incoming links
    // For creating shareable links, you might want to return the original URL
    // or integrate with a URL shortener service

    if (isSupportedLink(url)) {
      printLog(
        '[SelfHostedDynamicLinkService] Returning original URL for sharing: $url',
      );
      return url;
    }

    printLog(
      '[SelfHostedDynamicLinkService] Cannot create dynamic link for unsupported URL: $url',
    );
    return null;
  }

  @override
  Future<void> handleLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null) {
      await _handleUri(uri);
    } else {
      printLog('[SelfHostedDynamicLinkService] Invalid URL format: $url');
    }
  }

  @override
  bool isSupportedLink(String url) {
    return selfhostedConfig.isSupportedLink(url);
  }

  /// Dispose resources
  Future<void> dispose() async {
    printLog('[SelfHostedDynamicLinkService] Disposed');
  }
}
