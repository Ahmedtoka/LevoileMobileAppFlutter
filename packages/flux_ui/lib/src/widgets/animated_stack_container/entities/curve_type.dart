import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// The `CurveType` enum is a part of the `animated_stack_container` package
/// and is designed to represent different types of curve animations.
enum CurveType {
  linear,
  decelerate,
  fastLinearToSlowEaseIn,
  fastEaseInToSlowEaseOut,
  ease,
  easeIn,
  easeInToLinear,
  easeInSine,
  easeInQuad,
  easeInCubic,
  easeInQuart,
  easeInQuint,
  easeInExpo,
  easeInCirc,
  easeInBack,
  easeOut,
  linearToEaseOut,
  easeOutSine,
  easeOutQuad,
  easeOutCubic,
  easeOutQuart,
  easeOutQuint,
  easeOutExpo,
  easeOutCirc,
  easeOutBack,
  easeInOut,
  easeInOutSine,
  easeInOutQuad,
  easeInOutCubic,
  easeInOutCubicEmphasized,
  easeInOutQuart,
  easeInOutQuint,
  easeInOutExpo,
  easeInOutCirc,
  easeInOutBack,
  fastOutSlowIn,
  slowMiddle,
  bounceIn,
  bounceOut,
  bounceInOut,
  elasticIn,
  elasticOut,
  elasticInOut;

  /// Converts a string to a `CurveType`.
  /// If the string does not match any known `CurveType`, it defaults to `CurveType.linear`.
  factory CurveType.fromString(String? value) {
    return CurveType.values.firstWhereOrNull((e) => e.name == value) ??
        CurveType.linear;
  }

  /// Returns the corresponding `Curve` object for the `CurveType`.
  Curve get curve {
    switch (this) {
      case CurveType.linear:
        return Curves.linear;
      case CurveType.decelerate:
        return Curves.decelerate;
      case CurveType.fastLinearToSlowEaseIn:
        return Curves.fastLinearToSlowEaseIn;
      case CurveType.fastEaseInToSlowEaseOut:
        return Curves.fastEaseInToSlowEaseOut;
      case CurveType.ease:
        return Curves.ease;
      case CurveType.easeIn:
        return Curves.easeIn;
      case CurveType.easeInToLinear:
        return Curves.easeInToLinear;
      case CurveType.easeInSine:
        return Curves.easeInSine;
      case CurveType.easeInQuad:
        return Curves.easeInQuad;
      case CurveType.easeInCubic:
        return Curves.easeInCubic;
      case CurveType.easeInQuart:
        return Curves.easeInQuart;
      case CurveType.easeInQuint:
        return Curves.easeInQuint;
      case CurveType.easeInExpo:
        return Curves.easeInExpo;
      case CurveType.easeInCirc:
        return Curves.easeInCirc;
      case CurveType.easeInBack:
        return Curves.easeInBack;
      case CurveType.easeOut:
        return Curves.easeOut;
      case CurveType.linearToEaseOut:
        return Curves.linearToEaseOut;
      case CurveType.easeOutSine:
        return Curves.easeOutSine;
      case CurveType.easeOutQuad:
        return Curves.easeOutQuad;
      case CurveType.easeOutCubic:
        return Curves.easeOutCubic;
      case CurveType.easeOutQuart:
        return Curves.easeOutQuart;
      case CurveType.easeOutQuint:
        return Curves.easeOutQuint;
      case CurveType.easeOutExpo:
        return Curves.easeOutExpo;
      case CurveType.easeOutCirc:
        return Curves.easeOutCirc;
      case CurveType.easeOutBack:
        return Curves.easeOutBack;
      case CurveType.easeInOut:
        return Curves.easeInOut;
      case CurveType.easeInOutSine:
        return Curves.easeInOutSine;
      case CurveType.easeInOutQuad:
        return Curves.easeInOutQuad;
      case CurveType.easeInOutCubic:
        return Curves.easeInOutCubic;
      case CurveType.easeInOutCubicEmphasized:
        return Curves.easeInOutCubicEmphasized;
      case CurveType.easeInOutQuart:
        return Curves.easeInOutQuart;
      case CurveType.easeInOutQuint:
        return Curves.easeInOutQuint;
      case CurveType.easeInOutExpo:
        return Curves.easeInOutExpo;
      case CurveType.easeInOutCirc:
        return Curves.easeInOutCirc;
      case CurveType.easeInOutBack:
        return Curves.easeInOutBack;
      case CurveType.fastOutSlowIn:
        return Curves.fastOutSlowIn;
      case CurveType.slowMiddle:
        return Curves.slowMiddle;
      case CurveType.bounceIn:
        return Curves.bounceIn;
      case CurveType.bounceOut:
        return Curves.bounceOut;
      case CurveType.bounceInOut:
        return Curves.bounceInOut;
      case CurveType.elasticIn:
        return Curves.elasticIn;
      case CurveType.elasticOut:
        return Curves.elasticOut;
      case CurveType.elasticInOut:
        return Curves.elasticInOut;
    }
  }
}
