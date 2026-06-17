import 'package:flutter/material.dart';

import '../../entities/item_size_advance_config.dart';

const double _defaultStartPadding = 0;
const double _defaultSpacing = 0;

extension ItemSizeConfigExt on ItemSizeAdvanceConfig {
  double calculateItemSize(
    BuildContext context, {
    double? startPadding,
    double? spacing,
  }) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final effectiveStartPadding = startPadding ?? _defaultStartPadding;
    final effectiveSpacing = spacing ?? _defaultSpacing;

    switch (type) {
      case ItemSizeAdvanceType.fixed:
        return value;

      case ItemSizeAdvanceType.screenPercentage:
        return screenWidth * value;

      case ItemSizeAdvanceType.gridColumns:
        final columns = value;
        return (screenWidth -
                (effectiveSpacing * (columns)) -
                effectiveStartPadding) /
            columns;
    }
  }
}
