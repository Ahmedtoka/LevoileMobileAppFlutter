import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';

import '../../core/helpers/helpers.dart';
import '../../entities/header_config.dart';
import '../../widgets/background_color_widget.dart';

// import '../../../common/tools.dart';
// import '../../../widgets/common/background_color_widget.dart';
// import '../config/header_config.dart';
// import '../helper/helper.dart';

class HeaderSearch extends StatelessWidget {
  final HeaderConfig config;
  final Function? onSearch;

  const HeaderSearch({required this.config, this.onSearch, super.key});

  @override
  Widget build(BuildContext context) {
    final useGradiantBG = (config.backgroundGradientColor?.isNotEmpty ?? false);
    final enableBackground = config.enableBackground || useGradiantBG;
    final textColor = config.textColor != null
        ? HexColor(config.textColor)
        : Theme.of(context).colorScheme.secondary.withValueOpacity(
            FluxUiHelper.formatDouble(config.textOpacity) ?? 0.8,
          );

    return BackgroundColorWidget(
      enable: enableBackground,
      decoration: useGradiantBG
          ? BoxDecoration(
              gradient: config.getGradientColor,
              color: config.getOutsideColor,
            )
          : null,
      child: Container(
        margin: EdgeInsets.only(
          top: config.marginTop.toDouble(),
          left: config.marginLeft.toDouble(),
          right: config.marginRight.toDouble(),
          bottom: config.marginBottom.toDouble(),
        ),
        child: SafeArea(
          bottom: false,
          top: config.isSafeArea == true,
          child: InkWell(
            borderRadius: BorderRadius.circular(
              config.radius?.toDouble() ?? 30.0,
            ),
            onTap: () => onSearch?.call(),
            child: Container(
              padding: EdgeInsets.only(
                top: config.paddingTop.toDouble(),
                left: config.paddingLeft.toDouble(),
                right: config.paddingRight.toDouble(),
                bottom: config.paddingBottom.toDouble(),
              ),
              height: config.height.toDouble(),
              decoration: BoxDecoration(
                color: config.backgroundColor != null
                    ? HexColor(config.backgroundColor)
                    : (config.usePrimaryColor
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).colorScheme.surface),
                boxShadow: [
                  if (config.boxShadow != null)
                    BoxShadow(
                      blurRadius: config.boxShadow!.blurRadius,
                      color: Theme.of(context).colorScheme.secondary
                          .withValueOpacity(config.boxShadow!.colorOpacity),
                      spreadRadius: config.boxShadow!.spreadRadius,
                      offset: Offset(config.boxShadow!.x, config.boxShadow!.y),
                    ),
                ],
                borderRadius: BorderRadius.circular(
                  config.radius?.toDouble() ?? 30.0,
                ),
                border: Border.all(
                  width: 1.0,
                  color: config.borderInput
                      ? Colors.black.withValueOpacity(0.05)
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(CupertinoIcons.search, color: textColor, size: 24),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      config.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: FluxUiHelper.formatDouble(config.fontSize),
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
