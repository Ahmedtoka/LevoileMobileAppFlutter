import 'package:freezed_annotation/freezed_annotation.dart';

import 'app/app_color.dart';

part 'rating_style_config.freezed.dart';
part 'rating_style_config.g.dart';

@freezed
abstract class FluxRatingStyleConfig with _$FluxRatingStyleConfig {
  const factory FluxRatingStyleConfig({
    @Default(16) double size,
    @Default(AppColor.primary) AppColor color,
  }) = _FluxRatingStyleConfig;

  factory FluxRatingStyleConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxRatingStyleConfigFromJson(json);
}
