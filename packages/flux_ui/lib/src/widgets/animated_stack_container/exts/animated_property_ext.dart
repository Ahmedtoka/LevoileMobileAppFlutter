import 'package:flutter/material.dart';

import '../entities/animated_alignment_state.dart';
import '../entities/animated_property.dart';
import '../entities/animated_state.dart';

/// Extension on `AnimatedProperty` to provide methods for building animated widgets.
extension AnimatedPropertyExt on AnimatedScript {
  Widget build(
    BuildContext context, {
    required Widget child,
    required String key,
    bool isStart = true,
  }) {
    final isPosition = this is PositionProperty;
    if (isPosition) {
      final state = this as PositionProperty;
      final isFill = state.isFill;

      return PositionedDirectional(
        key: Key(key),
        start: isFill ? 0.0 : state.start,
        top: isFill ? 0.0 : state.top,
        end: isFill ? 0.0 : state.end,
        bottom: isFill ? 0.0 : state.bottom,
        child: child,
      );
    }

    /// Get the start or end state based on the `isStart` flag.
    final state = isStart ? startState : endState;

    /// Build the animated widget based on the state type.
    if (state is AnimatedSlideState) {
      child = AnimatedSlide(
        key: Key(key),
        offset: Offset(state.x, state.y),
        duration: duration,
        curve: curveType.curve,
        child: child,
      );
    } else if (state is AnimatedOpacityState) {
      child = AnimatedOpacity(
        key: Key(key),
        opacity: state.opacity,
        duration: duration,
        curve: curveType.curve,
        child: child,
      );
    } else if (state is AnimatedAlignmentState) {
      child = AnimatedAlign(
        key: Key(key),
        alignment: state.alignment,
        duration: duration,
        curve: curveType.curve,
        child: child,
      );
    } else if (state is AnimatedSizeState) {
      child = AnimatedSize(
        key: Key(key),
        duration: duration,
        curve: curveType.curve,
        child: SizedBox(
          key: Key('$key- ${state.width} ${state.height}'),
          width: state.width,
          height: state.height,
          child: child,
        ),
      );
    } else if (state is AnimatedPositionState) {
      child = AnimatedPositionedDirectional(
        key: Key(key),
        start: state.start,
        top: state.top,
        end: state.end,
        bottom: state.bottom,
        duration: duration,
        curve: curveType.curve,
        child: child,
      );
    } else if (state is AnimatedScaleState) {
      child = AnimatedScale(
        key: Key(key),
        scale: state.scale,
        duration: duration,
        curve: curveType.curve,
        child: child,
      );
    }
    return child;
  }
}
