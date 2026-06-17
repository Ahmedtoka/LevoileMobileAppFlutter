import 'package:flutter/material.dart';

import '../exts/alignment_ext.dart';
import 'animated_state.dart';

/// The `AnimatedAlignmentState` class is a part of the `animated_stack_container` package
/// and is designed to represent the state of an animated alignment.
class AnimatedAlignmentState extends AnimatedState {
  final AlignmentGeometry alignment;

  /// Constructor to create an instance of `AnimatedAlignmentState`.
  /// Initializes the `alignment` property with the provided value.
  AnimatedAlignmentState({required this.alignment})
    : super(type: AnimatedStateType.alignment);

  factory AnimatedAlignmentState.fromJson(Map<String, dynamic> json) {
    return AnimatedAlignmentState(
      alignment: AlignmentGeometryExt.fromString(json['alignment'].toString()),
    );
  }

  /// Method to convert the `AnimatedAlignmentState` instance to a JSON map.
  /// Returns a map containing the `alignment` property.
  @override
  Map<String, dynamic> toJson() {
    return {'alignment': alignment.alignmentText};
  }
}
