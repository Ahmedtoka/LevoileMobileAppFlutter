import 'package:flutter/material.dart';

import '../../flux_ui.dart';
import 'flux_widget/flux_text.dart';

class MenuListItem extends StatelessWidget {
  final Widget _title;
  final Widget _trailing;
  final FluxCardConfig _cardConfig;

  MenuListItem.fromConfig(MenuListItemConfig config, {super.key})
    : _title = FluxText.fromStyleConfig(
        text: config.title,
        styleConfig: config.resolvedStyle.titleStyleConfig,
      ),
      _trailing = config.imageUrl != null
          ? FluxImage.fromStyleConfig(
              imageUrl: config.imageUrl!,
              styleConfig: config.resolvedStyle.imageStyleConfig,
            )
          : const SizedBox.shrink(),
      _cardConfig = config.resolvedStyle.cardConfig;

  MenuListItem.simple({super.key, required String title, String? imageUrl})
    : _title = _Title(title: title),
      _trailing = imageUrl != null
          ? FluxImage(imageUrl: imageUrl)
          : const SizedBox.shrink(),
      _cardConfig = const FluxCardConfig();

  @override
  Widget build(BuildContext context) {
    return FluxCard(
      config: _cardConfig,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 16.0),
                child: _title,
              ),
            ),
            _trailing,
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.bodyLarge);
  }
}
