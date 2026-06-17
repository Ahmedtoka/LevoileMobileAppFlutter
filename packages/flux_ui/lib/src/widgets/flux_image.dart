import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_fade/image_fade.dart';
import 'package:lottie/lottie.dart';

import '../core/extensions/string_ext.dart';
import '../entities/flux_config/flux_image_config.dart';

class FluxImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final String? package;
  final Widget? errorWidget;
  final AlignmentGeometry alignment;
  final bool useExtendedImage;
  final double? aspectRatio;
  final BorderRadiusGeometry? borderRadius;

  /// Set value when init application
  static int cacheImageWidth = 700;
  static String imageProxy = '';
  static String webProxy = '';

  /// Set value when init application
  static void setConfig({
    int? cacheImgeWidget,
    String? imageProxy,
    String? webProxy,
  }) {
    if (cacheImgeWidget != null) {
      FluxImage.cacheImageWidth = cacheImgeWidget;
    }

    if (imageProxy?.isNotEmpty ?? false) {
      FluxImage.imageProxy = imageProxy!;
    }

    if (webProxy?.isNotEmpty ?? false) {
      FluxImage.webProxy = webProxy!;
    }
  }

  const FluxImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.package,
    this.errorWidget,
    this.alignment = AlignmentDirectional.center,
    this.useExtendedImage = true,
    this.aspectRatio,
    this.borderRadius,
  });

  FluxImage.fromConfig({super.key, required FluxImageConfig config})
    : imageUrl = config.url,
      width = config.styleConfig?.resolvedWidth,
      height = config.styleConfig?.resolvedHeight,
      fit = config.styleConfig?.fit,
      color = config.styleConfig?.color,
      alignment = config.styleConfig?.alignment ?? AlignmentDirectional.center,
      useExtendedImage = true,
      errorWidget = null,
      package = null,
      aspectRatio = config.styleConfig?.aspectRatio,
      borderRadius = config.styleConfig?.borderRadius;

  FluxImage.fromStyleConfig({
    Key? key,
    required String imageUrl,
    FluxImageStyleConfig? styleConfig,
  }) : this.fromConfig(
         key: key,
         config: FluxImageConfig(url: imageUrl, styleConfig: styleConfig),
       );

  bool get isSvgImage => imageUrl.split('.').last == 'svg';

  bool get isLottieImage => imageUrl.split('.').last == 'json';

  Widget _wrapWithAspectRatio(Widget child) {
    final wrappedChild = borderRadius != null
        ? ClipRRect(borderRadius: borderRadius!, child: child)
        : child;

    return aspectRatio != null
        ? AspectRatio(aspectRatio: aspectRatio!, child: wrappedChild)
        : wrappedChild;
  }

  Widget _buildAssetImage() {
    if (isSvgImage) {
      return _wrapWithAspectRatio(
        SvgPicture.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
          alignment: alignment,
          package: package,
        ),
      );
    }

    if (isLottieImage) {
      return _wrapWithAspectRatio(
        Lottie.asset(
          imageUrl,
          repeat: true,
          reverse: true,
          animate: true,
          width: width,
          height: height,
          alignment: alignment,
          fit: fit ?? BoxFit.contain,
        ),
      );
    }

    final cacheWidth = _calculateCacheWidth();

    if (useExtendedImage) {
      return _wrapWithAspectRatio(
        ExtendedImage.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          color: color,
          package: package,
          alignment: alignment,
          cacheWidth: cacheWidth,
        ),
      );
    }

    return _wrapWithAspectRatio(
      Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
        package: package,
        alignment: alignment,
        cacheWidth: cacheWidth,
      ),
    );
  }

  Widget _buildNetworkImage(String urlProxy) {
    if (isSvgImage) {
      return _wrapWithAspectRatio(
        SvgPicture.network(
          urlProxy,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
          alignment: alignment,
        ),
      );
    }

    if (isLottieImage) {
      return _wrapWithAspectRatio(
        Lottie.network(
          imageUrl,
          repeat: true,
          reverse: true,
          animate: true,
          width: width,
          height: height,
          alignment: alignment,
          fit: fit ?? BoxFit.contain,
        ),
      );
    }

    final cacheWidth = _calculateCacheWidth();

    if (useExtendedImage) {
      return _wrapWithAspectRatio(
        ExtendedImage.network(
          urlProxy,
          width: width,
          height: height,
          fit: fit,
          color: color,
          cache: true,
          alignment: alignment,
          cacheWidth: cacheWidth,
          loadStateChanged: _handleLoadState,
        ),
      );
    }

    return _wrapWithAspectRatio(
      Image.network(
        urlProxy,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        cacheWidth: cacheWidth,
        errorBuilder: _handleError,
        loadingBuilder: _handleLoading,
      ),
    );
  }

  Widget? _handleLoadState(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.completed:
        return state.completedWidget;
      case LoadState.failed:
        return errorWidget ?? const SizedBox();
      case LoadState.loading:
    }
    return null;
  }

  Widget _handleError(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return errorWidget ?? const SizedBox();
  }

  Widget _handleLoading(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    return loadingProgress == null ? child : const SizedBox();
  }

  int? _calculateCacheWidth() {
    /// cache width does not work on web
    if (kIsWeb) {
      return null;
    }
    return width != null && (width ?? 0) > 0
        ? (width! * 2.5).toInt()
        : cacheImageWidth;
  }

  String _processImageUrl() {
    if (kIsWeb) {
      var imageProxy = '';
      var urlProxy = '$imageProxy$imageUrl';

      if (FluxImage.imageProxy.isNotEmpty) {
        urlProxy = '${FluxImage.imageProxy}$urlProxy${width}x,q30/';
      }

      if (FluxImage.webProxy.isNotEmpty && imageProxy.isEmpty) {
        urlProxy = imageUrl.addWebProxy(webProxy: FluxImage.webProxy);
      }
      return urlProxy;
    }
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return const SizedBox();
    }

    if (!imageUrl.startsWith('http')) {
      return _buildAssetImage();
    }

    return _buildNetworkImage(_processImageUrl());
  }
}
