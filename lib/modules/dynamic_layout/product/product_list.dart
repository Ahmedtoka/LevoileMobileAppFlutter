import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/brand_layout_model.dart';
import '../../../models/entities/brand.dart';
import '../../../models/entities/filter_product_params.dart';
import '../../../models/index.dart' show Product, ProductModel;
import '../../../widgets/product/action_button_mixin.dart';
import '../config/product_config.dart';
import '../helper/helper.dart';
import '../lv/section_header.dart';
import 'future_builder.dart';
import 'product_banner_slider.dart';
import 'product_grid.dart';
import 'product_list_default.dart';
import 'product_list_tile.dart';
import 'product_quilted_grid_tile.dart';
import 'product_staggered.dart';

class ProductList extends StatelessWidget with ActionButtonMixin {
  final ProductConfig config;
  final bool cleanCache;

  const ProductList({
    required this.config,
    required this.cleanCache,
    super.key,
  });

  bool isShowCountDown() {
    final isSaleOffLayout = config.layout == Layout.saleOff;
    return config.showCountDown && isSaleOffLayout;
  }

  /// Le Voile: a value straight off the raw block JSON.
  ///
  /// `jsonData` is `dynamic` and is null for any config built in code rather
  /// than parsed from the dashboard, so it is type-checked before indexing —
  /// a throw here takes down the whole home page, not just this section.
  Object? _lv(String key) {
    final data = config.jsonData;
    return data is Map ? data[key] : null;
  }

  String _lvString(String key) {
    final value = _lv(key);
    return value is String ? value.trim() : '';
  }

  /// Le Voile: `"#rrggbb"` / `"#aarrggbb"` → a Color, or null for no panel.
  ///
  /// Anything unparseable returns null (no panel) rather than a fallback
  /// colour: a section that quietly looks normal beats one rendered as a black
  /// box because a hex digit was mistyped in the dashboard.
  Color? _lvColor(String key) {
    final raw = _lv(key);
    if (raw is! String) return null;

    var hex = raw.trim().replaceFirst('#', '');
    if (hex.length == 3) {
      hex = hex.split('').map((c) => '$c$c').join();
    }
    if (hex.length == 6) hex = 'ff$hex';
    if (hex.length != 8) return null;

    final value = int.tryParse(hex, radix: 16);
    return value == null ? null : Color(value);
  }

  int getCountDownDuration(List<Product>? data) {
    if (isShowCountDown() && (data?.isNotEmpty ?? false)) {
      final dateOnSaleTo = data
          ?.firstWhereOrNull((e) => e.dateOnSaleTo?.isNotEmpty ?? false)
          ?.dateOnSaleTo;
      if (dateOnSaleTo != null) {
        return (DateTime.tryParse(dateOnSaleTo)?.millisecondsSinceEpoch ?? 0) -
            (DateTime.now().millisecondsSinceEpoch);
      }
    }
    return 0;
  }

  Widget getProductLayout({maxWidth, maxHeight, List<Product>? products}) {
    switch (config.layout) {
      case Layout.listTile:
        return ProductListTitle(
          products: products,
          config: config..showCountDown = isShowCountDown(),
        );
      case Layout.staggered:
        return ProductStaggered(
          products: products,
          width: maxWidth,
          config: config..showCountDown = isShowCountDown(),
        );

      case Layout.quiltedGridTile:
        return ProductQuiltedGridTile(
          products: products,
          width: maxWidth,
          config: config..showCountDown = isShowCountDown(),
        );

      case Layout.bannerSlider:
        return ProductBannerSlider(
          products: products,
          width: maxWidth,
          config: config..showCountDown = isShowCountDown(),
        );

      default:
        return config.rows > 1
            ? ProductGrid(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                products: products,
                config: config..showCountDown = isShowCountDown(),
              )
            : ProductListDefault(
                maxWidth: maxWidth,
                products: products,
                config: config..showCountDown = isShowCountDown(),
              );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRecentLayout = config.layout == Layout.recentView;
    Brand? brandByParams;
    var brandLayoutModel = Provider.of<BrandLayoutModel>(
      context,
      listen: false,
    );
    var brandId = config.advancedParams != null
        ? FilterProductParams.fromJson(config.advancedParams!).brand
        : null;

    if (brandId?.isNotEmpty ?? false) {
      brandByParams = brandLayoutModel.getBrandById(brandId!);
    }

    return ProductFutureBuilder(
      config: config,
      cleanCache: cleanCache,
      child: ({maxWidth, maxHeight, products}) {
        final duration = getCountDownDuration(products);

        // Le Voile: the design centres the section title with a small second
        // line under it and floats "See All" at the top right, which the stock
        // HeaderView cannot express. Both extra values are read off the raw
        // block JSON, so ProductConfig is untouched.
        //
        // The countdown is only ever used by the saleOff layout, which Le Voile
        // does not ship. If a countdown section is ever added, fall back to
        // HeaderView for it rather than bolting a timer onto this header.
        final subtitle = _lvString('subtitle');
        final bgColor = _lvColor('bgColor');

        final section = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Either line alone is enough to draw the header — the two guards
            // used to disagree, so a subtitle-only section rendered nothing.
            if ((config.name?.isNotEmpty ?? false) || subtitle.isNotEmpty)
              LvSectionHeader(
                title: config.name ?? '',
                subtitle: subtitle,
                onSeeAll: isRecentLayout
                    ? null
                    : () => ProductModel.showList(
                        brandByParams: brandByParams,
                        config: config.jsonData,
                        products: products,
                        showCountdown: isShowCountDown() && duration > 0,
                        countdownDuration: Duration(milliseconds: duration),
                        context: context,
                      ),
              ),
            getProductLayout(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              products: products,
            ),
          ],
        );

        if (bgColor == null) return section;

        // The pale rounded panel the design puts behind a highlighted section.
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: section,
            ),
          ),
        );
      },
    );
  }
}
