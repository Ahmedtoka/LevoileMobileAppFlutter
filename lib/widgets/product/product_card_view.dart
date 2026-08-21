import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/tools.dart';
import '../../models/index.dart' show CartModel, Product;
import '../../modules/dynamic_layout/config/product_config.dart';
import '../../modules/dynamic_layout/helper/helper.dart';
import '../../services/outside/index.dart';
import '../../services/services.dart';
import '../card/short_description.dart';
import 'action_button_mixin.dart';
import 'index.dart'
    show
        CartButton,
        CartIcon,
        CartQuantity,
        HeartButton,
        ProductImage,
        // Le Voile: ProductOnSale dropped from this show list — see the note in
        // build(). LvProductBadges draws the discount instead.
        ProductPricing,
        ProductRating,
        ProductTitle,
        SaleProgressBar,
        StockStatus,
        StoreName;
import 'lv_product_badges.dart';
import 'widgets/cart_button_with_quantity.dart';
import 'widgets/category_name.dart';

class ProductCard extends StatefulWidget {
  final Product item;
  final double? width;
  final double? maxWidth;
  final bool hideDetail;
  final offset;
  final ProductConfig config;
  final onTapDelete;
  final bool? useDesktopStyle;

  const ProductCard({
    required this.item,
    this.width,
    this.maxWidth,
    this.offset,
    this.hideDetail = false,
    required this.config,
    this.onTapDelete,
    this.useDesktopStyle = false,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with ActionButtonMixin {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productConfig = widget.config;
    final width =
        (widget.maxWidth != null &&
            widget.width != null &&
            widget.width! > widget.maxWidth!)
        ? widget.maxWidth!
        : (widget.width ??
              Layout.buildProductMaxWidth(
                context: context,
                layout: productConfig.layout,
              ));

    /// use for Staged layout
    if (widget.hideDetail) {
      return ProductImage(
        width: width,
        product: widget.item,
        config: productConfig,
        ratioProductImage: productConfig.imageRatio,
        offset: widget.offset,
        onTapProduct: () =>
            onTapProduct(context, product: widget.item, config: productConfig),
      );
    }

    Widget productInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Le Voile: 10 -> 4. The card already has vertical padding of its own
        // from the config, so this stacked on top of it and pushed the name
        // well clear of the photo.
        const SizedBox(height: 4),
        CategoryName(
          product: widget.item,
          show: widget.config.showProductCardCategory,
        ),
        ProductTitle(
          product: widget.item,
          hide: productConfig.hideTitle,
          maxLines: productConfig.titleLine,
        ),
        ShortDescription(
          product: widget.item,
          show: productConfig.showShortDescription,
        ),
        StoreName(product: widget.item, hide: productConfig.hideStore),
        // Le Voile: 8 -> 2. The gap between the product name and its price was
        // the widest space on the card. `hideStore` is true for us, so nothing
        // sits between them and this spacer was the whole gap.
        const SizedBox(height: 2),
        Align(
          alignment: Alignment.bottomLeft,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ProductPricing(
                          product: widget.item,
                          hide: productConfig.hidePrice,
                        ),
                        const SizedBox(height: 2),
                        StockStatus(
                          product: widget.item,
                          config: productConfig,
                        ),
                        const SizedBox(height: 2),
                        ProductRating(
                          product: widget.item,
                          enableRating: productConfig.enableRating,
                          hideEmptyProductListRating:
                              productConfig.hideEmptyProductListRating,
                        ),
                        SaleProgressBar(
                          width: widget.width,
                          product: widget.item,
                          show: productConfig.showCountDown,
                        ),
                      ],
                    ),
                  ),
                  if (productConfig.layout != Layout.carousel)
                    const SizedBox(width: 10),
                ],
              ),
              if (!productConfig.showQuantity &&
                  productConfig.layout != Layout.carousel) ...[
                Positioned(
                  left: context.isRtl ? 0 : null,
                  right: context.isRtl ? null : 0,
                  child: CartIcon(product: widget.item, config: productConfig),
                ),
                const SizedBox(height: 40),
              ],
            ],
          ),
        ),
        CartQuantity(
          product: widget.item,
          config: productConfig,
          onChangeQuantity: (val) {
            setState(() {
              _quantity = val;
            });
          },
        ),
        if (productConfig.showCartButton &&
            Services().widget.enableShoppingCart(widget.item)) ...[
          const SizedBox(height: 6),
          CartButton(
            product: widget.item,
            hide: !widget.item.canBeAddedToCartFromList(
              enableBottomAddToCart: productConfig.enableBottomAddToCart,
            ),
            enableBottomAddToCart: productConfig.enableBottomAddToCart,
            quantity: _quantity,
          ),
        ],
        OutsideService.subProductCardInfoWidget(widget.item) ??
            const SizedBox(),
      ],
    );

    return GestureDetector(
      onTap: () =>
          onTapProduct(context, product: widget.item, config: productConfig),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        constraints: BoxConstraints(maxWidth: widget.maxWidth ?? width),
        width: widget.width!,
        margin: EdgeInsets.symmetric(
          horizontal: productConfig.hMargin,
          vertical: productConfig.vMargin,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  productConfig.borderRadius ?? 3,
                ),
                color: Theme.of(context).cardColor,
                boxShadow: [
                  if (productConfig.boxShadow != null)
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        productConfig.boxShadow?.x ?? 0.0,
                        productConfig.boxShadow?.y ?? 0.0,
                      ),
                      blurRadius: productConfig.boxShadow?.blurRadius ?? 0.0,
                    ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  productConfig.borderRadius ?? 3,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: [
                        Stack(
                          children: [
                            ProductImage(
                              width: width,
                              product: widget.item,
                              config: productConfig,
                              ratioProductImage: productConfig.imageRatio,
                              offset: widget.offset,
                              onTapProduct: () => onTapProduct(
                                context,
                                product: widget.item,
                                config: productConfig,
                              ),
                            ),
                            ...Services().renderProductBadges(
                              context,
                              widget.item,
                            ),
                            // Le Voile: "Save X%" computed from the product's
                            // own prices, or a New/Bestseller label mapped from
                            // its Shopify tags in the dashboard.
                            LvProductBadges(
                              product: widget.item,
                              compact: width < 180,
                            ),
                          ],
                        ),
                        if (productConfig.showCartButtonWithQuantity &&
                            widget.item.canBeAddedToCartFromList(
                              enableBottomAddToCart:
                                  productConfig.enableBottomAddToCart,
                            ) &&
                            Services().widget.enableShoppingCart(widget.item))
                          Positioned.fill(
                            child: Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Selector<CartModel, int>(
                                selector: (context, cartModel) =>
                                    cartModel.productsInCart[widget.item.id] ??
                                    0,
                                builder: (context, quantity, child) {
                                  return CartButtonWithQuantity(
                                    quantity: quantity,
                                    borderRadiusValue:
                                        productConfig.cartIconRadius,
                                    sizeButton:
                                        productConfig.cartButtonQuantitySize,
                                    increaseQuantityFunction: () {
                                      // final minQuantityNeedAdd =
                                      //     widget.item.getMinQuantity();
                                      // var quantityWillAdd = 1;
                                      // if (quantity == 0 &&
                                      //     minQuantityNeedAdd > 1) {
                                      //   quantityWillAdd = minQuantityNeedAdd;
                                      // }
                                      addToCart(
                                        context,
                                        quantity: 1,
                                        product: widget.item,
                                        enableBottomAddToCart:
                                            productConfig.enableBottomAddToCart,
                                      );
                                    },
                                    decreaseQuantityFunction: () {
                                      if (quantity <= 0) return;
                                      updateQuantity(
                                        context: context,
                                        quantity: quantity - 1,
                                        product: widget.item,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: productConfig.hPadding,
                        vertical: productConfig.vPadding,
                      ),
                      child: productInfo,
                    ),
                  ],
                ),
              ),
            ),
            // Le Voile: the stock ProductOnSale chip is NOT rendered.
            //
            // LvProductBadges (added above, over the photo) already shows the
            // discount, so both were stacking in the same top-left corner —
            // and they disagreed, because the stock one truncates the
            // percentage with ~/ while ours rounds: the same product showed
            // "-16%" and "Save 17%" at once. Ours is kept because it also
            // carries the dashboard's New / Bestseller tag labels; the stock
            // chip only ever does the discount.
            //
            // ProductOnSale takes no "hide" flag, so removing it here is the
            // only way. Re-adding it means deleting LvProductBadges' Save
            // label, not running the two together.
            if (productConfig.showHeart && !widget.item.isEmptyProduct())
              Positioned(
                right: context.isRtl ? null : productConfig.hMargin,
                left: context.isRtl ? productConfig.hMargin : null,
                child: HeartButton(product: widget.item, size: 18),
              ),
            if (widget.onTapDelete != null)
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: widget.onTapDelete,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
