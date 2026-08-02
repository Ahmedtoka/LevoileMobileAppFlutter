import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../../models/entities/back_drop_arguments.dart';
import '../../../routes/flux_navigate.dart';

/// Le Voile — the horizontal row of rounded category "pills" under the hero
/// (All · Abaya · Scarf · Isdal · …).
///
/// Fed by the same dashboard rows as the highlights circles, so the admin keeps
/// one category list rather than two.
///
/// Config shape (built by ConfigBuilder):
/// {
///   "layout": "lvCategoryPills",
///   "items": [ {"name": "All", "category": null},
///              {"name": "Abaya", "category": "gid://shopify/Collection/123"} ]
/// }
class LvCategoryPills extends StatefulWidget {
  final Map config;
  const LvCategoryPills({required this.config, super.key});

  @override
  State<LvCategoryPills> createState() => _LvCategoryPillsState();
}

class _LvCategoryPillsState extends State<LvCategoryPills> {
  /// Which pill is highlighted. Purely visual — tapping a real category opens
  /// it, so the selection only ever matters for the moment before the push.
  int _selected = 0;

  /// Only real maps with a label survive — a malformed row must not blank the
  /// whole row or throw inside build().
  List<Map> get _items => ((widget.config['items'] as List?) ?? const [])
      .whereType<Map>()
      .where((e) => (e['name']?.toString().trim() ?? '').isNotEmpty)
      .toList();

  void _open(BuildContext context, Map item, int index) {
    setState(() => _selected = index);

    // The "All" pill has no category; it is a label, not a destination.
    final category = item['category'];
    if (category == null || category.toString().isEmpty) return;

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
    final items = _items;
    if (items.isEmpty) return const SizedBox.shrink();

    final primary = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i > 0) const SizedBox(width: 9),
              _Pill(
                label: items[i]['name']?.toString() ?? '',
                selected: i == _selected,
                primary: primary,
                onTap: () => _open(context, items[i], i),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final bool selected;
  final Color primary;
  final VoidCallback onTap;

  const _Pill({
    required this.label,
    required this.selected,
    required this.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (label.isEmpty) return const SizedBox.shrink();

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? primary : const Color(0xFFF6E9E4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? const Color(0xFFFBF6F1) : primary,
          ),
        ),
      ),
    );
  }
}
