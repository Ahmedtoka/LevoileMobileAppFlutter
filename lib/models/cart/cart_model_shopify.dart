import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

import '../../common/tools.dart';
import '../../services/services.dart';
import '../../widgets/product/lv_purchase_limit.dart';
import '../index.dart';
import '../mixins/language_mixin.dart';
import 'cart_item_meta_data.dart';
import 'mixin/index.dart';

class CartModelShopify
    with
        ChangeNotifier,
        CartMixin,
        MagentoMixin,
        AddressMixin,
        LocalMixin,
        CurrencyMixin,
        CouponMixin,
        VendorMixin,
        ShopifyMixin,
        LanguageMixin,
        OrderDeliveryMixin
    implements CartModel {
  @override
  Future<void> initData() async {
    resetValues();
    await getAddress();
    getCurrency();
  }

  @override
  double? getSubTotal() {
    return productsInCart.keys.fold(0.0, (sum, key) {
      var productVariation = cartItemMetaDataInCart[key]?.variation;
      if (productVariation?.price?.isNotEmpty ?? false) {
        return (sum ?? 0) +
            double.parse(productVariation!.price!) * productsInCart[key]!;
      } else {
        var price = PriceTools.getPriceProductValue(item[key], onSale: true)!;
        if (price.isNotEmpty) {
          return (sum ?? 0) + double.parse(price) * productsInCart[key]!;
        }
        return sum;
      }
    });
  }

  @override
  double? getTax() {
    return cartDataShopify?.cost.totalTaxAmount?.amount;
  }

  @override
  double? getTotal() {
    return cartDataShopify?.cost.totalAmount.amount ?? getSubTotal() ?? 0;
  }

  @override
  FutureOr<(bool, String)> addProductToCart({
    required BuildContext context,
    required Product product,
    int quantity = 1,
    Function? notify,
    isSaveLocal = true,
    isSaveRemote = true,
    CartItemMetaData? cartItemMetaData,
    // Le Voile: an EXTRA optional argument on top of the interface, which
    // Dart allows an override to add. Only this class's own currency re-add
    // passes it; every caller typed as CartModel is unaffected.
    bool enforceLimit = true,
  }) {
    var message = '';
    var defaultVariation = cartItemMetaData?.variation;
    var key = product.id.toString();
    // Le Voile: `item[key] = product` used to sit here. It moved below the
    // limit check, because that check can now refuse a FIRST add — the stock
    // template could only ever refuse a repeat — and registering the product
    // before refusing leaves an entry in `item` with no matching row in
    // productsInCart, for the rest of the session.
    if (defaultVariation?.id == null) {
      defaultVariation = product.variations?.firstWhere(
        (element) => (element.inStock ?? false),
      );
    }

    key += '-${defaultVariation!.id}';

    var quantityOfProductInCart = productsInCart[key] ?? 0;

    // Le Voile: ONE limit, computed the same way the cart row computes it
    // (cart_item.dart:100-107), and applied to BOTH the first add and every
    // later one.
    //
    // 🔴 What the stock template did, and why it left customers stranded:
    //
    //   * the first add — `!containsKey` — was written straight into the cart
    //     with NO check at all;
    //   * `defaultVariation.stockQuantity ?? 0` turned "Shopify told us
    //     nothing" into "the limit is 0", and `== 0` is never true once one
    //     unit is in the cart, so the stock check silently did nothing;
    //   * `==` instead of `>=` meant adding 2 at a time steps 1 → 3 straight
    //     over a stock of 2 without ever matching it.
    //
    // So add-to-cart only ever enforced maxAllowQuantity while the CART ROW
    // enforced the variant's real availability — the customer could build a
    // basket of 10 against 2 in stock, and only discovered it when Checkout
    // was greyed out with a red line under the item. The limit now bites at
    // the moment they press Add, which is the only place they can act on it.
    //
    // ⚠ The number is PER VARIANT, not per product: quantityAvailable is the
    // stock of this exact colour + size at the locations published to the
    // Online Store, minus units committed to unfulfilled orders. A product
    // with plenty in total can still be down to 2 in White / L-XL.
    final wanted = quantityOfProductInCart + quantity;

    // 🔴 Two paths REBUILD a basket the customer already owns instead of
    // reacting to a tap: restoring from local storage at launch
    // (LocalMixin.getCartInLocal, which is the only caller passing
    // isSaveLocal: false) and the currency re-add further down. Both throw
    // the returned message away, so refusing there does not warn anyone —
    // the line would just be missing from the cart next time they looked.
    //
    // Nothing unsellable escapes: the cart row re-checks stock on every
    // build, and Shopify checks again at checkout. This only decides whether
    // the customer is told, or quietly relieved of their basket.
    final isRebuildingCart = !enforceLimit || isSaveLocal == false;

    if (!isRebuildingCart) {
      final limit = LvPurchaseLimit.resolve(
        variation: defaultVariation,
        product: product,
      );

      if (limit != null && wanted > limit) {
        message = limit <= 0
            // "The maximum quantity has been exceeded" reads as nonsense for
            // something there is none of.
            ? S.of(context).outOfStock
            : '${S.of(context).youCanOnlyPurchase} $limit ${S.of(context).forThisProduct}';

        return (false, message);
      }
    }

    // Keyed by the PRODUCT id, not the product-variant key above: `item` is
    // the lookup every cart row uses to find the product a line belongs to,
    // and two sizes of the same shirt share one entry.
    item[product.id.toString()] = product;

    productsInCart[key] = wanted;
    quantityOfProductInCart = wanted;

    cartItemMetaDataInCart[key] = CartItemMetaData(variation: defaultVariation);
    if (isSaveLocal) {
      saveCartToLocal(
        key,
        product: product,
        quantity: quantityOfProductInCart,
        cartItemMetaData: CartItemMetaData(variation: defaultVariation),
      );
    }

    productSkuInCart[key] = product.sku;

    // Invalidate the Shopify cart so the total is recalculated from local data
    setCartDataShopify(null);

    return (true, '');
  }

  @override
  String updateQuantity(Product product, String key, int quantity, {context}) {
    if (productsInCart.containsKey(key)) {
      final productVariation = cartItemMetaDataInCart[key]?.variation;
      // Le Voile: the sixth place that answered "how many may they buy?", and
      // the worst of them. It compared against the raw stock figure — no
      // ceiling, no backorder check — and then printed `product.maxQuantity`,
      // a WooCommerce field that is ALWAYS null on Shopify, so the message
      // read "You can only purchase null of this product."
      final limit = LvPurchaseLimit.resolve(
        variation: productVariation,
        product: product,
      );
      if (limit != null && quantity > limit) {
        return limit <= 0
            ? S.of(context).outOfStock
            : '${S.of(context).youCanOnlyPurchase} $limit ${S.of(context).forThisProduct}';
      }
      productsInCart[key] = quantity;
      updateQuantityCartLocal(key: key, quantity: quantity);
      // Invalidate the Shopify cart so the total is recalculated from local data
      setCartDataShopify(null);
    }
    return '';
  }

  // Removes an item from the cart.
  @override
  void removeItemFromCart(String key) {
    if (productsInCart.containsKey(key)) {
      removeProductLocal(key);
      productsInCart.remove(key);
      cartItemMetaDataInCart.remove(key);
      productSkuInCart.remove(key);
      // Invalidate the Shopify cart so the total is recalculated from local data
      setCartDataShopify(null);
    } else {
      notifyListeners();
    }
  }

  @override
  double getItemTotal({
    ProductVariation? productVariation,
    Product? product,
    int quantity = 1,
  }) {
    return 0;
  }

  @override
  void setOrderNotes(String note) {
    notes = note;
    notifyListeners();
  }

  @override
  void setRewardTotal(double total) {
    rewardTotal = total;
    notifyListeners();
  }

  @override
  void updateProduct(String productId, Product? product) {
    super.updateProduct(productId, product);
    notifyListeners();
  }

  @override
  void updateProductVariant(
    String productId,
    ProductVariation? productVariant,
  ) {
    super.updateProductVariant(productId, productVariant);
    notifyListeners();
  }

  @override
  void updateStateCheckoutButton() {
    super.updateStateCheckoutButton();
    notifyListeners();
  }

  /// Updates the prices of all items in the cart when the currency is changed
  ///
  /// This function:
  /// 1. Creates a backup of current cart items and their quantities
  /// 2. Clears the current cart
  /// 3. Fetches fresh product data with updated prices in new currency
  /// 4. Re-adds products to cart with original quantities
  ///
  /// Parameters:
  /// - context: BuildContext required for adding products back to cart
  ///
  /// The process involves:
  /// - Backing up variation IDs and quantities
  /// - Clearing cart to remove old prices
  /// - Fetching each product again to get new prices
  /// - Restoring original quantities while using new price data
  @override
  Future<void> updatePriceWhenCurrencyChanged(BuildContext context) async {
    // Store IDs of product variations currently in cart
    // use `.toList()` because when clearCart() is called,
    // the cartItemMetaDataInCart will be cleared and the keys will be lost
    // so we need to make a copy of the keys first
    final cloneProductVariationIds = cartItemMetaDataInCart.keys
        .where((e) => cartItemMetaDataInCart[e]?.variation != null)
        .toList();

    // Backup current quantities for each product
    final cloneProductsInCart = Map<String, int>.from(productsInCart);

    // Clear cart to remove old prices
    await clearCart();

    // Re-add each product with updated prices
    for (final key in cloneProductVariationIds) {
      final productIDAndVariantID = key.split('-');
      final productId = productIDAndVariantID[0];
      final variationId = productIDAndVariantID[1];

      // Fetch fresh product data with new prices
      final newProductData = await Services().api.getProduct(productId);

      if (newProductData == null) {
        continue;
      }

      // Get original quantity and variation
      final quantity = cloneProductsInCart[key] ?? 0;
      final variation = newProductData.variations?.firstWhereOrNull((element) {
        return element.id == variationId;
      });

      // Re-add to cart with original quantity but new prices
      addProductToCart(
        context: context,
        product: newProductData,
        quantity: quantity,
        cartItemMetaData: CartItemMetaData(variation: variation),
        // Le Voile: the customer only switched currency — they are not
        // choosing anything. `newProductData` is freshly fetched, so if stock
        // has fallen since they added the item, enforcing here would delete
        // the line silently (the result is discarded) while local storage
        // still held it. Let the cart row show the problem instead.
        enforceLimit: false,
      );
    }
  }

  @override
  String getCoupon() {
    final amount = couponObj?.amount;
    if (amount == null) return '';
    return '-${PriceTools.getCurrencyFormatted(amount, currencyRates, currency: currencyCode)!}';
  }

  // Removes everything from the cart.
  @override
  Future<void> clearCart({isSaveRemote = true, isSaveLocal = true}) async {
    if (isSaveLocal) {
      await clearCartLocal();
    }
    productsInCart.clear();
    item.clear();
    setCartDataShopify(null);
    cartItemMetaDataInCart.clear();
    productSkuInCart.clear();
    shippingMethod = null;
    paymentMethod = null;
    couponObj = null;
    savedCoupon = null;
    notes = null;
    notifyListeners();
  }

  @override
  Future<void> setShippingMethod(ShippingMethod? data) async {
    shippingMethod = data;
    if (cartDataShopify != null && data != null) {
      final checkoutUpdated = await Services().api.updateShippingRateWithCartId(
        cartDataShopify!.id,
        deliveryOptionHandle: data.id ?? '',
        deliveryGroupId: data.deliveryGroupId ?? '',
      );
      setCartDataShopify(checkoutUpdated);
    }
    notifyListeners();
  }

  @mustCallSuper
  @override
  void setAddress(data) {
    super.setAddress(data);
    // it's a guest checkout or user not logged in
    // if (cartDataShopify?.buyerIdentity.email == null) {
    //   Services().api.updateCartEmail(
    //         cartId: cartDataShopify!.id,
    //         email: address?.email ?? '',
    //       );
    // }
  }

  @override
  void setCartDataShopify(CartDataShopify? cartData) {
    super.setCartDataShopify(cartData);
    notifyListeners();
  }
}
