import 'package:flutter/material.dart';

import '../../../../models/index.dart';
import '../../common/extensions/extensions.dart';

class ShortDescription extends StatelessWidget {
  final Product product;
  final bool show;

  const ShortDescription({required this.product, required this.show});

  @override
  Widget build(BuildContext context) {
    final plainText = product.shortDescription?.parseHtmlString() ?? '';

    if (plainText.isEmpty || !show) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        plainText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
