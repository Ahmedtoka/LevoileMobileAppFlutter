import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/theme/colors.dart';
import '../../../models/index.dart';
import '../../../modules/analytics/analytics.dart';
import '../../../widgets/product/cart_item/cart_item.dart';
import '../../../widgets/product/cart_item/cart_item_state_ui.dart';
import '../../../widgets/vendor/store_item.dart';

class ShoppingCartRows extends StatelessWidget {
  const ShoppingCartRows({
    super.key,
    required this.enabledTextBoxQuantity,
    this.cartStyle,
    this.separatedWidget,
  });

  final bool enabledTextBoxQuantity;
  final CartStyle? cartStyle;
  final Widget? separatedWidget;

  @override
  Widget build(BuildContext context) {
    final cartModel = context.read<CartModel>();
    final groupedItems = groupCartItems(cartModel);

    // Eagerly populate productList for analytics since ListView.builder
    // builds items lazily and Analytics must be triggered synchronously.
    final productList = {};
    for (final key in cartModel.productsInCart.keys) {
      final productId = Product.cleanProductID(key);
      final product = cartModel.getProductById(productId);
      if (product != null) {
        productList[key] = {
          'id': key,
          'product': product,
          'quantity': cartModel.productsInCart[key],
        };
      }
    }

    Analytics.triggerViewCart(productList, context);

    if (groupedItems.length > 1) {
      // Flatten groups into a linear list of items so every row is built
      // lazily, regardless of how many items a group contains.
      // Each group contributes: 1 store header + N cart items + 3 spacers.
      final flatItems = <_FlatCartItem>[];
      for (final group in groupedItems) {
        flatItems.add(_FlatCartItem.storeHeader(group.store));
        for (final key in group.itemKeys) {
          flatItems.add(_FlatCartItem.cartKey(key));
        }
        flatItems.add(_FlatCartItem.topSpacer());
        flatItems.add(_FlatCartItem.divider());
        flatItems.add(_FlatCartItem.bottomSpacer());
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: flatItems.length,
        itemBuilder: (context, index) {
          final item = flatItems[index];
          switch (item.type) {
            case _FlatCartItemType.storeHeader:
              return StoreCartItem(store: item.store);
            case _FlatCartItemType.cartKey:
              return renderCartItemByKey(
                context,
                item.key!,
                cartModel,
                productList,
                true,
                enabledTextBoxQuantity,
                cartStyle,
              );
            case _FlatCartItemType.topSpacer:
            case _FlatCartItemType.bottomSpacer:
              return const SizedBox(height: 10.0);
            case _FlatCartItemType.divider:
              return Container(color: kGrey200, height: 10);
          }
        },
      );
    }

    final keys = cartModel.productsInCart.keys.toList();

    if (separatedWidget != null && keys.isNotEmpty) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: keys.length,
        separatorBuilder: (_, __) => separatedWidget!,
        itemBuilder: (context, index) {
          return renderCartItemByKey(
            context,
            keys[index],
            cartModel,
            productList,
            false,
            enabledTextBoxQuantity,
            cartStyle,
          );
        },
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        return renderCartItemByKey(
          context,
          keys[index],
          cartModel,
          productList,
          false,
          enabledTextBoxQuantity,
          cartStyle,
        );
      },
    );
  }

  List<GroupedStoreItems> groupCartItems(CartModel model) {
    var groupedItems = <GroupedStoreItems>[];
    for (var key in model.productsInCart.keys) {
      var productId = Product.cleanProductID(key);
      var product = model.getProductById(productId);
      if (product?.store?.id != null) {
        var groupedItem = groupedItems.firstWhereOrNull(
          (item) => item.store?.id == product?.store?.id,
        );
        if (groupedItem != null) {
          groupedItem.itemKeys.add(key);
        } else {
          groupedItems.add(
            GroupedStoreItems(store: product?.store, itemKeys: [key]),
          );
        }
      }
    }
    return groupedItems;
  }

  Widget renderCartItemByKey(
    BuildContext context,
    String key,
    CartModel model,
    Map productList,
    bool multiStore,
    bool enabledTextBoxQuantity,
    CartStyle? cartStyle,
  ) {
    var productId = Product.cleanProductID(key);
    var product = model.getProductById(productId);

    if (product != null) {
      productList[key] = {
        'id': key,
        'product': product,
        'quantity': model.productsInCart[key],
      };

      return ShoppingCartRow(
        enabledTextBoxQuantity: enabledTextBoxQuantity,
        enableBottomDivider: !multiStore,
        enableTopDivider: multiStore,
        cartStyle: cartStyle ?? kCartDetail['style'].toString().toCartStyle(),
        showStoreName: !multiStore,
        product: product,
        cartItemMetaData: model.cartItemMetaDataInCart[key]?.copyWith(
          variation: model.getProductVariationById(key),
        ),
        quantity: model.productsInCart[key],
        onRemove: () {
          Analytics.triggerRemoveProductFromCart(product, context);
          model.removeItemFromCart(key);
          model.updateStateCheckoutButton();
        },
        onChangeQuantity: (val) {
          var message = model.updateQuantity(product, key, val);
          model.updateStateCheckoutButton();
          if (message.isNotEmpty) {
            final snackBar = SnackBar(
              content: Text(message),
              duration: Duration(
                milliseconds: kAdvanceConfig.timeShowToastMessage ?? 1000,
              ),
            );
            Future.delayed(
              const Duration(milliseconds: 300),
              () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
            );

            return false;
          }
          return true;
        },
      );
    }
    return const SizedBox();
  }
}

class GroupedStoreItems {
  const GroupedStoreItems({this.store, required this.itemKeys});
  final Store? store;
  final List<String> itemKeys;
}

enum _FlatCartItemType {
  storeHeader,
  cartKey,
  topSpacer,
  divider,
  bottomSpacer,
}

class _FlatCartItem {
  _FlatCartItem._({required this.type, this.store, this.key});

  factory _FlatCartItem.storeHeader(Store? store) =>
      _FlatCartItem._(type: _FlatCartItemType.storeHeader, store: store);
  factory _FlatCartItem.cartKey(String key) =>
      _FlatCartItem._(type: _FlatCartItemType.cartKey, key: key);
  factory _FlatCartItem.topSpacer() =>
      _FlatCartItem._(type: _FlatCartItemType.topSpacer);
  factory _FlatCartItem.divider() =>
      _FlatCartItem._(type: _FlatCartItemType.divider);
  factory _FlatCartItem.bottomSpacer() =>
      _FlatCartItem._(type: _FlatCartItemType.bottomSpacer);

  final _FlatCartItemType type;
  final Store? store;
  final String? key;
}
