import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';

import '../../core/helpers/theme_helper.dart';
import '../../core/tools/tools.dart';
import '../../entities/header_config.dart';
import '../../widgets/html_widget.dart';

// import '../../../common/theme/theme_helper.dart';
// import '../../../common/tools.dart';
// import '../../../widgets/html/index.dart';
// import '../config/header_config.dart';

class HeaderType extends StatelessWidget {
  final HeaderConfig config;
  final String Function(String?) getReplacedParams;

  const HeaderType({
    super.key,
    required this.config,
    required this.getReplacedParams,
  });

  @override
  Widget build(BuildContext context) {
    var font = config.font;
    var fontSize = config.fontSize;
    var textOpacity = config.textOpacity;
    var fontWeight = config.fontWeight;
    var textColor = config.textColor != null
        ? HexColor(config.textColor)
        : Theme.of(context).colorScheme.secondary;
    final alignment = Tools.getAlignment(config.alignment);

    var textStyle = ThemeHelper.getFont(
      font,
      textStyle: TextStyle(
        fontSize: fontSize.toDouble(),
        fontWeight: Tools.getFontWeight(fontWeight.toString()),
        color: textColor.withValueOpacity(textOpacity.toDouble()),
      ),
    );

    Widget renderAnimatedText({required List<AnimatedText> animatedTexts}) {
      if (animatedTexts.isEmpty) {
        if (config.title != null && config.title.toString().isNotEmpty) {
          return HtmlWidget(
            getReplacedParams(config.title),
            textStyle: textStyle,
          );
        }
        return const SizedBox();
      }
      return _AnimatedTextItem(
        title: config.title,
        textStyle: textStyle,
        minWidth: config.minWidth.toDouble(),
        animatedTexts: animatedTexts,
        alignment: alignment,
        getReplacedParams: getReplacedParams,
      );
    }

    switch (config.type) {
      case 'rotate':
        return renderAnimatedText(
          animatedTexts: [
            for (var name in config.rotate)
              RotateAnimatedText(
                name,
                textStyle: textStyle,
                alignment: alignment,
              ),
          ],
        );
      case 'fade':
        return renderAnimatedText(
          animatedTexts: [
            for (var name in config.rotate)
              FadeAnimatedText(name, textStyle: textStyle),
          ],
        );
      case 'typer':
        return renderAnimatedText(
          animatedTexts: [
            for (var name in config.rotate)
              TyperAnimatedText(name, textStyle: textStyle),
          ],
        );
      case 'typewriter':
        return renderAnimatedText(
          animatedTexts: [
            for (var name in config.rotate)
              TypewriterAnimatedText(name, textStyle: textStyle),
          ],
        );
      case 'scale':
        return renderAnimatedText(
          animatedTexts: [
            for (var name in config.rotate)
              ScaleAnimatedText(name, textStyle: textStyle),
          ],
        );
      case 'color':
        return renderAnimatedText(
          animatedTexts: [
            for (var name in config.rotate)
              ColorizeAnimatedText(
                name,
                textStyle: textStyle,
                colors: [Colors.purple, Colors.blue, Colors.yellow, Colors.red],
              ),
          ],
        );
      case 'static':
      default:
        return renderAnimatedText(animatedTexts: []);
    }
  }
}

class _AnimatedTextItem extends StatelessWidget {
  final String? title;
  final TextStyle? textStyle;
  final double minWidth;
  final List<AnimatedText> animatedTexts;
  final AlignmentGeometry alignment;
  final String Function(String?) getReplacedParams;

  const _AnimatedTextItem({
    this.title,
    this.textStyle,
    this.minWidth = 0.0,
    required this.animatedTexts,
    required this.alignment,
    required this.getReplacedParams,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: minWidth),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title?.isNotEmpty ?? false) ...[
            Align(
              alignment: alignment,
              child: HtmlWidget(
                getReplacedParams(title),
                textStyle: textStyle ?? const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(width: 10.0),
          ],
          Align(
            alignment: alignment,
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              animatedTexts: animatedTexts,
              repeatForever: true,
            ),
          ),
        ],
      ),
    );
  }
}
