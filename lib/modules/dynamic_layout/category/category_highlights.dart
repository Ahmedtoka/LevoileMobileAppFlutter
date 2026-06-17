import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../common/constants.dart';
import '../../../models/entities/back_drop_arguments.dart';
import '../../../routes/flux_navigate.dart';

/// Le Voile — Instagram-style "Highlights" row for the home page.
///
/// Driven entirely by the dashboard: each item is a collection with a circular
/// cover photo wrapped in a brand-coloured ring. Tapping opens the collection.
///
/// Config shape (built by the Laravel dashboard):
/// {
///   "layout": "categoryHighlight",
///   "size": 74,
///   "hideTitle": false,
///   "items": [ { "category": "gid://...", "name": "New Arrivals", "image": "https://..." } ]
/// }
class CategoryHighlights extends StatelessWidget {
  final Map config;
  const CategoryHighlights({required this.config, super.key});

  List get _items => (config['items'] as List?) ?? const [];
  double get _size => (config['size'] as num?)?.toDouble() ?? 74.0;
  bool get _hideTitle => config['hideTitle'] == true;

  void _open(BuildContext context, Map item) {
    if (item['category'] == null) return;
    FluxNavigate.pushNamed(
      RouteList.backdrop,
      arguments: BackDropArguments(
        config: Map<String, dynamic>.from(item),
        cateName: item['name']?.toString(),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) return const SizedBox();

    // Single source of truth = the image resolved by the dashboard (uploaded
    // override, else the real Shopify collection image). This keeps the app and
    // the dashboard preview perfectly in sync. Blank circles get filled by
    // uploading an image in the dashboard.
    String resolveImage(Map raw) => raw['image']?.toString() ?? '';

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final raw in _items)
              if (raw is Map)
                _HighlightItem(
                  name: raw['name']?.toString() ?? '',
                  image: resolveImage(raw),
                  size: _size,
                  hideTitle: _hideTitle,
                  onTap: () => _open(context, raw),
                ),
          ],
        ),
      ),
    );
  }
}

class _HighlightItem extends StatelessWidget {
  const _HighlightItem({
    required this.name,
    required this.image,
    required this.size,
    required this.hideTitle,
    required this.onTap,
  });

  final String name;
  final String image;
  final double size;
  final bool hideTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final ringGradient = SweepGradient(
      colors: [
        primary,
        primary.withOpacity(0.55),
        const Color(0xFFE9A8D4),
        primary,
      ],
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size + 26,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            // Gradient ring -> white gap -> circular cover photo.
            Container(
              width: size + 8,
              height: size + 8,
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: ringGradient,
              ),
              child: Container(
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.surface,
                ),
                child: ClipOval(
                  child: image.isNotEmpty
                      ? FluxImage(
                          imageUrl: image,
                          width: size,
                          height: size,
                          fit: BoxFit.cover,
                        )
                      : _placeholder(primary),
                ),
              ),
            ),
            if (!hideTitle) ...[
              const SizedBox(height: 6),
              SizedBox(
                width: size + 22,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 12,
                    height: 1.15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _placeholder(Color primary) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primary.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '•',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
