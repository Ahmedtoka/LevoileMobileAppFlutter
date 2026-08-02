import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../models/app_model.dart';
import '../../../models/entities/back_drop_arguments.dart';
import '../../../models/product_model.dart';
import '../../../models/search_model.dart';
import '../../../modules/dynamic_layout/index.dart';
import '../../../routes/flux_navigate.dart';

/// Le Voile — everything the search screen shows BEFORE the customer types:
///
///   1. Recent Searches — their own history, as removable chips. Appears only
///      once they have searched at least once; it lives on the device and is
///      never sent to the server.
///   2. Trending Searches — a curated chip row from the dashboard.
///   3. Popular Right Now — a product slider from the dashboard.
///
/// Sections 2 and 3 come from `Setting.LvSearch`; each hides itself when the
/// dashboard has nothing to show, so an empty screen degrades to just the
/// search box rather than to a heading over a blank row.
class LvSearchIntro extends StatelessWidget {
  /// Runs a keyword as a search — the chips reuse the screen's own submit
  /// handler so a tapped chip behaves exactly like a typed word.
  final void Function(String keyword) onSearch;

  const LvSearchIntro({required this.onSearch, super.key});

  /// Copy the screen falls back to when `Setting.LvSearch` is missing.
  ///
  /// It WILL be missing: the bundled `lib/config/config_*.json` predates this
  /// feature, so a first launch — or any launch where the 5 s cloud fetch
  /// times out — reaches this widget with an empty map. Without defaults the
  /// recent chips would render under no heading and with no way to clear them.
  static const _fallback = {
    'recentTitle': 'Recent Searches',
    'clearAll': 'Clear All',
  };

  Map _config(BuildContext context) {
    // listen: true — the config is refetched on resume and on the
    // `config_update` push, and an open search screen has to pick the new
    // trending row up.
    final raw = Provider.of<AppModel>(context).appConfig?.settings.lvSearch;
    return raw is Map ? raw : const {};
  }

  String _text(Map c, String key) {
    final value = c[key]?.toString().trim() ?? '';
    return value.isEmpty ? (_fallback[key] ?? '') : value;
  }

  @override
  Widget build(BuildContext context) {
    final config = _config(context);

    final trending = ((config['trending'] as List?) ?? const [])
        .whereType<Map>()
        .where((e) => (e['label']?.toString().trim() ?? '').isNotEmpty)
        .toList();

    final popular = config['popular'];

    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        _RecentSearches(
          title: _text(config, 'recentTitle'),
          clearAllLabel: _text(config, 'clearAll'),
          onSearch: onSearch,
        ),

        if (trending.isNotEmpty) ...[
          _SectionTitle(_text(config, 'trendingTitle')),
          _ChipWrap(
            children: [
              for (final item in trending)
                _Chip(
                  label: item['label'].toString().trim(),
                  leading: Icons.trending_up_rounded,
                  onTap: () => _openTrending(context, item),
                ),
            ],
          ),
        ],

        if (popular is Map) ...[
          _SectionTitle(_text(config, 'popularTitle')),
          // A ready-built product block from the dashboard, rendered by the
          // same machinery as a home-page row — so the cards, badges and
          // heart button all match without a second implementation.
          DynamicLayout(configLayout: Map<String, dynamic>.from(popular)),
        ],
      ],
    );
  }

  /// A chip with a category opens it; one without runs its label as a search.
  /// The dashboard allows the second form on purpose, for campaign words that
  /// are not collections.
  void _openTrending(BuildContext context, Map item) {
    final category = item['category']?.toString() ?? '';
    final label = item['label'].toString().trim();

    if (category.isEmpty) {
      onSearch(label);
      return;
    }

    FluxNavigate.pushNamed(
      RouteList.backdrop,
      arguments: BackDropArguments(cateId: category, cateName: label),
      context: context,
    );
  }
}

/// The customer's own search history.
///
/// Separated out so it can rebuild on SearchModel alone: removing one chip
/// must not rebuild the trending row or refetch the popular slider.
class _RecentSearches extends StatelessWidget {
  final String title;
  final String clearAllLabel;
  final void Function(String keyword) onSearch;

  const _RecentSearches({
    required this.title,
    required this.clearAllLabel,
    required this.onSearch,
  });

  /// SearchModel keeps history for ever, so this row has to cap itself — the
  /// stock widget it replaced took 5. Uncapped, a customer who has searched
  /// thirty times pushes Trending and Popular off the bottom of the screen.
  static const _maxShown = 8;

  @override
  Widget build(BuildContext context) {
    final productType = context.read<ProductModel>().productType;

    return Consumer<SearchModel>(
      builder: (context, model, _) {
        final keywords = model
            .getKeywordsByType(productType)
            .take(_maxShown)
            .toList();

        // Nothing searched yet — show nothing at all rather than an empty
        // heading. This is the first-launch state.
        if (keywords.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SectionTitle(
              title,
              action: clearAllLabel.isEmpty ? null : clearAllLabel,
              onAction: () => model.clearKeywords(productType: productType),
            ),
            _ChipWrap(
              children: [
                for (final keyword in keywords)
                  _Chip(
                    label: keyword,
                    onTap: () => onSearch(keyword),
                    onRemove: () => model.removeKeyword(
                      keyword,
                      productType: productType,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onAction;

  const _SectionTitle(this.title, {this.action, this.onAction});

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2F2A2E),
              ),
            ),
          ),
          if (action != null)
            GestureDetector(
              onTap: onAction,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Text(
                  action!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ChipWrap extends StatelessWidget {
  final List<Widget> children;

  const _ChipWrap({required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Wrap(spacing: 8, runSpacing: 8, children: children),
    );
  }
}

/// One pill. `leading` draws an icon before the label (the trending arrow);
/// `onRemove` draws a ✕ after it (recent searches). Neither is required.
class _Chip extends StatelessWidget {
  final String label;
  final IconData? leading;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const _Chip({
    required this.label,
    required this.onTap,
    this.leading,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 14,
          end: onRemove == null ? 14 : 8,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFBF1F3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              Icon(leading, size: 14, color: primary),
              const SizedBox(width: 5),
            ],
            // Bounded so one very long past search cannot push the chip wider
            // than the screen — Wrap would then overflow rather than wrap.
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3A2A28),
                ),
              ),
            ),
            if (onRemove != null)
              GestureDetector(
                onTap: onRemove,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  // Padding rather than a bigger icon: the ✕ needs a finger-
                  // sized tap target without making the chip look heavy.
                  padding: const EdgeInsets.fromLTRB(6, 2, 0, 2),
                  child: Icon(
                    Icons.close_rounded,
                    size: 14,
                    color: primary.withValues(alpha: 0.7),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
