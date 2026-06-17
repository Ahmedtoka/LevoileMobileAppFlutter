import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_grid_item_config.freezed.dart';
part 'card_grid_item_config.g.dart';

@freezed
abstract class CardGridItemConfig with _$CardGridItemConfig {
  const factory CardGridItemConfig({
    String? id,
    required String name,
    required String imageUrl,
  }) = _CardGridItemConfig;

  factory CardGridItemConfig.fromJson(Map<String, dynamic> json) =>
      _$CardGridItemConfigFromJson(json);
}
