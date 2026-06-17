// Enum for AnimatedConfigChild types
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/extensions/color_extension.dart';
import 'package:inspireui/utils/colors.dart';

import '../../../core/core.dart';
import '../../../entities/entities.dart';
import '../exts/alignment_ext.dart';
import '../exts/axis_ext.dart';
import '../exts/border_radius_ext.dart';
import '../exts/boxfit_ext.dart';
import '../exts/string_ext.dart';
import '../exts/text_align_ext.dart';
import '../exts/text_overflow_ext.dart';
import 'animated_property.dart';

enum AnimatedConfigChildType {
  image,
  padding,
  row,
  column,
  expanded,
  text,
  sizedBox,
  background,
  align,
  elevatedButton,
  percentSizedBox,
  icon,
  borderRadius,
  custom,
  decorationBox,
  unknown,
}

extension AnimatedConfigChildTypeExtension on AnimatedConfigChildType {
  String get name {
    switch (this) {
      case AnimatedConfigChildType.image:
        return 'image';
      case AnimatedConfigChildType.padding:
        return 'padding';
      case AnimatedConfigChildType.row:
        return 'row';
      case AnimatedConfigChildType.column:
        return 'column';
      case AnimatedConfigChildType.expanded:
        return 'expanded';
      case AnimatedConfigChildType.text:
        return 'text';
      case AnimatedConfigChildType.sizedBox:
        return 'sizedBox';
      case AnimatedConfigChildType.background:
        return 'background';
      case AnimatedConfigChildType.align:
        return 'align';
      case AnimatedConfigChildType.elevatedButton:
        return 'elevatedButton';
      case AnimatedConfigChildType.icon:
        return 'icon';
      case AnimatedConfigChildType.percentSizedBox:
        return 'percentSizedBox';
      case AnimatedConfigChildType.borderRadius:
        return 'borderRadius';
      case AnimatedConfigChildType.custom:
        return 'custom';
      case AnimatedConfigChildType.unknown:
        return 'unknown';
      case AnimatedConfigChildType.decorationBox:
        return 'decorationBox';
    }
  }

  static AnimatedConfigChildType fromString(String? type) {
    switch (type) {
      case 'image':
        return AnimatedConfigChildType.image;
      case 'padding':
        return AnimatedConfigChildType.padding;
      case 'row':
        return AnimatedConfigChildType.row;
      case 'column':
        return AnimatedConfigChildType.column;
      case 'expanded':
        return AnimatedConfigChildType.expanded;
      case 'text':
        return AnimatedConfigChildType.text;
      case 'sizedBox':
        return AnimatedConfigChildType.sizedBox;
      case 'background':
        return AnimatedConfigChildType.background;
      case 'align':
        return AnimatedConfigChildType.align;
      case 'elevatedButton':
        return AnimatedConfigChildType.elevatedButton;
      case 'icon':
        return AnimatedConfigChildType.icon;
      case 'percentSizedBox':
        return AnimatedConfigChildType.percentSizedBox;
      case 'borderRadius':
        return AnimatedConfigChildType.borderRadius;
      case 'custom':
        return AnimatedConfigChildType.custom;
      case 'decorationBox':
        return AnimatedConfigChildType.decorationBox;
      default:
        return AnimatedConfigChildType.unknown;
    }
  }
}

// Base class for all children
abstract class AnimatedConfigChild {
  final AnimatedConfigChildType type;
  final List<AnimatedScript> scripts;
  final AnimatedConfigChild? largeScreen;
  final AnimatedConfigChild? smallScreen;

  AnimatedConfigChild(
    this.type,
    this.scripts,
    this.largeScreen,
    this.smallScreen,
  );

  AnimatedConfigChild getMainConfig(bool isSmallScreen, bool isLargeScreen) {
    if (isSmallScreen && smallScreen != null) {
      return smallScreen!;
    }

    if (isLargeScreen && largeScreen != null) {
      return largeScreen!;
    }

    return this;
  }

  factory AnimatedConfigChild.fromJson(Map<String, dynamic> json) {
    final type = AnimatedConfigChildTypeExtension.fromString(json['type']);

    switch (type) {
      case AnimatedConfigChildType.image:
        return AnimatedConfigImage.fromJson(json);
      case AnimatedConfigChildType.padding:
        return AnimatedConfigPadding.fromJson(json);
      case AnimatedConfigChildType.row:
        return AnimatedConfigList.fromJson(json, axisType: Axis.horizontal);
      case AnimatedConfigChildType.expanded:
        return AnimatedConfigExpanded.fromJson(json);
      case AnimatedConfigChildType.text:
        return AnimatedConfigText.fromJson(json);
      case AnimatedConfigChildType.column:
        return AnimatedConfigList.fromJson(json, axisType: Axis.vertical);
      case AnimatedConfigChildType.sizedBox:
        return AnimatedConfigSizedBox.fromJson(json);
      case AnimatedConfigChildType.background:
        return AnimatedConfigBackground.fromJson(json);
      case AnimatedConfigChildType.align:
        return AnimatedConfigAlign.fromJson(json);
      case AnimatedConfigChildType.elevatedButton:
        return AnimatedConfigElevatedButton.fromJson(json);
      case AnimatedConfigChildType.icon:
        return AnimatedConfigIcon.fromJson(json);
      case AnimatedConfigChildType.percentSizedBox:
        return AnimatedConfigPercentSizedBox.fromJson(json);
      case AnimatedConfigChildType.borderRadius:
        return AnimatedConfigBorderRadius.fromJson(json);
      case AnimatedConfigChildType.custom:
        return AnimatedConfigCustom.fromJson(json);
      case AnimatedConfigChildType.decorationBox:
        return AnimatedConfigDecorationBox.fromJson(json);
      default:
        return AnimatedConfigSizedBox(scripts: []);
    }
  }

  Map<String, dynamic> toJson();
}

// Class for Image node
class AnimatedConfigImage extends AnimatedConfigChild {
  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Map<String, dynamic>? actionConfig;

  AnimatedConfigImage({
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.actionConfig,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
    required List<AnimatedScript> scripts,
  }) : super(AnimatedConfigChildType.image, scripts, largeScreen, smallScreen);

  factory AnimatedConfigImage.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigImage(
      url: json['url'] ?? '',
      fit: BoxFitExtension.fromString(json['fit'].toString()),
      width: json['width'].toString().tryParseDouble(),
      height: json['height'].toString().tryParseDouble(),
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      actionConfig: json['actionConfig'] != null && json['actionConfig'] is Map
          ? Map<String, dynamic>.from(json['actionConfig'])
          : null,
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'url': url,
      'fit': fit.name,
      'width': width,
      'height': height,
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'actionConfig': actionConfig,
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for Padding configuration
class EdgeInsetsConfig {
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;

  EdgeInsetsConfig({this.top, this.bottom, this.start, this.end});

  factory EdgeInsetsConfig.fromJson(Map<String, dynamic> json) {
    return EdgeInsetsConfig(
      top: json['top'].toString().tryParseDouble(),
      bottom: json['bottom'].toString().tryParseDouble(),
      start: json['start'].toString().tryParseDouble(),
      end: json['end'].toString().tryParseDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'top': top, 'bottom': bottom, 'start': start, 'end': end};
  }
}

// Class for BorderRadius node
class AnimatedConfigBorderRadius extends AnimatedConfigChild {
  final BorderRadiusDirectional borderRadius;
  final AnimatedConfigChild child;

  AnimatedConfigBorderRadius({
    required this.borderRadius,
    required this.child,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         AnimatedConfigChildType.borderRadius,
         scripts,
         largeScreen,
         smallScreen,
       );

  factory AnimatedConfigBorderRadius.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigBorderRadius(
      borderRadius: json['borderRadius'] != null && json['borderRadius'] is Map
          ? BorderRadiusDirectionalExtension.fromJson(json['borderRadius'])
          : BorderRadiusDirectional.circular(0),
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : AnimatedConfigSizedBox(scripts: []),
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'borderRadius': borderRadius.toJson(),
      'child': child.toJson(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for Custom node
class AnimatedConfigCustom extends AnimatedConfigChild {
  final Map<String, dynamic>? config;

  AnimatedConfigCustom({
    this.config,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(AnimatedConfigChildType.custom, scripts, largeScreen, smallScreen);

  factory AnimatedConfigCustom.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigCustom(
      config: json['config'] != null && json['config'] is Map
          ? json['config'] as Map<String, dynamic>
          : null,
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'config': config,
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for Padding node
class AnimatedConfigPadding extends AnimatedConfigChild {
  final EdgeInsetsConfig padding;
  final AnimatedConfigChild child;

  AnimatedConfigPadding({
    required this.padding,
    required this.child,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         AnimatedConfigChildType.padding,
         scripts,
         largeScreen,
         smallScreen,
       );

  factory AnimatedConfigPadding.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigPadding(
      padding: json['padding'] != null && json['padding'] is Map
          ? EdgeInsetsConfig.fromJson(json['padding'])
          : EdgeInsetsConfig(),
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : AnimatedConfigSizedBox(scripts: []),
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'padding': padding.toJson(),
      'child': child.toJson(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for Row node
class AnimatedConfigList extends AnimatedConfigChild {
  final List<AnimatedConfigChild> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final Axis axis;

  AnimatedConfigList({
    required this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.axis = Axis.horizontal,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         axis == Axis.horizontal
             ? AnimatedConfigChildType.row
             : AnimatedConfigChildType.column,
         scripts,
         largeScreen,
         smallScreen,
       );

  factory AnimatedConfigList.fromJson(
    Map<String, dynamic> json, {
    Axis? axisType,
  }) {
    final axis =
        axisType ??
        (json['axis'] != null && json['axis'] is String
            ? AxisExtension.fromString(json['axis'])
            : Axis.horizontal);

    return AnimatedConfigList(
      children: json['children'] != null && json['children'] is List
          ? (json['children'] as List)
                .map((child) => AnimatedConfigChild.fromJson(child))
                .toList()
          : [],
      crossAxisAlignment: CrossAxisAlignmentExtension.fromString(
        json['crossAxisAlignment'],
      ),
      mainAxisAlignment: MainAxisAlignmentExtension.fromString(
        json['mainAxisAlignment'],
      ),
      mainAxisSize: MainAxisSizeExtension.fromString(json['mainAxisSize']),
      axis: axis,
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'children': children.map((child) => child.toJson()).toList(),
      'crossAxisAlignment': crossAxisAlignment?.name,
      'mainAxisAlignment': mainAxisAlignment?.name,
      'mainAxisSize': mainAxisSize?.name,
      'axis': axis.name,
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for ElevatedButton node
class AnimatedConfigElevatedButton extends AnimatedConfigChild {
  final AnimatedConfigChild child;
  final Color? color;
  final TextStyle? style;
  final Map<String, dynamic>? actionConfig;
  final Size? minimumSize;
  final double? elevation;
  final double? borderRadius;

  AnimatedConfigElevatedButton({
    required this.child,
    required List<AnimatedScript> scripts,
    this.color,
    this.style,
    this.actionConfig,
    this.minimumSize,
    this.elevation,
    this.borderRadius,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         AnimatedConfigChildType.elevatedButton,
         scripts,
         largeScreen,
         smallScreen,
       );

  factory AnimatedConfigElevatedButton.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigElevatedButton(
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : AnimatedConfigSizedBox(scripts: []),
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      color: json['color'] != null && json['color'] is String
          ? json['color'].toString().toColor()
          : null,
      style: json['style'] != null && json['style'] is Map
          ? const TextStyleConverter().fromJson(json['style'])
          : null,
      actionConfig: json['actionConfig'] != null && json['actionConfig'] is Map
          ? Map<String, dynamic>.from(json['actionConfig'])
          : null,
      minimumSize: json['minimumSize'] is Map
          ? Size(
              json['minimumSize']['width'].toString().tryParseDouble() ?? 100,
              json['minimumSize']['height'].toString().tryParseDouble() ?? 40,
            )
          : null,
      elevation: json['elevation'].toString().tryParseDouble(),
      borderRadius: json['borderRadius'].toString().tryParseDouble(),
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'child': child.toJson(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'color': color?.toColorText(),
      'style': const TextStyleConverter().toJson(style),
      'actionConfig': actionConfig,
      'minimumSize': minimumSize != null
          ? {'width': minimumSize?.width, 'height': minimumSize?.height}
          : null,
      'elevation': elevation,
      'borderRadius': borderRadius,
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for Expanded node
class AnimatedConfigExpanded extends AnimatedConfigChild {
  final int flex;
  final AnimatedConfigChild child;

  AnimatedConfigExpanded({
    this.flex = 1,
    required this.child,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         AnimatedConfigChildType.expanded,
         scripts,
         largeScreen,
         smallScreen,
       );

  factory AnimatedConfigExpanded.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigExpanded(
      flex: json['flex'].toString().tryParseInt() ?? 1,
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(
              Map<String, dynamic>.from(json['child']),
            )
          : AnimatedConfigSizedBox(scripts: []),
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'flex': flex,
      'child': child.toJson(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for Text node
class AnimatedConfigText extends AnimatedConfigChild {
  final String text;
  final Map<String, dynamic>? actionConfig;
  final FluxTextStyleConfig? textStyleConfig;

  AnimatedConfigText({
    required this.text,
    this.textStyleConfig,
    required List<AnimatedScript> scripts,
    this.actionConfig,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(AnimatedConfigChildType.text, scripts, largeScreen, smallScreen);

  factory AnimatedConfigText.fromJson(Map<String, dynamic> json) {
    final textStyleConfig = json['textStyleConfig'];
    final isNewConfig = textStyleConfig is Map && textStyleConfig.isNotEmpty;

    /// Text style config
    var styleConfig = isNewConfig
        ? FluxTextStyleConfig.fromJson(
            Map<String, dynamic>.from(textStyleConfig),
          )
        : null;

    /// Support old config
    if (isNewConfig == false) {
      styleConfig = const FluxTextStyleConfig();
      final style = json['style'] != null && json['style'] is Map
          ? const TextStyleConverter().fromJson(json['style'])
          : null;
      final maxLines = json['maxLines'].toString().tryParseInt();
      final overflow = TextOverflowExtension.tryParse(
        json['overflow']?.toString(),
      );
      final textAlign = TextAlignExtension.tryParse(
        json['textAlign']?.toString(),
      );
      if (style != null) {
        styleConfig = styleConfig.copyWith(
          customStyle: AppTextStyle.fromTextStyle(style),
        );
      }
      if (maxLines != null) {
        styleConfig = styleConfig.copyWith(maxLines: maxLines);
      }
      if (overflow != null) {
        styleConfig = styleConfig.copyWith(textOverflow: overflow);
      }
      if (textAlign != null) {
        styleConfig = styleConfig.copyWith(textAlign: textAlign);
      }
    }

    return AnimatedConfigText(
      text: json['text'] ?? '',
      textStyleConfig: styleConfig,
      scripts: json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      actionConfig: json['actionConfig'] is Map
          ? Map<String, dynamic>.from(json['actionConfig'])
          : null,
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'text': text,
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'actionConfig': actionConfig,
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
      'textStyleConfig': textStyleConfig?.toJson(),
    };
  }
}

// Class for Icon node
class AnimatedConfigIcon extends AnimatedConfigChild {
  final String icon;
  final double size;
  final Color? color;
  final Map<String, dynamic>? actionConfig;

  AnimatedConfigIcon({
    required this.icon,
    this.size = 24,
    this.color,
    required List<AnimatedScript> scripts,
    this.actionConfig,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(AnimatedConfigChildType.icon, scripts, largeScreen, smallScreen);

  factory AnimatedConfigIcon.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigIcon(
      icon: json['icon'] ?? '',
      size: json['size'].toString().tryParseDouble() ?? 24.0,
      color: json['color'] != null && json['color'] is String
          ? json['color'].toString().toColor()
          : null,
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      actionConfig: json['actionConfig'] != null && json['actionConfig'] is Map
          ? Map<String, dynamic>.from(json['actionConfig'])
          : null,
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'icon': icon,
      'size': size,
      'color': color?.toColorText(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'actionConfig': actionConfig,
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for SizedBox node
class AnimatedConfigSizedBox extends AnimatedConfigChild {
  final double? width;
  final double? height;
  final AnimatedConfigChild? child;

  AnimatedConfigSizedBox({
    this.width,
    this.height,
    this.child,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         AnimatedConfigChildType.sizedBox,
         scripts,
         largeScreen,
         smallScreen,
       );

  factory AnimatedConfigSizedBox.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigSizedBox(
      width: json['width'].toString().tryParseDouble(),
      height: json['height'].toString().tryParseDouble(),
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : null,
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'width': width,
      'height': height,
      'child': child?.toJson(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for PercentSizedBox node
class AnimatedConfigPercentSizedBox extends AnimatedConfigChild {
  final double? width;
  final double? height;
  final AnimatedConfigChild? child;

  AnimatedConfigPercentSizedBox({
    this.width,
    this.height,
    this.child,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : assert(
         width == null || width >= 0 && width <= 100,
         'width must be between 0 and 100',
       ),
       assert(
         height == null || height >= 0 && height <= 100,
         'height must be between 0 and 100',
       ),
       super(
         AnimatedConfigChildType.percentSizedBox,
         scripts,
         largeScreen,
         smallScreen,
       );

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'width': width,
      'height': height,
      'child': child?.toJson(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }

  factory AnimatedConfigPercentSizedBox.fromJson(Map<String, dynamic> json) {
    final width = json['width'].toString().tryParseDouble();
    final height = json['height'].toString().tryParseDouble();

    return AnimatedConfigPercentSizedBox(
      width: width != null ? max(min(width, 100), 0) : null,
      height: height != null ? max(min(height, 100), 0) : null,
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : null,
      scripts: json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }
}

// Class for Background node
class AnimatedConfigBackground extends AnimatedConfigChild {
  final Color color;
  final AnimatedConfigChild? child;

  AnimatedConfigBackground({
    required this.color,
    required List<AnimatedScript> scripts,
    this.child,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         AnimatedConfigChildType.background,
         scripts,
         largeScreen,
         smallScreen,
       );

  factory AnimatedConfigBackground.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigBackground(
      color: json['color'].toString().toColor(),
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : null,
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'color': color.toColorText(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'child': child?.toJson(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

/// Class for Decoration node
class AnimatedConfigDecorationBox extends AnimatedConfigChild {
  final BoxDecoration decoration;
  final AnimatedConfigChild child;
  final Map<String, dynamic>? actionConfig;

  AnimatedConfigDecorationBox({
    required this.decoration,
    required List<AnimatedScript> scripts,
    required this.child,
    this.actionConfig,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(
         AnimatedConfigChildType.decorationBox,
         scripts,
         largeScreen,
         smallScreen,
       );

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      ...?const DecorationConverter().toJson(decoration),
      'child': child.toJson(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
      'actionConfig': actionConfig,
    };
  }

  factory AnimatedConfigDecorationBox.fromJson(Map<String, dynamic> json) {
    final decorationRaw = json;
    final scriptsRaw = json['scripts'];
    return AnimatedConfigDecorationBox(
      decoration:
          const DecorationConverter().fromJson(
            Map<String, dynamic>.from(decorationRaw),
          ) ??
          const BoxDecoration(),
      scripts: scriptsRaw is List
          ? scriptsRaw.map((script) => AnimatedScript.fromJson(script)).toList()
          : [],
      child: json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : AnimatedConfigSizedBox(scripts: []),
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
      actionConfig: json['actionConfig'] is Map
          ? Map<String, dynamic>.from(json['actionConfig'])
          : null,
    );
  }
}

// Class for Align node
class AnimatedConfigAlign extends AnimatedConfigChild {
  final AlignmentGeometry alignment;
  final AnimatedConfigChild child;

  AnimatedConfigAlign({
    required this.alignment,
    required this.child,
    required List<AnimatedScript> scripts,
    AnimatedConfigChild? largeScreen,
    AnimatedConfigChild? smallScreen,
  }) : super(AnimatedConfigChildType.align, scripts, largeScreen, smallScreen);

  factory AnimatedConfigAlign.fromJson(Map<String, dynamic> json) {
    return AnimatedConfigAlign(
      alignment: AlignmentGeometryExt.fromString(json['alignment'].toString()),
      child: json['child'] != null && json['child'] is Map
          ? AnimatedConfigChild.fromJson(json['child'])
          : AnimatedConfigSizedBox(scripts: []),
      scripts: json['scripts'] != null && json['scripts'] is List
          ? (json['scripts'] as List)
                .map((script) => AnimatedScript.fromJson(script))
                .toList()
          : [],
      largeScreen: json['largeScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['largeScreen'])
          : null,
      smallScreen: json['smallScreen'] is Map
          ? AnimatedConfigChild.fromJson(json['smallScreen'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'alignment': alignment.alignmentText,
      'child': child.toJson(),
      'scripts': scripts.map((script) => script.toJson()).toList(),
      'largeScreen': largeScreen?.toJson(),
      'smallScreen': smallScreen?.toJson(),
    };
  }
}

// Class for BoxShadow configuration
class BoxShadowDataConfig {
  final Color? color;
  final double opacity;
  final Offset offset;
  final double blurRadius;
  final double spreadRadius;

  BoxShadowDataConfig({
    required this.color,
    required this.opacity,
    required this.offset,
    required this.blurRadius,
    required this.spreadRadius,
  });

  factory BoxShadowDataConfig.fromJson(Map<String, dynamic> json) {
    final hasOffset =
        json['offset'] != null &&
        json['offset'] is List &&
        json['offset'].length == 2;

    return BoxShadowDataConfig(
      color: json['color']?.toString().toColor(),
      opacity: json['opacity'].toString().tryParseDouble() ?? 1.0,
      offset: hasOffset
          ? Offset(
              json['offset'][0].toString().tryParseDouble() ?? 0.0,
              json['offset'][1].toString().tryParseDouble() ?? 0.0,
            )
          : Offset.zero,
      blurRadius: json['blurRadius'].toString().tryParseDouble() ?? 0.0,
      spreadRadius: json['spreadRadius'].toString().tryParseDouble() ?? 1.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color?.toColorText(),
      'opacity': opacity,
      'offset': [offset.dx, offset.dy],
      'blurRadius': blurRadius,
      'spreadRadius': spreadRadius,
    };
  }
}

// Class for decoration configuration
class DecorationConfig {
  final double borderRadius;
  final BoxShadowDataConfig? boxShadows;

  DecorationConfig({required this.borderRadius, this.boxShadows});

  factory DecorationConfig.fromJson(Map<String, dynamic> json) {
    return DecorationConfig(
      borderRadius: json['borderRadius'].toString().tryParseDouble() ?? 0.0,
      boxShadows: json['boxShadow'] != null && json['boxShadow'] is Map
          ? BoxShadowDataConfig.fromJson(json['boxShadow'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'borderRadius': borderRadius, 'boxShadow': boxShadows?.toJson()};
  }
}

// Main configuration class
class AnimatedStackContainerData {
  final double? width;
  final double? height;
  final double? clipBorderRadius;
  final int? delayStart;
  final EdgeInsetsConfig? margin;
  final EdgeInsetsConfig? padding;
  final AnimatedConfigBackground? background;
  final DecorationConfig? decoration;
  final List<AnimatedConfigChild> children;
  final bool autoPlay;
  final Map<String, dynamic>? actionConfig;
  final double? smallScreenMaxWidth;
  final double? largeScreenMinWidth;
  final StackFit fitBody;

  AnimatedStackContainerData({
    this.width,
    this.height,
    this.clipBorderRadius,
    this.delayStart,
    this.margin,
    this.padding,
    this.background,
    this.decoration,
    required this.children,
    this.autoPlay = true,
    this.actionConfig,
    this.smallScreenMaxWidth,
    this.largeScreenMinWidth,
    this.fitBody = StackFit.loose,
  });

  factory AnimatedStackContainerData.fromJson(Map<String, dynamic> json) {
    return AnimatedStackContainerData(
      width: json['width'].toString().tryParseDouble(),
      height: json['height'].toString().tryParseDouble(),
      clipBorderRadius: json['clipBorderRadius'].toString().tryParseDouble(),
      delayStart: json['delayStart'].toString().tryParseInt(),
      margin: json['margin'] != null && json['margin'] is Map
          ? EdgeInsetsConfig.fromJson(json['margin'])
          : null,
      padding: json['padding'] != null && json['padding'] is Map
          ? EdgeInsetsConfig.fromJson(json['padding'])
          : null,
      background: json['background'] != null && json['background'] is Map
          ? AnimatedConfigBackground.fromJson(json['background'])
          : null,
      decoration: json['decoration'] != null && json['decoration'] is Map
          ? DecorationConfig.fromJson(json['decoration'])
          : null,
      children: json['children'] != null && json['children'] is List
          ? (json['children'] as List)
                .map((child) => AnimatedConfigChild.fromJson(child))
                .toList()
          : [],
      autoPlay: json['autoPlay'].toString().tryParseBool() ?? true,
      actionConfig: json['actionConfig'] != null && json['actionConfig'] is Map
          ? Map<String, dynamic>.from(json['actionConfig'])
          : null,
      smallScreenMaxWidth: json['smallScreenMaxWidth']
          .toString()
          .tryParseDouble(),
      largeScreenMinWidth: json['largeScreenMinWidth']
          .toString()
          .tryParseDouble(),
      fitBody: _convertFitBody(json['fitBody']?.toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'clipBorderRadius': clipBorderRadius,
      'delayStart': delayStart,
      'margin': margin?.toJson(),
      'padding': padding?.toJson(),
      'background': background?.toJson(),
      'decoration': decoration?.toJson(),
      'children': children.map((child) => child.toJson()).toList(),
      'autoPlay': autoPlay,
      'actionConfig': actionConfig,
      'smallScreenMaxWidth': smallScreenMaxWidth,
      'largeScreenMinWidth': largeScreenMinWidth,
      'fitBody': fitBody.name,
    };
  }
}

StackFit _convertFitBody(String? value) {
  return StackFit.values.firstWhereOrNull((e) => e.name == value) ??
      StackFit.loose;
}

extension CrossAxisAlignmentExtension on CrossAxisAlignment {
  static CrossAxisAlignment fromString(String? value) {
    return CrossAxisAlignment.values.firstWhereOrNull((e) => e.name == value) ??
        CrossAxisAlignment.center;
  }
}

extension MainAxisAlignmentExtension on MainAxisAlignment {
  static MainAxisAlignment fromString(String? value) {
    return MainAxisAlignment.values.firstWhereOrNull((e) => e.name == value) ??
        MainAxisAlignment.start;
  }
}

extension MainAxisSizeExtension on MainAxisSize {
  static MainAxisSize fromString(String? value) {
    return MainAxisSize.values.firstWhereOrNull((e) => e.name == value) ??
        MainAxisSize.max;
  }
}

extension FontWeightExtension on FontWeight {
  static FontWeight fromString(String? value) {
    switch (value) {
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }

  String get name {
    return 'w${(value ~/ 100).clamp(1, 9)}00';
  }
}

extension ColorStringExtension on String {
  Color toColor() {
    return HexColor(this);
  }
}
