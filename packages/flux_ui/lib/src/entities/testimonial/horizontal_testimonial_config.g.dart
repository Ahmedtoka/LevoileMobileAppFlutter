// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horizontal_testimonial_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HorizontalTestimonialConfig _$HorizontalTestimonialConfigFromJson(
  Map<String, dynamic> json,
) => _HorizontalTestimonialConfig(
  style: json['style'] == null
      ? const TestimonialStyle()
      : TestimonialStyle.fromJson(json['style'] as Map<String, dynamic>),
  listConfig: json['listConfig'] == null
      ? const FluxListViewConfig()
      : FluxListViewConfig.fromJson(json['listConfig'] as Map<String, dynamic>),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => ProductReviewTileConfig.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  design:
      $enumDecodeNullable(
        _$HorizontalTestimonialDesignEnumMap,
        json['design'],
      ) ??
      HorizontalTestimonialDesign.tile,
);

Map<String, dynamic> _$HorizontalTestimonialConfigToJson(
  _HorizontalTestimonialConfig instance,
) => <String, dynamic>{
  'style': instance.style.toJson(),
  'listConfig': instance.listConfig.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'design': _$HorizontalTestimonialDesignEnumMap[instance.design]!,
};

const _$HorizontalTestimonialDesignEnumMap = {
  HorizontalTestimonialDesign.card: 'card',
  HorizontalTestimonialDesign.chat: 'chat',
  HorizontalTestimonialDesign.tile: 'tile',
};
