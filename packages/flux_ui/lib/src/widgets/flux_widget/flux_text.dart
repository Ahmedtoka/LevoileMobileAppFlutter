import 'package:flutter/material.dart';

import '../../entities/flux_config/text/flux_text_config.dart';
import 'flux_container.dart';

class FluxText extends StatelessWidget {
  FluxText({super.key, required FluxTextConfig config})
    : text = config.text,
      styleConfig = config.styleConfig;

  const FluxText.fromStyleConfig({
    super.key,
    required this.text,
    this.styleConfig,
  });

  final String text;
  final FluxTextStyleConfig? styleConfig;

  @override
  Widget build(BuildContext context) {
    final styleConfig = this.styleConfig;

    if (styleConfig == null) {
      return Text(text);
    }

    final containerConfig = styleConfig.containerConfig;
    final minLines = styleConfig.minLines;
    final effectiveMaxLines = styleConfig.maxLines ?? minLines;

    final textStyle = getTextStyle(context, styleConfig);

    Widget textWidget = Text(
      text,
      maxLines: effectiveMaxLines,
      overflow: styleConfig.textOverflow,
      textAlign: styleConfig.textAlign,
      style: textStyle,
    );

    if (minLines != null) {
      textWidget = IndexedStack(
        alignment: Alignment.centerLeft,
        children: [
          textWidget,
          Text(
            '\n' * (minLines),
            maxLines: effectiveMaxLines,
            overflow: styleConfig.textOverflow,
            textAlign: styleConfig.textAlign,
            style: textStyle,
          ),
        ],
      );
    }

    if (containerConfig == null) {
      return textWidget;
    }

    return FluxContainer(config: containerConfig, child: textWidget);
  }

  TextStyle? getTextStyle(
    BuildContext context,
    FluxTextStyleConfig styleConfig,
  ) {
    final style = styleConfig.styleSource;
    final customStyle = styleConfig.customStyle?.resolve(context);

    if (style == null) {
      return customStyle;
    }

    final textStyle = style.getTextStyle(context);
    if (textStyle != null && customStyle != null) {
      return textStyle.merge(customStyle);
    }

    return textStyle ?? customStyle;
  }
}
