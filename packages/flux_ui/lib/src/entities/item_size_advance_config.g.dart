// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_size_advance_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemSizeAdvanceConfig _$ItemSizeAdvanceConfigFromJson(
  Map<String, dynamic> json,
) => _ItemSizeAdvanceConfig(
  value: (json['value'] as num).toDouble(),
  type:
      $enumDecodeNullable(_$ItemSizeAdvanceTypeEnumMap, json['type']) ??
      ItemSizeAdvanceType.fixed,
);

Map<String, dynamic> _$ItemSizeAdvanceConfigToJson(
  _ItemSizeAdvanceConfig instance,
) => <String, dynamic>{
  'value': instance.value,
  'type': _$ItemSizeAdvanceTypeEnumMap[instance.type]!,
};

const _$ItemSizeAdvanceTypeEnumMap = {
  ItemSizeAdvanceType.fixed: 'fixed',
  ItemSizeAdvanceType.screenPercentage: 'screenPercentage',
  ItemSizeAdvanceType.gridColumns: 'gridColumns',
};
