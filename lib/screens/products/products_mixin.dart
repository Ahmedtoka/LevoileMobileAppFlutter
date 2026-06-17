import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../common/tools/crypt_tools.dart';
import '../../common/tools/flash.dart';
import '../../models/product_model.dart';
import '../../models/user_model.dart';
import '../../services/index.dart';

mixin ProductsMixin {
  Future<void> shareProductsLink(
    BuildContext context, {
    ProductsShareLinkType type = ProductsShareLinkType.filterOne,
    Map<String, dynamic>? params,
  }) async {
    unawaited(
      FlashHelper.message(
        context,
        message: S.of(context).generatingLink,
        duration: const Duration(seconds: 2),
      ),
    );
    var productModel = Provider.of<ProductModel>(context, listen: false);
    var currentCategoryId = productModel.categoryIds;
    var currentTagId = productModel.tagIds;
    String? url;

    switch (type) {
      case ProductsShareLinkType.productsList:
        if (params != null && params.isNotEmpty) {
          final validParams = Map.from(params)
            ..removeWhere((key, value) => value == null);

          final base64Params = base64Encode(
            utf8.encode(jsonEncode(validParams)),
          );
          url =
              '${ServerConfig().url}/?shared-mobile-params=${CryptTools.encrypt(base64Params)}';
          break;
        } else {
          continue defautlCase;
        }

      case ProductsShareLinkType.filterOne:
        if (currentCategoryId?.length == 1) {
          url = await Services().linkService.generateProductCategoryUrl(
            currentCategoryId?.first,
          );
          break;
        } else if (currentTagId?.length == 1) {
          url = await Services().linkService.generateProductTagUrl(
            currentTagId?.first,
          );
          break;
        } else {
          continue defautlCase;
        }

      defautlCase:
      default:
        url = ServerConfig().url;
        break;
    }

    if (url != null && url.isNotEmpty) {
      final user = Provider.of<UserModel>(context, listen: false).user;
      final dynamicLink = await Services().dynamicLinkService.createDynamicLink(
        url,
        user: user,
      );

      if (dynamicLink != null) {
        unawaited(Tools.share(text: dynamicLink, context: context));
        return;
      }
    }

    unawaited(
      FlashHelper.errorMessage(
        context,
        message: S.of(context).failedToGenerateLink,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

enum ProductsShareLinkType {
  productsList,
  filterOne,
  unknown,

  /// NOTE: If you need to add another type of share link
  /// for example: share link for list blogs, add it here
}
