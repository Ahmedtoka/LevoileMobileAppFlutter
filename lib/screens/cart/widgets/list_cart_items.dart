import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

import '../../../common/extensions/extensions.dart';
import '../../../common/theme/colors.dart';
import '../../../widgets/product/cart_item/cart_item_state_ui.dart';
import '../../../widgets/product/cart_item/layouts/cart_item_web_widget.dart';
import 'shopping_cart_rows.dart';

class ListCartBodyWidget extends StatefulWidget {
  const ListCartBodyWidget({
    super.key,
    required this.enabledTextBoxQuantity,
    this.enable = true,
    this.cartStyle,
  });

  final bool enabledTextBoxQuantity;
  final bool enable;
  final CartStyle? cartStyle;

  @override
  State<ListCartBodyWidget> createState() => _ListCartBodyWidgetState();
}

class _ListCartBodyWidgetState extends State<ListCartBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final titles = [
      Text(S.of(context).item.capitalize()),
      Text(S.of(context).prices),
      Text(S.of(context).quantity.capitalize()),
      Text(S.of(context).totalPrice),
      if (widget.enable) const Text(''),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kGrey200, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kGrey200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: List.generate(titles.length, (index) {
                final item = titles[index];
                final size = sizeRowCartItem[index];
                if (size == null) {
                  return Expanded(child: item);
                }

                return SizedBox(width: size, child: item);
              }),
            ),
          ),
          ShoppingCartRows(
            enabledTextBoxQuantity:
                widget.enable && widget.enabledTextBoxQuantity,
            cartStyle: widget.cartStyle,
            separatedWidget: const Divider(height: 2),
          ),
        ],
      ),
    );
  }
}
