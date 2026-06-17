import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'animated_state.dart';
import 'curve_type.dart';

/// The `PositionProperty` class extends `AnimatedScript` and is designed to represent
/// the properties of an animated widget with position changes.
class PositionProperty extends AnimatedScript {
  final double? top;
  final double? start;
  final double? end;
  final double? bottom;
  final bool isFill;

  /// Constructor to create an instance of `PositionProperty`.
  /// Initializes the `duration`, `curveType`, `startState`, and `endState` properties.
  PositionProperty({
    this.top,
    this.start,
    this.end,
    this.bottom,
    this.isFill = false,
  }) : super.position(top: top, start: start, end: end, bottom: bottom);

  /// Method to convert the `PositionProperty` instance to a JSON map.
  /// Returns a map containing the `top`, `left`, `right`, and `bottom` properties.
  @override
  Map<String, dynamic> toJson() {
    return {
      'top': top,
      'start': start,
      'end': end,
      'bottom': bottom,
      'isFill': isFill,
    };
  }

  /// Factory constructor to create an instance of `PositionProperty` from a JSON map.
  /// Parses the JSON map to initialize the `top`, `left`, `right`, and `bottom` properties.
  /// If the value is not a number, it defaults to `null`.
  factory PositionProperty.fromJson(Map<String, dynamic> json) {
    return PositionProperty(
      top: num.tryParse(json['top'].toString())?.toDouble(),
      start: num.tryParse(json['start'].toString())?.toDouble(),
      end: num.tryParse(json['end'].toString())?.toDouble(),
      bottom: num.tryParse(json['bottom'].toString())?.toDouble(),
      isFill: json['isFill'] ?? false,
    );
  }
}

/// The `AnimatedScript` class is a part of the `animated_stack_container` package
/// and is designed to represent the properties of an animated widget.
class AnimatedScript {
  final Duration duration;
  final CurveType curveType;
  final AnimatedState startState;
  final AnimatedState endState;
  final Duration delay;
  final AnimatedScriptType type;

  /// Constructor to create an instance of `AnimatedScript`.
  /// Initializes the `duration`, `curveType`, `startState`, and `endState` properties.
  /// Start state and end state must be of the same type.
  AnimatedScript({
    required this.duration,
    this.delay = Duration.zero,
    this.curveType = CurveType.linear,
    required this.startState,
    required this.endState,
  }) : assert(
         startState is! UnknownAnimatedState &&
             endState is! UnknownAnimatedState &&
             startState.runtimeType == endState.runtimeType,
         'Start state and end state must be of the same type',
       ),
       type = AnimatedScriptType.animation;

  AnimatedScript.position({
    double? top,
    double? start,
    double? end,
    double? bottom,
  }) : type = AnimatedScriptType.position,
       startState = AnimatedPositionState(
         top: top ?? 0,
         start: start ?? 0,
         end: end ?? 0,
         bottom: bottom ?? 0,
       ),
       endState = AnimatedPositionState(
         top: top ?? 0,
         start: start ?? 0,
         end: end ?? 0,
         bottom: bottom ?? 0,
       ),
       duration = Duration.zero,
       curveType = CurveType.linear,
       delay = Duration.zero;

  /// Method to convert the `AnimatedScript` instance to a JSON map.
  /// Returns a map containing the `duration`, `curveType`, `startState`, and `endState` properties.
  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'duration': duration.inMilliseconds,
      'delay': delay.inMilliseconds,
      'curveType': curveType.name,
      'startState': startState.toJson(),
      'endState': endState.toJson(),
    };
  }

  /// Factory constructor to create an instance of `AnimatedScript` from a JSON map.
  /// Parses the JSON map to initialize the `duration`, `curveType`, `startState`, and `endState` properties.
  factory AnimatedScript.fromJson(Map<String, dynamic> json) {
    final type = AnimatedScriptType.fromString(json['type']);
    if (type == AnimatedScriptType.position) {
      return PositionProperty.fromJson(json);
    }

    final startState = json['startState'] != null
        ? AnimatedState.fromJson(json['startState'])
        : UnknownAnimatedState();
    final endState = json['endState'] != null
        ? AnimatedState.fromJson(json['endState'])
        : UnknownAnimatedState();

    try {
      return AnimatedScript(
        duration: Duration(milliseconds: json['duration']),
        delay: Duration(
          milliseconds: num.tryParse(json['delay'].toString())?.toInt() ?? 0,
        ),
        curveType: CurveType.fromString(json['curveType']),
        startState: startState,
        endState: endState,
      );
    } catch (e) {
      debugPrint(
        '---> Error type: $e ${json['startState'].runtimeType} ${json['endState'].runtimeType}',
      );

      return AnimatedScript(
        duration: Duration(milliseconds: json['duration']),
        delay: Duration(
          milliseconds: num.tryParse(json['delay'].toString())?.toInt() ?? 0,
        ),
        curveType: CurveType.fromString(json['curveType']),
        startState: UnknownAnimatedState(),
        endState: UnknownAnimatedState(),
      );
    }
  }
}

enum AnimatedScriptType {
  position,
  animation;

  static AnimatedScriptType fromString(String? value) {
    return AnimatedScriptType.values.firstWhereOrNull(
          (type) => type.name == value,
        ) ??
        AnimatedScriptType.position;
  }
}
