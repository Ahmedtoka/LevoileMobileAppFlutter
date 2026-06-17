import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_size_advance_config.freezed.dart';
part 'item_size_advance_config.g.dart';

enum ItemSizeAdvanceType {
  fixed, // Fixed size in pixels
  screenPercentage, // Percentage of screen width/height
  gridColumns, // Divide screen into n columns
  // contentBased, // Size based on content (min/max constraints)
  // dynamic, // Changes based on available items (e.g., 2 items = 50%, 3 items = 33%)
}

@freezed
abstract class ItemSizeAdvanceConfig with _$ItemSizeAdvanceConfig {
  const factory ItemSizeAdvanceConfig({
    required double value,
    @Default(ItemSizeAdvanceType.fixed) ItemSizeAdvanceType type,
  }) = _ItemSizeAdvanceConfig;

  // Named constructors for common cases

  factory ItemSizeAdvanceConfig.fixed(double value) =>
      ItemSizeAdvanceConfig(value: value, type: ItemSizeAdvanceType.fixed);

  /// [columns] is the number of columns to divide the screen into
  factory ItemSizeAdvanceConfig.gridColumns(double columns) =>
      ItemSizeAdvanceConfig(
        value: columns,
        type: ItemSizeAdvanceType.gridColumns,
      );

  /// [percent] is the percentage of the screen width to use for the item size
  factory ItemSizeAdvanceConfig.screenPercentage(double percent) =>
      ItemSizeAdvanceConfig(
        value: percent,
        type: ItemSizeAdvanceType.screenPercentage,
      );

  factory ItemSizeAdvanceConfig.fromJson(Map<String, dynamic> json) =>
      _$ItemSizeAdvanceConfigFromJson(json);
}
