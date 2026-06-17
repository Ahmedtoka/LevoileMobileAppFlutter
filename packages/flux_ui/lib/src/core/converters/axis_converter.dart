import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class AxisConverter implements JsonConverter<Axis, String?> {
  const AxisConverter();

  @override
  Axis fromJson(String? json) {
    switch (json) {
      case 'horizontal':
        return Axis.horizontal;
      case 'vertical':
        return Axis.vertical;
      default:
        return Axis.horizontal;
    }
  }

  @override
  String toJson(Axis axis) {
    switch (axis) {
      case Axis.horizontal:
        return 'horizontal';
      case Axis.vertical:
        return 'vertical';
    }
  }
}
