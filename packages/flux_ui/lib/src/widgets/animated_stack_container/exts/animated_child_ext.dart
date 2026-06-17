import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inspireui/icons/icon_picker.dart';

import '../../../core/helpers/theme_helper.dart';
import '../../../entities/flux_config/text/flux_text_config.dart';
import '../../flux_image.dart';
import '../../flux_widget/flux_text.dart';
import '../entities/animated_config_child.dart';

extension AnimatedChildExt on AnimatedConfigChild {
  Widget build(
    BuildContext context, {

    /// Main config is the config that is used to build the child.
    /// It is used to get the action config.
    /// If the main config is not null, it will be used to get the action config.
    /// Otherwise, the action config will be the action config of the current config.
    /// Main config will take precedence over current config.
    AnimatedConfigChild? mainConfig,
    required bool isSmallScreen,
    required bool isLargeScreen,
    Widget Function(BuildContext context, Map<String, dynamic> config)?
    builderCustom,
    FutureOr<void> Function(BuildContext context, Map<String, dynamic>? config)?
    onTapHandler,
    Widget Function(
      Widget content,
      (AnimatedConfigChild child, int? index) data,
    )?
    builder,
    int? index,
  }) {
    Widget content = const SizedBox.shrink();
    Map<String, dynamic>? actionConfig;

    switch (type) {
      case AnimatedConfigChildType.decorationBox:
        final configDecorationBox = this as AnimatedConfigDecorationBox;
        if (mainConfig != null && mainConfig is AnimatedConfigDecorationBox) {
          actionConfig = mainConfig.actionConfig;
        } else {
          actionConfig = configDecorationBox.actionConfig;
        }

        content = Container(
          decoration: configDecorationBox.decoration,
          child: configDecorationBox.child.build(
            context,
            builderCustom: builderCustom,
            onTapHandler: onTapHandler,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: mainConfig,
            builder: builder,
          ),
        );
        break;
      case AnimatedConfigChildType.background:
        final configBackground = this as AnimatedConfigBackground;
        var configChild = configBackground.child?.getMainConfig(
          isSmallScreen,
          isLargeScreen,
        );

        content = DecoratedBox(
          decoration: BoxDecoration(color: configBackground.color),
          child: configChild?.build(
            context,
            builderCustom: builderCustom,
            onTapHandler: onTapHandler,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: mainConfig,
            builder: builder,
          ),
        );
        break;
      case AnimatedConfigChildType.icon:
        final configIcon = this as AnimatedConfigIcon;
        final useImage = [
          'http',
          'asset',
          '/',
          '\\',
        ].any((e) => configIcon.icon.contains(e));
        if (mainConfig != null && mainConfig is AnimatedConfigIcon) {
          actionConfig = mainConfig.actionConfig;
        } else {
          actionConfig = configIcon.actionConfig;
        }

        if (useImage) {
          content = FluxImage(
            imageUrl: configIcon.icon,
            fit: BoxFit.contain,
            width: configIcon.size,
            height: configIcon.size,
            color: configIcon.color,
          );
        } else {
          var icon = iconPicker(configIcon.icon, 'CupertinoIcons');

          icon ??= iconPicker(configIcon.icon, 'MaterialIcons');

          content = Icon(
            icon ?? Icons.error,
            size: configIcon.size,
            color: configIcon.color,
          );
        }

        break;
      case AnimatedConfigChildType.image:
        final configImage = this as AnimatedConfigImage;
        if (mainConfig != null && mainConfig is AnimatedConfigImage) {
          actionConfig = mainConfig.actionConfig;
        } else {
          actionConfig = configImage.actionConfig;
        }

        content = FluxImage(
          imageUrl: configImage.url,
          fit: configImage.fit,
          width: configImage.width,
          height: configImage.height,
        );
        break;
      case AnimatedConfigChildType.text:
        final configText = this as AnimatedConfigText;
        if (mainConfig != null && mainConfig is AnimatedConfigText) {
          actionConfig = mainConfig.actionConfig;
        } else {
          actionConfig = configText.actionConfig;
        }

        final textStyle = configText.textStyleConfig;
        content = FluxText(
          config: FluxTextConfig(text: configText.text, styleConfig: textStyle),
        );
        break;
      case AnimatedConfigChildType.padding:
        final configPadding = this as AnimatedConfigPadding;
        var configChild = configPadding.child.getMainConfig(
          isSmallScreen,
          isLargeScreen,
        );

        content = Padding(
          padding: EdgeInsetsDirectional.only(
            top: configPadding.padding.top ?? 0.0,
            bottom: configPadding.padding.bottom ?? 0.0,
            start: configPadding.padding.start ?? 0.0,
            end: configPadding.padding.end ?? 0.0,
          ),
          child: configChild.build(
            context,
            builderCustom: builderCustom,
            onTapHandler: onTapHandler,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: mainConfig,
            builder: builder,
          ),
        );
        break;
      case AnimatedConfigChildType.row:
        final configRow = this as AnimatedConfigList;
        content = Row(
          mainAxisAlignment:
              configRow.mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment:
              configRow.crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: configRow.mainAxisSize ?? MainAxisSize.max,
          children: List.generate(configRow.children.length, (index) {
            final item = configRow.children[index];
            final configChild = item.getMainConfig(
              isSmallScreen,
              isLargeScreen,
            );
            return configChild.build(
              context,
              builderCustom: builderCustom,
              onTapHandler: onTapHandler,
              isSmallScreen: isSmallScreen,
              isLargeScreen: isLargeScreen,
              mainConfig: mainConfig,
              index: index,
              builder: builder,
            );
          }),
        );
        break;
      case AnimatedConfigChildType.column:
        final configColumn = this as AnimatedConfigList;
        content = Column(
          mainAxisAlignment:
              configColumn.mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment:
              configColumn.crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: configColumn.mainAxisSize ?? MainAxisSize.max,
          children: List.generate(configColumn.children.length, (index) {
            final item = configColumn.children[index];
            final configChild = item.getMainConfig(
              isSmallScreen,
              isLargeScreen,
            );
            return configChild.build(
              context,
              builderCustom: builderCustom,
              onTapHandler: onTapHandler,
              isSmallScreen: isSmallScreen,
              isLargeScreen: isLargeScreen,
              mainConfig: mainConfig,
              index: index,
              builder: builder,
            );
          }),
        );
        break;
      case AnimatedConfigChildType.expanded:
        final configExpanded = this as AnimatedConfigExpanded;
        var configChild = configExpanded.child.getMainConfig(
          isSmallScreen,
          isLargeScreen,
        );

        content = Expanded(
          flex: configExpanded.flex,
          child: configChild.build(
            context,
            builderCustom: builderCustom,
            onTapHandler: onTapHandler,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: mainConfig,
            builder: builder,
          ),
        );
        break;
      case AnimatedConfigChildType.sizedBox:
        final configSizedBox = this as AnimatedConfigSizedBox;
        var configChild = configSizedBox.child?.getMainConfig(
          isSmallScreen,
          isLargeScreen,
        );

        content = SizedBox(
          width: configSizedBox.width,
          height: configSizedBox.height,
          child: configChild?.build(
            context,
            builderCustom: builderCustom,
            onTapHandler: onTapHandler,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: mainConfig,
            builder: builder,
          ),
        );
        break;
      case AnimatedConfigChildType.percentSizedBox:
        final configPercentSizedBox = this as AnimatedConfigPercentSizedBox;
        final sizeScreen = MediaQuery.sizeOf(context);
        content = LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth != double.infinity
                ? constraints.maxWidth
                : sizeScreen.width;

            final maxHeight = constraints.maxHeight != double.infinity
                ? constraints.maxHeight
                : sizeScreen.height;

            var configChild = configPercentSizedBox.child?.getMainConfig(
              isSmallScreen,
              isLargeScreen,
            );
            final cfgW = configPercentSizedBox.width;
            final cfgH = configPercentSizedBox.height;

            final width = cfgW != null ? (maxWidth * cfgW / 100) : null;
            final height = cfgH != null ? (maxHeight * cfgH / 100) : null;

            return SizedBox(
              width: width,
              height: height,
              child: configChild?.build(
                context,
                builderCustom: builderCustom,
                onTapHandler: onTapHandler,
                isSmallScreen: isSmallScreen,
                isLargeScreen: isLargeScreen,
                mainConfig: mainConfig,
                builder: builder,
              ),
            );
          },
        );
        break;
      case AnimatedConfigChildType.elevatedButton:
        final configElevatedButton = this as AnimatedConfigElevatedButton;
        var btnActionConfig = configElevatedButton.actionConfig;
        if (mainConfig != null && mainConfig is AnimatedConfigElevatedButton) {
          btnActionConfig = mainConfig.actionConfig;
        } else {
          btnActionConfig = configElevatedButton.actionConfig;
        }

        var configChild = configElevatedButton.child.getMainConfig(
          isSmallScreen,
          isLargeScreen,
        );

        final textStyle = configElevatedButton.style;
        final fontFamily = textStyle?.fontFamily;
        content = ElevatedButton(
          onPressed: onTapHandler != null
              ? () => onTapHandler(context, btnActionConfig)
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: configElevatedButton.color,
            disabledBackgroundColor: configElevatedButton.color,
            textStyle: ThemeHelper.getFont(fontFamily, textStyle: textStyle),
            minimumSize: configElevatedButton.minimumSize,
            elevation: configElevatedButton.elevation,
            shape: configElevatedButton.borderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      configElevatedButton.borderRadius!,
                    ),
                  )
                : null,
          ),
          child: configChild.build(
            context,
            builderCustom: builderCustom,
            onTapHandler: onTapHandler,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: mainConfig,
            builder: builder,
          ),
        );
        break;
      case AnimatedConfigChildType.align:
        final configAlign = this as AnimatedConfigAlign;
        var configChild = configAlign.child.getMainConfig(
          isSmallScreen,
          isLargeScreen,
        );

        if (configAlign.alignment == Alignment.center) {
          content = Center(
            child: configChild.build(
              context,
              builderCustom: builderCustom,
              onTapHandler: onTapHandler,
              isSmallScreen: isSmallScreen,
              isLargeScreen: isLargeScreen,
              mainConfig: mainConfig,
              builder: builder,
            ),
          );
        } else {
          content = Align(
            alignment: configAlign.alignment,
            child: configChild.build(
              context,
              builderCustom: builderCustom,
              onTapHandler: onTapHandler,
              isSmallScreen: isSmallScreen,
              isLargeScreen: isLargeScreen,
              mainConfig: mainConfig,
              builder: builder,
            ),
          );
        }
        break;

      case AnimatedConfigChildType.borderRadius:
        final configBorderRadius = this as AnimatedConfigBorderRadius;
        var configChild = configBorderRadius.child.getMainConfig(
          isSmallScreen,
          isLargeScreen,
        );

        content = ClipRRect(
          borderRadius: configBorderRadius.borderRadius,
          child: configChild.build(
            context,
            builderCustom: builderCustom,
            onTapHandler: onTapHandler,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: mainConfig,
            builder: builder,
          ),
        );
        break;
      case AnimatedConfigChildType.custom:
        final configCustom = this as AnimatedConfigCustom;
        if (configCustom.config != null && builderCustom != null) {
          content = builderCustom(context, configCustom.config!);
        } else {
          content = const SizedBox.shrink();
        }
        break;
      default:
        content = const SizedBox.shrink();
    }

    if (actionConfig != null) {
      content = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTapHandler?.call(context, actionConfig),
        child: content,
      );
    }

    return builder?.call(content, (this, index)) ?? content;
  }
}
