import 'dart:math';

import 'package:flutter/material.dart';

extension BorderRadiusGeometryExt on BorderRadiusGeometry {
  BorderRadius mergeWithBoxBorder({
    BoxBorder? border,
    TextDirection? direction,
  }) {
    final borderRadiusResolved = resolve(direction);
    return BorderRadius.only(
      topLeft: Radius.circular(
        max(borderRadiusResolved.topLeft.x - (border?.top.width ?? 0), 0),
      ),
      topRight: Radius.circular(
        max(borderRadiusResolved.topRight.x - (border?.top.width ?? 0), 0),
      ),
      bottomLeft: Radius.circular(
        max(borderRadiusResolved.bottomLeft.x - (border?.bottom.width ?? 0), 0),
      ),
      bottomRight: Radius.circular(
        max(
          borderRadiusResolved.bottomRight.x - (border?.bottom.width ?? 0),
          0,
        ),
      ),
    );
  }
}
