import 'package:flutter/material.dart';

import '../../entities/menu_list_layout_config.dart';
import '../../widgets/menu_list_item.dart';

class MenuListLayout extends StatelessWidget {
  const MenuListLayout({super.key, required this.config, this.onTapItem});

  final MenuListLayoutConfig config;
  final void Function(Map? action)? onTapItem;

  @override
  Widget build(BuildContext context) {
    final items = config.resolvedItems;
    final child = Column(
      spacing: config.itemSpacing,
      children: List.generate(items.length, (index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => onTapItem?.call(item.action),
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            height: config.itemHeight,
            child: MenuListItem.fromConfig(item),
          ),
        );
      }),
    );

    if (config.padding != null) {
      return Padding(padding: config.padding!, child: child);
    }

    return child;
  }
}
