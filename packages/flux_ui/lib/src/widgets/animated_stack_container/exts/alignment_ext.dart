import 'package:flutter/material.dart';

extension AlignmentGeometryExt on AlignmentGeometry {
  /// Factory constructor to create an instance of `AnimatedAlignmentState` from a JSON map.
  /// Parses the JSON map to initialize the `alignment` property.
  static AlignmentGeometry fromString(String? alignmentText) {
    if (alignmentText == null) return Alignment.center;

    /// Default alignment is center.
    AlignmentGeometry alignment = Alignment.center;

    /// Parse the alignment text to the corresponding alignment value.
    switch (alignmentText) {
      case 'topLeft':
        alignment = Alignment.topLeft;
        break;
      case 'topCenter':
        alignment = Alignment.topCenter;
        break;
      case 'topRight':
        alignment = Alignment.topRight;
        break;
      case 'centerLeft':
        alignment = Alignment.centerLeft;
        break;
      case 'center':
        alignment = Alignment.center;
        break;
      case 'centerRight':
        alignment = Alignment.centerRight;
        break;
      case 'bottomLeft':
        alignment = Alignment.bottomLeft;
        break;
      case 'bottomCenter':
        alignment = Alignment.bottomCenter;
        break;
      case 'bottomRight':
        alignment = Alignment.bottomRight;
        break;
      case 'centerStart':
        alignment = AlignmentDirectional.centerStart;
        break;
      case 'centerEnd':
        alignment = AlignmentDirectional.centerEnd;
        break;
      case 'topStart':
        alignment = AlignmentDirectional.topStart;
        break;
      case 'topEnd':
        alignment = AlignmentDirectional.topEnd;
        break;
      case 'bottomStart':
        alignment = AlignmentDirectional.bottomStart;
        break;
      case 'bottomEnd':
        alignment = AlignmentDirectional.bottomEnd;
        break;
      default:
        alignment = Alignment.center;
        break;
    }

    return alignment;
  }

  /// Method to get the text representation of the `alignment` property.
  /// Converts the `alignment` property to its corresponding string value.
  String get alignmentText {
    switch (this) {
      case Alignment.topLeft:
        return 'topLeft';
      case Alignment.topCenter:
        return 'topCenter';
      case Alignment.topRight:
        return 'topRight';
      case Alignment.centerLeft:
        return 'centerLeft';
      case Alignment.centerRight:
        return 'centerRight';
      case Alignment.bottomLeft:
        return 'bottomLeft';
      case Alignment.bottomCenter:
        return 'bottomCenter';
      case Alignment.bottomRight:
        return 'bottomRight';
      case AlignmentDirectional.centerStart:
        return 'centerStart';
      case AlignmentDirectional.centerEnd:
        return 'centerEnd';
      case AlignmentDirectional.topStart:
        return 'topStart';
      case AlignmentDirectional.topEnd:
        return 'topEnd';
      case AlignmentDirectional.bottomStart:
        return 'bottomStart';
      case AlignmentDirectional.bottomEnd:
        return 'bottomEnd';
      case Alignment.center:
      default:
        return 'center';
    }
  }
}
