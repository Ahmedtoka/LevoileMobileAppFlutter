import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/app_model.dart';
import '../../models/entities/product.dart';

/// Le Voile — the small corner labels on a product card: "Save 30%", "New",
/// "Bestseller".
///
/// Two different sources, on purpose:
///  * **Save X%** is COMPUTED from the product's own prices, so it can never
///    disagree with what the customer is charged.
///  * **New / Bestseller** come from Shopify product tags. Which tag maps to
///    which label is set in the dashboard (Settings → product badges), so
///    merchandising does not need an app release.
///
/// Stacked over the product image, so it must be the last child of that Stack.
class LvProductBadges extends StatelessWidget {
  final Product product;

  /// Shrinks the labels for the small 2-per-row cards.
  final bool compact;

  const LvProductBadges({
    required this.product,
    this.compact = false,
    super.key,
  });

  /// Whole-percent discount, or null when the product is not on sale.
  ///
  /// Deliberately conservative: anything that isn't a sane 1-99% is treated as
  /// "no badge" rather than shown as a wrong number.
  int? get _discountPercent {
    final regular = double.tryParse('${product.regularPrice ?? product.price}');
    final sale = double.tryParse('${product.salePrice}');
    if (regular == null || sale == null) return null;
    // isFinite before the comparisons: double.tryParse accepts the literal
    // strings "Infinity" and "NaN", and an infinite regular price slips past
    // every `<=` / `>=` guard below, makes the division NaN, and then .round()
    // throws UnsupportedError inside build().
    if (!regular.isFinite || !sale.isFinite) return null;
    if (regular <= 0 || sale <= 0 || sale >= regular) return null;

    final pct = (regular - sale) / regular * 100;
    if (!pct.isFinite) return null;

    final rounded = pct.round();
    return (rounded > 0 && rounded < 100) ? rounded : null;
  }

  List<String> get _tagNames => product.tags
      .map((t) => (t.name ?? t.slug ?? '').toLowerCase().trim())
      .where((t) => t.isNotEmpty)
      .toList();

  /// Fallback used before the remote config has loaded, or when an older
  /// config has no ProductBadgeTags key — better than showing no badge at all.
  static const _defaultLabels = {
    'new': 'New',
    'bestseller': 'Bestseller',
    'best-seller': 'Bestseller',
    'best seller': 'Bestseller',
  };

  /// The dashboard's tag→label mapping, from Setting.ProductBadgeTags.
  Map<String, String> _tagLabels(BuildContext context) {
    try {
      final raw = Provider.of<AppModel>(context, listen: false)
          .appConfig
          ?.settings
          .productBadgeTags;
      if (raw != null && raw.isNotEmpty) {
        return raw.map(
          (k, v) => MapEntry(k.toString().toLowerCase().trim(), v.toString()),
        );
      }
    } catch (_) {
      // No config yet — fall through to the defaults.
    }
    return _defaultLabels;
  }

  /// The dashboard's chip wording and colours, from Setting.ProductBadges.
  Map _badgeConfig(BuildContext context) {
    try {
      final raw = Provider.of<AppModel>(context, listen: false)
          .appConfig
          ?.settings
          .productBadges;
      if (raw is Map) return raw;
    } catch (_) {
      // No config yet — the callers below fall back to the built-in look.
    }
    return const {};
  }

  /// `"#rrggbb"` / `"#aarrggbb"` → Color, or [fallback].
  ///
  /// Anything unparseable falls back rather than throwing: this runs inside
  /// build() on every product card, and in release a build exception renders
  /// the whole screen blank (see CLAUDE.md §7).
  static Color _color(Object? raw, Color fallback) {
    if (raw is! String) return fallback;

    var hex = raw.trim().replaceFirst('#', '');
    if (hex.length == 3) {
      hex = hex.split('').map((c) => '$c$c').join();
    }
    if (hex.length == 6) hex = 'ff$hex';
    if (hex.length != 8) return fallback;

    final value = int.tryParse(hex, radix: 16);
    return value == null ? fallback : Color(value);
  }

  @override
  Widget build(BuildContext context) {
    final discount = _discountPercent;
    final labels = _tagLabels(context);
    final config = _badgeConfig(context);

    String? tagLabel;
    for (final t in _tagNames) {
      final match = labels[t];
      if (match != null && match.trim().isNotEmpty) {
        tagLabel = match.trim();
        break; // first match wins, so ordering in the dashboard is the priority
      }
    }

    // The wording around the number, e.g. "Save {n}%" / "Get {n}% Off". The
    // NUMBER stays computed from the product's own prices — the dashboard can
    // never make the card claim a discount the customer will not get. An empty
    // template means the admin switched the chip off.
    final template = config['discountLabel'] is String
        ? (config['discountLabel'] as String).trim()
        : 'Save {n}%';

    // Kept as a nullable local rather than a bool, so the substitution below
    // still gets flow promotion. With a bare `showDiscount` bool the compiler
    // no longer knows `discount` is non-null, and a future edit to the
    // condition would silently print the word "null" on every card.
    final shownDiscount = template.isEmpty ? null : discount;

    // A discount is the more useful thing to show, so it wins the top-start
    // corner and the tag label steps aside.
    if (shownDiscount == null && tagLabel == null) return const SizedBox.shrink();

    return PositionedDirectional(
      top: 10,
      start: 10,
      child: shownDiscount != null
          ? _Chip(
              text: template.replaceAll('{n}', '$shownDiscount'),
              // Dark by default, so money-off reads differently from the
              // brand-coloured merchandising labels.
              background: _color(config['discountBg'], const Color(0xFF3A2A28)),
              foreground: _color(config['discountText'], Colors.white),
              compact: compact,
            )
          : _Chip(
              text: tagLabel!,
              background: _color(
                config['tagBg'],
                Theme.of(context).primaryColor,
              ),
              foreground: _color(config['tagText'], Colors.white),
              compact: compact,
            ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;
  final bool compact;

  const _Chip({
    required this.text,
    required this.background,
    required this.foreground,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 7 : 9,
        vertical: compact ? 3 : 4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: compact ? 8.5 : 9,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: foreground,
        ),
      ),
    );
  }
}
