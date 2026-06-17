import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../models/index.dart'
    show Product, ProductAttribute, ProductModel, ProductVariation;
import '../../services/index.dart';
import '../../widgets/product/product_variant/product_variant_widget.dart';
import '../product_variant_mixin.dart';

const _defaultTitle = 'Title';

mixin ShopifyVariantMixin on ProductVariantMixin {
  @override
  Future<void> getProductVariations({
    BuildContext? context,
    Product? product,
    void Function({
      Product? productInfo,
      List<ProductVariation>? variations,
      Map<String?, String?> mapAttribute,
      ProductVariation? variation,
    })?
    onLoad,
  }) async {
    if (product == null || (product.attributes?.isEmpty ?? true)) {
      return;
    }

    Map<String?, String?> mapAttribute = HashMap();
    List<ProductVariation>? variations = <ProductVariation>[];
    Product? productInfo;

    variations = await Services().api.getProductVariations(product);

    if (variations!.isEmpty) {
      for (var attr in product.attributes!) {
        mapAttribute.update(
          attr.name,
          (value) => attr.options![0],
          ifAbsent: () => attr.options![0],
        );
      }
    } else {
      // Le Voile: default to the FIRST IN-STOCK variation, so a product never
      // opens with a sold-out (and now hidden) option pre-selected.
      ProductVariation? defaultVariant;
      if (kAdvanceConfig.hideOutOfStock) {
        for (final v in variations) {
          if (v.inStock == true) {
            defaultVariant = v;
            break;
          }
        }
      }
      // Fall back to the product-priced variant, then the first one.
      if (defaultVariant == null) {
        for (final v in variations) {
          if (v.price == product.price) {
            defaultVariant = v;
            break;
          }
        }
      }
      defaultVariant ??= variations.first;

      for (final attribute in defaultVariant.attributes) {
        mapAttribute.update(
          attribute.name,
          (value) => attribute.option,
          ifAbsent: () => attribute.option,
        );
      }
      // Ensure every attribute has a value (in case the variant misses one).
      for (final attr in product.attributes!) {
        mapAttribute.putIfAbsent(attr.name, () => attr.options![0]);
      }
    }

    final productVariation = updateVariation(variations, mapAttribute);
    context?.read<ProductModel>().changeProductVariations(variations);
    if (productVariation != null) {
      context?.read<ProductModel>().changeSelectedVariation(productVariation);
    }

    onLoad!(
      productInfo: productInfo,
      variations: variations,
      mapAttribute: mapAttribute,
      variation: productVariation,
    );

    return;
  }

  bool couldBePurchased(
    List<ProductVariation>? variations,
    ProductVariation? productVariation,
    Product product,
    Map<String?, String?>? mapAttribute,
  ) {
    return true;
  }

  @override
  List<Widget> getBuyButtonWidget({
    required BuildContext context,
    ProductVariation? productVariation,
    required Product product,
    Map<String?, String?>? mapAttribute,
    required int maxQuantity,
    required int quantity,
    required Function({bool buyNow, bool inStock}) addToCart,
    required Function(int quantity) onChangeQuantity,
    List<ProductVariation>? variations,
    required bool isInAppPurchaseChecking,
    bool showQuantity = true,
    Widget Function(bool Function(int) onChanged, int maxQuantity)?
    builderQuantitySelection,
    bool disableBuyButton = false,
  }) {
    final isAvailable = productVariation != null
        ? productVariation.id != null
        : true;

    return makeBuyButtonWidget(
      context: context,
      productVariation: productVariation,
      product: product,
      mapAttribute: mapAttribute,
      maxQuantity: maxQuantity,
      quantity: quantity,
      addToCart: addToCart,
      onChangeQuantity: onChangeQuantity,
      isAvailable: isAvailable,
      isInAppPurchaseChecking: isInAppPurchaseChecking,
      showQuantity: showQuantity,
      builderQuantitySelection: builderQuantitySelection,
      disableBuyButton: disableBuyButton,
    );
  }

  @override
  List<Widget> getProductAttributeWidget(
    String lang,
    Product product,
    Map<String?, String?>? mapAttribute,
    Function onSelectProductVariant,
    List<ProductVariation> variations,
  ) {
    var listWidget = <Widget>[];

    try {
      final checkProductAttribute =
          product.attributes != null && product.attributes!.isNotEmpty;
      if (checkProductAttribute) {
        for (var attr in product.attributes!) {
          if (attr.name != null &&
              attr.name!.isNotEmpty &&
              attr.name != _defaultTitle) {
            var options = List<String>.from(attr.options!);

            // Le Voile: hide sold-out option values (e.g. a colour or a size).
            // Only keep values that have at least one IN-STOCK variation that
            // is also consistent with the other currently-selected options, so
            // for the chosen colour only its available sizes show, etc.
            if (kAdvanceConfig.hideOutOfStock && variations.isNotEmpty) {
              bool isOptionAvailable(String option) {
                return variations.any((v) {
                  if (!(v.inStock ?? false)) return false;
                  final hasThisOption = v.attributes.any(
                    (a) =>
                        a.name?.toLowerCase() == attr.name!.toLowerCase() &&
                        a.option == option,
                  );
                  if (!hasThisOption) return false;
                  // Must match every OTHER attribute already selected.
                  for (final entry in mapAttribute!.entries) {
                    if (entry.key?.toLowerCase() == attr.name!.toLowerCase()) {
                      continue;
                    }
                    final selected = entry.value;
                    if (selected == null || selected.isEmpty) continue;
                    final matchesOther = v.attributes.any(
                      (a) =>
                          a.name?.toLowerCase() == entry.key?.toLowerCase() &&
                          a.option == selected,
                    );
                    if (!matchesOther) return false;
                  }
                  return true;
                });
              }

              final available = options.where(isOptionAvailable).toList();
              // Don't blank the selector if a cross-combination leaves nothing.
              if (available.isNotEmpty) {
                options = available;
              }
            }

            var selectedValue = mapAttribute![attr.name!] ?? '';

            final attrType =
                kProductVariantLayout[attr.name!.toLowerCase()] ?? 'box';

            /// When the attribute uses the "image" layout (e.g. Color),
            /// build a map of {optionValue: variantImageUrl} from the product
            /// variants so each option shows its variation image like the web.
            Map<String, String?>? imageUrls;
            if (attrType == 'image' || attrType == 'imageDropdown') {
              imageUrls = {};
              final productImages = product.images;
              for (final option in options) {
                String? img;
                // 1) Prefer the variant's own image when assigned in Shopify.
                for (final variant in variations) {
                  final matched = variant.attributes.any(
                    (a) =>
                        a.name?.toLowerCase() == attr.name!.toLowerCase() &&
                        a.option == option,
                  );
                  if (matched) {
                    if (variant.imageFeature?.isNotEmpty ?? false) {
                      img = variant.imageFeature;
                    }
                    break;
                  }
                }
                // 2) Fallback: many shops attach images at product level only,
                // ordered by colour. Map this option to the product image at
                // the same position so the swatch still shows a real photo.
                if ((img == null || img.isEmpty)) {
                  final idx = options.indexOf(option);
                  if (idx >= 0 && idx < productImages.length) {
                    img = productImages[idx];
                  } else if (productImages.isNotEmpty) {
                    img = productImages.first;
                  }
                }
                if (img != null && img.isNotEmpty) {
                  imageUrls[option] = img;
                }
              }
            }

            listWidget.add(
              BasicSelection(
                options: options,
                imageUrls: imageUrls,
                title:
                    (kProductVariantLanguage[lang] != null &&
                        kProductVariantLanguage[lang][attr.name!
                                .toLowerCase()] !=
                            null)
                    ? kProductVariantLanguage[lang][attr.name!.toLowerCase()]
                    : attr.name!.toLowerCase(),
                type: attrType,
                value: selectedValue,
                productId: product.id,
                onChanged: (val) => onSelectProductVariant(
                  attr: attr,
                  val: val,
                  mapAttribute: mapAttribute,
                  variations: product.variations,
                ),
              ),
            );
          }
        }
      }
      return listWidget;
    } catch (e, trace) {
      printError(e, trace);
      return [];
    }
  }

  @override
  List<Widget> getProductTitleWidget(
    BuildContext context,
    productVariation,
    product,
  ) {
    final isAvailable = productVariation != null
        ? productVariation.id != null
        : true;

    return makeProductTitleWidget(
      context,
      productVariation,
      product,
      isAvailable,
    );
  }

  @override
  void onSelectProductVariant({
    required ProductAttribute attr,
    String? val,
    required List<ProductVariation> variations,
    required Map<String?, String?> mapAttribute,
    required Function onFinish,
  }) {
    try {
      mapAttribute.update(
        attr.name,
        (value) => val.toString(),
        ifAbsent: () => val.toString(),
      );

      if (!isValidProductVariation(variations, mapAttribute)) {
        /// Reset other choices
        mapAttribute.clear();
        mapAttribute[attr.name] = val.toString();
      }

      final productVariation = updateVariation(variations, mapAttribute);

      onFinish(mapAttribute, productVariation);
    } catch (e, trace) {
      printError(e, trace);
    }
  }

  bool isValidProductVariation(
    List<ProductVariation> variations,
    Map<String?, String?> mapAttribute,
  ) {
    for (var variation in variations) {
      if (variation.hasSameAttributes(mapAttribute)) {
        /// Hide out of stock variation
        if ((kAdvanceConfig.hideOutOfStock) && !variation.inStock!) {
          return false;
        }
        return true;
      }
    }
    return false;
  }
}
