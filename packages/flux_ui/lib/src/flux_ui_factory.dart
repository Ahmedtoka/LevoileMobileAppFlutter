import 'widgets/flux_image.dart';

class FluxUIFactory {
  static void init({
    int? cacheImageWidth,
    String? imageProxy,
    String? webProxy,
  }) {
    FluxImage.setConfig(
      cacheImgeWidget: cacheImageWidth,
      imageProxy: imageProxy,
      webProxy: webProxy,
    );
  }
}
