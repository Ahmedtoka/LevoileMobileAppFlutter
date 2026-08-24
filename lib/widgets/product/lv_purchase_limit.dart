import 'dart:math' as math;

import '../../common/config.dart';
import '../../models/entities/product.dart';
import '../../models/entities/product_variation.dart';
import '../../modules/dynamic_layout/helper/helper.dart';

/// Le Voile — the single answer to "how many of this may the customer buy?".
///
/// ── Why this file exists ─────────────────────────────────────────────────────
///
/// The template answered that question in FOUR places and they did not agree:
///
///   * `buy_button_widget._getMaxQuantity` — min(variant stock, ceiling) ✅
///   * `flat_style_product_detail_widget` — the ceiling, stock ignored ❌
///   * `cart_item.dart` / `cart_mixin.dart`  — min(variant stock, ceiling) ✅
///   * `cart_model_shopify.addProductToCart` — the ceiling, stock ignored ❌
///
/// and Le Voile runs the flat style, so the selector actually on the product
/// page was one of the two that ignored stock. A shopper could pick more than
/// existed, add it, and only find out at the cart — where the line turned red
/// and CHECKOUT went grey with nothing they could do about it from there.
///
/// Every one of those call sites now comes here, so they cannot drift apart
/// again.
///
/// ── The number is PER VARIANT ────────────────────────────────────────────────
///
/// 🔴 Shopify's `quantityAvailable` is the stock of one exact colour + size,
/// at the locations published to the Online Store sales channel, minus units
/// committed to unfulfilled orders. A product with hundreds in total can still
/// be down to 2 in White / L-XL, and that 2 is the honest limit — showing the
/// product-level figure would let customers order what the shop cannot send.
class LvPurchaseLimit {
  LvPurchaseLimit._();

  /// Used only where a widget demands a plain `int` and we have nothing —
  /// no Shopify figure and no configured ceiling. Matches the template's own
  /// `?? 100` so behaviour is unchanged in that corner.
  static const int fallback = 100;

  /// The most that may be bought, or null when nothing limits it.
  ///
  /// Returns null only if Shopify tracks no inventory for the variant AND
  /// `cartDetail.maxAllowQuantity` is unset — deliberately, so callers can
  /// tell "no limit" apart from "limit of zero".
  static int? resolve({ProductVariation? variation, Product? product}) {
    // A per-product cap set on the product itself wins over the global ceiling.
    // It is a WooCommerce field and is always null on Shopify, but honouring
    // it keeps this drop-in for the code it replaces.
    // `fallback` is passed as formatInt's DEFAULT, not applied afterwards: the
    // dashboard replaces the whole `cartDetail` map through
    // Configurations.setAppConfig, so a partial map emitted there would drop
    // the key entirely — and without a default that would silently remove the
    // ceiling from every untracked variant in the shop.
    final ceiling =
        product?.maxQuantity ??
        Helper.formatInt(kCartDetail['maxAllowQuantity'], fallback);

    // "Continue selling when out of stock", or inventory tracking switched
    // off: ProductVariation.fromShopify sets backordersAllowed whenever
    // quantityAvailable comes back null. There is no real figure to enforce,
    // so only the safety ceiling stands.
    final onBackorder = variation != null
        ? (variation.backordersAllowed ?? false)
        : (product?.backordersAllowed ?? false);
    if (onBackorder) {
      return ceiling;
    }

    final available = variation != null
        ? variation.stockQuantity
        : product?.stockQuantity;
    if (available == null) {
      return ceiling;
    }

    return ceiling != null ? math.min(available, ceiling) : available;
  }

  /// [resolve] for the quantity steppers, which need a concrete number.
  ///
  /// 🔴 Never below 1. A stepper's own minimum is 1, so a limit of 0 — a
  /// variant with `quantityAvailable: 0` and `availableForSale: false` — makes
  /// QuantitySelection reject its own mandatory starting value and fire an
  /// error toast at a customer who has touched nothing, including from
  /// didUpdateWidget as the variations finish loading. Sold-out is refused at
  /// add-to-cart, with the right words, by [resolve].
  static int forSelector({ProductVariation? variation, Product? product}) =>
      math.max(1, resolve(variation: variation, product: product) ?? fallback);
}
