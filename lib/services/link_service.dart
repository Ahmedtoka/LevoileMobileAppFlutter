import 'dart:async';
import 'dart:convert';

import '../app.dart';
import '../common/config.dart';
import '../common/config/models/index.dart';
import '../common/constants.dart';
import '../common/tools.dart';
import '../common/tools/crypt_tools.dart';
import '../models/entities/index.dart';
import '../modules/native_payment/modem_pay/modempay_deeplink_handler.dart';
import '../routes/flux_navigate.dart';
import '../screens/index.dart';
import 'base_services.dart';
import 'service_config.dart';
import 'services.dart';

class LinkService {
  final BaseServices _serviceApi;

  LinkService(this._serviceApi);

  Future<String?> generateProductCategoryUrl(dynamic productCategoryId) async {
    final cate = await _serviceApi.getProductCategoryById(
      categoryId: productCategoryId,
    );
    var url;
    if (cate != null) {
      if (ServerConfig().isShopify) {
        url = cate.onlineStoreUrl;
      } else {
        url = '${ServerConfig().url}/product-category/${cate.slug}';
      }
    }
    return url;
  }

  Future<String?> generateProductTagUrl(dynamic productTagId) async {
    final tag = await _serviceApi.getTagById(tagId: productTagId.toString());
    var url;
    if (tag != null) {
      url = '${ServerConfig().url}/product-tag/${tag.slug}';
    }
    return url;
  }

  Future<String?> generateProductBrandUrl(dynamic brandCategoryId) async {
    final brand = await _serviceApi.getBrandById(brandCategoryId);
    var url;
    if (brand != null) {
      url = '${ServerConfig().url}/brand/${brand.slug ?? ''}';
    }
    return url;
  }

  Future<void> handleWebLink(Uri uri) async {
    final context = App.fluxStoreNavigatorKey.currentContext!;
    var didShowLoading = false;

    // Call this function manually to ensure only supported links are processed.
    // Avoid popping the current screen for unsupported links (e.g.,
    // FirebaseAuth links).
    void beforeHandle() {
      context.navigator.popUntil((route) => route.isFirst);
      didShowLoading = true;
      LoadingHelper.show();
    }

    try {
      var initUri = uri;

      // If the link has query parameters, it will be parsed
      final queryParameters = initUri.queryParameters;

      final navigationConfig = {};

      // Cart
      final cartPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.cart],
        '/cart/',
      ];
      if (cartPaths.any(initUri.path.contains)) {
        navigationConfig['screen'] = 'cart';
      }
      final shouldHandleNavigationDirectly = [
        'screen',
        'tab_number',
      ].any(queryParameters.containsKey);
      if (shouldHandleNavigationDirectly) {
        navigationConfig.addAll(queryParameters);
      }

      if (navigationConfig.isNotEmpty) {
        beforeHandle();
        return NavigateTools.onTapNavigateOptions(
          config: navigationConfig,
          context: context,
        );
      }

      // Handle ModemPay payment callback
      if (ModemPayDeeplinkHandler.canHandle(uri)) {
        beforeHandle();
        final handled = await ModemPayDeeplinkHandler.handleDeeplink(
          context,
          uri,
        );
        if (handled) {
          return;
        }
      }

      // _showLoading(context);

      final url = initUri.toString();
      final path = initUri.path;

      final productPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.product],
        '/product/',
      ];
      final productListPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.productList],
        '/products/',
        '/shop/',
      ];
      final categoryPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.category],
        '/product-category/',
        '/collections/',
      ];
      final brandPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.brand],
        '/brand/',
      ];
      final tagPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.tag],
        '/product-tag/',
      ];
      final vendorPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.vendor],
        '/store/',
      ];
      final listingPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.listing],
        '/listing/',
      ];
      final blogPaths = [
        ...?customPathsToHandleDeepLink[CustomPath.blog],
        '/blog/',
        '/post/',
      ];

      /// PRODUCT DETAIL CASE
      if (productPaths.any(path.contains)) {
        beforeHandle();

        /// Note: the deepLink URL will look like: https://mstore.io/product/stitch-detail-tunic-dress/
        final product = await Services().api.getProductByPermalink(path);
        if (product != null) {
          unawaited(
            FluxNavigate.pushNamed(
              RouteList.productDetail,
              arguments: product,
              context: context,
            ),
          );
        }

        /// PRODUCTS LIST CASE
      } else if (productListPaths.any(path.contains)) {
        beforeHandle();
        unawaited(
          FluxNavigate.pushNamed(
            RouteList.backdrop,
            arguments: BackDropArguments(data: [], config: {}),
            context: context,
          ),
        );

        /// PRODUCT CATEGORY CASE
      } else if (categoryPaths.any(path.contains)) {
        beforeHandle();
        final category = await Services().api.getProductCategoryByPermalink(
          path,
        );
        if (category != null) {
          unawaited(
            FluxNavigate.pushNamed(
              RouteList.backdrop,
              context: context,
              arguments: BackDropArguments(
                cateId: category.id,
                cateName: category.name,
              ),
            ),
          );
        }

        /// PRODUCT TAGS CASE
      } else if (tagPaths.any(path.contains)) {
        beforeHandle();
        final slug = Uri.tryParse(path)?.pathSegments.last;

        if (slug == null) throw '';

        final tag = await Services().api.getTagBySlug(slug);
        if (tag != null) {
          unawaited(
            FluxNavigate.pushNamed(
              RouteList.backdrop,
              arguments: BackDropArguments(tag: tag.id.toString()),
              context: context,
            ),
          );
        }

        /// VENDOR DETAIL CASE
      } else if (vendorPaths.any(path.contains)) {
        beforeHandle();
        final vendor = await Services().api.getStoreByPermalink(path);
        if (vendor != null) {
          unawaited(
            FluxNavigate.pushNamed(
              RouteList.storeDetail,
              context: context,
              arguments: StoreDetailArgument(store: vendor),
            ),
          );
        }

        /// BRAND CASE
      } else if (brandPaths.any(path.contains)) {
        beforeHandle();
        final slug = Uri.tryParse(path)?.pathSegments.last;

        if (slug == null) throw '';

        final brand = await Services().api.getBrandBySlug(slug);
        if (brand != null) {
          unawaited(
            FluxNavigate.pushNamed(
              RouteList.backdrop,
              context: context,
              arguments: BackDropArguments(
                brandId: brand.id,
                brandName: brand.name,
                brandImg: brand.image,
              ),
            ),
          );
        }

        /// LISTING DETAIL CASE
      } else if (listingPaths.any(path.contains)) {
        beforeHandle();
        final listing = await _serviceApi.getBlogByPermalink(path);
        if (listing != null) {
          final product = await _serviceApi.getProduct(listing.id);
          if (product != null) {
            unawaited(
              FluxNavigate.pushNamed(
                RouteList.productDetail,
                context: context,
                arguments: product,
              ),
            );
          }
        }

        /// BLOG CASE
      } else if (blogPaths.any(path.contains)) {
        beforeHandle();
        final blog = await Services().api.getBlogByPermalink(url);
        if (blog != null) {
          unawaited(
            FluxNavigate.pushNamed(
              RouteList.detailBlog,
              context: context,
              arguments: BlogDetailArguments(blog: blog),
            ),
          );
        }
      } else {
        final base64Params = queryParameters['shared-mobile-params']
            ?.toString();
        final decryptedParams = base64Params != null
            ? CryptTools.decrypt(base64Params)
            : null;
        final paramsString = decryptedParams != null
            ? utf8.decode(base64Decode(decryptedParams))
            : null;
        final params = paramsString != null ? jsonDecode(paramsString) : {};

        /// PRODUCT LIST WITH FILTER CASE
        if (params is Map && params.isNotEmpty) {
          beforeHandle();
          unawaited(
            FluxNavigate.pushNamed(
              RouteList.backdrop,
              arguments: BackDropArguments(config: params, data: []),
              context: context,
            ),
          );
        } else {
          /// BLOG CASE FALLBACK FOR BACKWARD COMPATIBILITY
          var blog = await Services().api.getBlogByPermalink(url);
          if (blog != null) {
            beforeHandle();
            unawaited(
              FluxNavigate.pushNamed(
                RouteList.detailBlog,
                context: context,
                arguments: BlogDetailArguments(blog: blog),
              ),
            );
          }
        }
      }
    } catch (err) {
      // _showErrorMessage(context);
    } finally {
      if (didShowLoading) {
        LoadingHelper.hide();
      }
    }
  }

  //
  // static void _showLoading(context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(S.of(context).loadingLink),
  //       duration: const Duration(seconds: 3),
  //       action: SnackBarAction(
  //         label: 'DISMISS',
  //         onPressed: () {
  //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //         },
  //       ),
  //     ),
  //   );
  // }
  //
  // static void _showErrorMessage(context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(S.of(context).canNotLoadThisLink),
  //       duration: const Duration(seconds: 2),
  //       action: SnackBarAction(
  //         label: 'DISMISS',
  //         onPressed: () {
  //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //         },
  //       ),
  //     ),
  //   );
  // }
}
