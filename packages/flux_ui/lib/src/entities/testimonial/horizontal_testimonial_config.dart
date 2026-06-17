import 'package:freezed_annotation/freezed_annotation.dart';

import '../flux_config/flux_list_view_config.dart';
import 'product_review_tile_config.dart';

part 'horizontal_testimonial_config.freezed.dart';
part 'horizontal_testimonial_config.g.dart';

/// Defines the visual design style for horizontal testimonials
enum HorizontalTestimonialDesign {
  /// Card-based layout with shadows and elevation
  card,

  /// Chat bubble style layout
  chat,

  /// Simple tile-based layout
  tile,
}

/// Configuration for horizontal testimonial layouts
@freezed
abstract class HorizontalTestimonialConfig with _$HorizontalTestimonialConfig {
  const HorizontalTestimonialConfig._();

  /// Creates a new horizontal testimonial configuration
  ///
  /// [style] - Base styling applied to all testimonials unless overridden
  /// [listConfig] - Configuration for the list view layout
  /// [items] - Collection of individual testimonial configurations
  /// [design] - Visual design style for the testimonials
  const factory HorizontalTestimonialConfig({
    /// Base styling applied to all testimonial items
    @Default(TestimonialStyle()) TestimonialStyle style,

    /// List view layout configuration
    @Default(FluxListViewConfig()) FluxListViewConfig listConfig,

    /// Individual testimonial configurations
    /// [Warning] - This list is not merged with the base style
    @Default([]) List<ProductReviewTileConfig> items,

    /// Visual design style
    @Default(HorizontalTestimonialDesign.tile)
    HorizontalTestimonialDesign design,
  }) = _HorizontalTestimonialConfig;

  /// Returns the list of testimonial items with resolved style inheritance
  ///
  /// Each item's style is merged with the base style if not explicitly set
  List<ProductReviewTileConfig> get resolvedItems =>
      items.map((item) => item.copyWith(style: item.style ?? style)).toList();

  /// Creates an instance from a JSON map
  factory HorizontalTestimonialConfig.fromJson(Map<String, dynamic> json) =>
      _$HorizontalTestimonialConfigFromJson(json);
}
