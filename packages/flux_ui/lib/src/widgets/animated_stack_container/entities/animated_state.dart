import 'package:collection/collection.dart';

import 'animated_alignment_state.dart';

enum AnimatedStateType {
  slide,
  opacity,
  size,
  position,
  alignment,
  scale,
  unknown;

  static AnimatedStateType fromString(String? value) {
    return AnimatedStateType.values.firstWhereOrNull(
          (type) => type.name == value,
        ) ??
        AnimatedStateType.unknown;
  }
}

/// The `AnimatedState` abstract class is a part of the `animated_stack_container` package
/// and is designed to represent the state of an animated widget.
abstract class AnimatedState {
  Map<String, dynamic> toJson();

  final AnimatedStateType type;

  AnimatedState({required this.type});

  /// Factory constructor to create an instance of `AnimatedState` from a JSON map.
  /// Attempts to parse the `AnimatedState` instance from the JSON map, converting it to a `double`.
  /// If parsing fails, it defaults to `0.0`.
  static AnimatedState fromJson(Map<String, dynamic> json) {
    /// Check if the JSON map contains the 'x' and 'y' keys, indicating a slide animation.
    final isSlide = json.containsKey('x') && json.containsKey('y');
    if (isSlide) {
      return AnimatedSlideState.fromJson(json);
    }

    /// Check if the JSON map contains the 'opacity' key, indicating an opacity animation.
    final isOpacity = json.containsKey('opacity');
    if (isOpacity) {
      return AnimatedOpacityState.fromJson(json);
    }

    /// Check if the JSON map contains the 'width' and 'height' keys, indicating a size animation.
    final isSize = json.containsKey('width') && json.containsKey('height');
    if (isSize) {
      return AnimatedSizeState.fromJson(json);
    }

    /// Check if the JSON map contains the 'top', 'left', 'right', or 'bottom' keys, indicating a position animation.
    final isPosition =
        json.containsKey('top') ||
        json.containsKey('start') ||
        json.containsKey('end') ||
        json.containsKey('bottom');
    if (isPosition) {
      return AnimatedPositionState.fromJson(json);
    }

    /// Check if the JSON map contains the 'alignment' key, indicating an alignment animation.
    final isAlignment = json.containsKey('alignment');
    if (isAlignment) {
      return AnimatedAlignmentState.fromJson(json);
    }

    /// Check if the JSON map contains the 'scale' key, indicating a scale animation.
    final isScale = json.containsKey('scale');
    if (isScale) {
      return AnimatedScaleState.fromJson(json);
    }

    /// If none of the above conditions are met, return an instance of `UnknownAnimatedState`.
    return UnknownAnimatedState();
  }
}

class UnknownAnimatedState extends AnimatedState {
  UnknownAnimatedState() : super(type: AnimatedStateType.unknown);
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The `AnimatedSlideState` class is a part of the `animated_stack_container` package
/// and extends the `AnimatedState` abstract class. It is designed to represent the slide
/// animation of an animated widget with x and y offset values.
class AnimatedSlideState extends AnimatedState {
  /// Represents the x-axis offset of the widget.
  /// Must be a `double`.
  /// Defaults to `0.0` if not provided during JSON deserialization.
  final double x;

  /// Represents the y-axis offset of the widget.
  final double y;

  /// Initializes the slide properties.
  /// Asserts that both x and y are `double` values.
  AnimatedSlideState({required this.x, required this.y})
    : super(type: AnimatedStateType.slide);

  /// Factory constructor to create an instance of `AnimatedSlideState` from a JSON map.
  /// Attempts to parse both `x` and `y` values from the JSON map, converting them to `double`.
  /// If parsing fails, it defaults to `0.0`.
  factory AnimatedSlideState.fromJson(Map<String, dynamic> json) {
    return AnimatedSlideState(
      x: num.tryParse(json['x'].toString())?.toDouble() ?? 0.0,
      y: num.tryParse(json['y'].toString())?.toDouble() ?? 0.0,
    );
  }

  /// Converts the `AnimatedSlideState` instance into a JSON map.
  /// Includes both `x` and `y` properties.
  @override
  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y};
  }
}

/// The `AnimatedOpacityState` class is a part of the `animated_stack_container` package
/// and extends the `AnimatedState` abstract class. It is designed to represent the opacity
/// of an animated widget with a single opacity value.
class AnimatedOpacityState extends AnimatedState {
  /// Represents the opacity of the widget.
  /// Must be between 0.0 and 1.0.
  /// Defaults to `1.0` if not provided during JSON deserialization.
  final double opacity;

  /// Initializes the opacity property.
  /// Asserts that the opacity is between 0.0 and 1.0.
  AnimatedOpacityState({required this.opacity})
    : assert(
        opacity >= 0.0 && opacity <= 1.0,
        'opacity must be between 0.0 and 1.0',
      ),
      super(type: AnimatedStateType.opacity);

  /// Factory constructor to create an instance of `AnimatedOpacityState` from a JSON map.
  /// Attempts to parse the `opacity` value from the JSON map, converting it to a `double`.
  /// If parsing fails, it defaults to `1.0`.
  factory AnimatedOpacityState.fromJson(Map<String, dynamic> json) {
    return AnimatedOpacityState(
      opacity: num.tryParse(json['opacity'].toString())?.toDouble() ?? 1.0,
    );
  }

  /// Converts the `AnimatedOpacityState` instance into a JSON map.
  /// Includes the `opacity` property.
  @override
  Map<String, dynamic> toJson() {
    return {'opacity': opacity};
  }
}

/// The `AnimatedSizeState` class is a part of the `animated_stack_container` package
/// and extends the `AnimatedState` abstract class. It is designed to represent the size
/// of an animated widget with width and height properties.
class AnimatedSizeState extends AnimatedState {
  /// Represents the width of the widget.
  /// Must be greater than or equal to 0.
  /// Defaults to `0.0` if not provided during JSON deserialization.
  final double width;

  /// Represents the height of the widget.
  /// Must be greater than or equal to 0.
  /// Defaults to `0.0` if not provided during JSON deserialization.
  final double height;

  /// Initializes the size properties.
  /// Asserts that both width and height are greater than or equal to 0.
  AnimatedSizeState({required this.width, required this.height})
    : assert(width >= 0, 'width must be greater than or equal to 0'),
      assert(height >= 0, 'height must be greater than or equal to 0'),
      super(type: AnimatedStateType.size);

  /// Converts the `AnimatedSizeState` instance into a JSON map.
  /// Includes both `width` and `height` properties.
  @override
  Map<String, dynamic> toJson() {
    return {'width': width, 'height': height};
  }

  /// Factory constructor to create an instance of `AnimatedSizeState` from a JSON map.
  /// Attempts to parse both `width` and `height` values from the JSON map, converting them to `double`.
  /// If parsing fails, it defaults to `0.0`.
  factory AnimatedSizeState.fromJson(Map<String, dynamic> json) {
    return AnimatedSizeState(
      width: num.tryParse(json['width'].toString())?.toDouble() ?? 0.0,
      height: num.tryParse(json['height'].toString())?.toDouble() ?? 0.0,
    );
  }
}

/// The `AnimatedScaleState` class is a part of the `animated_stack_container` package
/// and extends the `AnimatedState` abstract class. It is designed to represent the scaling
/// of an animated widget with a single scale factor.
class AnimatedScaleState extends AnimatedState {
  /// Represents the scaling factor of the widget.
  /// Must be greater than or equal to 0.
  /// Defaults to `1.0` if not provided during JSON deserialization.
  final double scale;

  /// Initializes the scale property.
  /// Asserts that the scale is greater than or equal to 0.
  AnimatedScaleState({required this.scale})
    : assert(scale >= 0, 'scale must be greater than or equal to 0'),
      super(type: AnimatedStateType.scale);

  /// Converts the `AnimatedScaleState` instance into a JSON map.
  /// Includes the `scale` property.
  @override
  Map<String, dynamic> toJson() {
    return {'scale': scale};
  }

  /// Factory constructor to create an instance of `AnimatedScaleState` from a JSON map.
  /// Attempts to parse the `scale` value from the JSON map, converting it to a `double`.
  /// If parsing fails, it defaults to `1.0`.
  factory AnimatedScaleState.fromJson(Map<String, dynamic> json) {
    return AnimatedScaleState(
      scale: num.tryParse(json['scale'].toString())?.toDouble() ?? 1.0,
    );
  }
}

/// The `AnimatedPositionState` class is a part of the `animated_stack_container` package
/// and extends the `AnimatedState` abstract class. It is designed to represent the position
/// of an animated widget with optional top, left, right, and bottom properties.
class AnimatedPositionState extends AnimatedState {
  /// Represents the top position of the widget.
  /// Nullable, allowing for flexible positioning.
  /// Defaults to `0.0` if not provided during JSON deserialization.
  final double? top;

  /// Represents the left position of the widget.
  /// Nullable, allowing for flexible positioning.
  /// Defaults to `0.0` if not provided during JSON deserialization.
  final double? start;

  /// Represents the end position of the widget.
  /// Nullable, allowing for flexible positioning.
  /// Defaults to `0.0` if not provided during JSON deserialization.
  final double? end;

  /// Represents the bottom position of the widget.
  /// Nullable, allowing for flexible positioning.
  /// Defaults to `0.0` if not provided during JSON deserialization.
  final double? bottom;

  /// Initializes the position properties (`top`, `left`, `right`, `bottom`).
  /// All parameters are optional and can be set to `null`.
  AnimatedPositionState({this.top, this.start, this.end, this.bottom})
    : super(type: AnimatedStateType.position);

  /// Factory constructor to create an instance of `AnimatedPositionState` from a JSON map.
  /// Attempts to parse each position value from the JSON map, converting it to a `double`.
  /// If parsing fails, it defaults to `0.0`.
  factory AnimatedPositionState.fromJson(Map<String, dynamic> json) {
    return AnimatedPositionState(
      top: num.tryParse(json['top'].toString())?.toDouble() ?? 0.0,
      start: num.tryParse(json['start'].toString())?.toDouble() ?? 0.0,
      end: num.tryParse(json['end'].toString())?.toDouble() ?? 0.0,
      bottom: num.tryParse(json['bottom'].toString())?.toDouble() ?? 0.0,
    );
  }

  /// Converts the `AnimatedPositionState` instance into a JSON map.
  /// Includes all four position properties (`top`, `left`, `right`, `bottom`).
  @override
  Map<String, dynamic> toJson() {
    return {'top': top, 'start': start, 'end': end, 'bottom': bottom};
  }
}
