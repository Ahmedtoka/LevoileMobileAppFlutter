// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horizontal_testimonial_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HorizontalTestimonialConfig {

/// Base styling applied to all testimonial items
 TestimonialStyle get style;/// List view layout configuration
 FluxListViewConfig get listConfig;/// Individual testimonial configurations
/// [Warning] - This list is not merged with the base style
 List<ProductReviewTileConfig> get items;/// Visual design style
 HorizontalTestimonialDesign get design;
/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HorizontalTestimonialConfigCopyWith<HorizontalTestimonialConfig> get copyWith => _$HorizontalTestimonialConfigCopyWithImpl<HorizontalTestimonialConfig>(this as HorizontalTestimonialConfig, _$identity);

  /// Serializes this HorizontalTestimonialConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HorizontalTestimonialConfig&&(identical(other.style, style) || other.style == style)&&(identical(other.listConfig, listConfig) || other.listConfig == listConfig)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.design, design) || other.design == design));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,style,listConfig,const DeepCollectionEquality().hash(items),design);

@override
String toString() {
  return 'HorizontalTestimonialConfig(style: $style, listConfig: $listConfig, items: $items, design: $design)';
}


}

/// @nodoc
abstract mixin class $HorizontalTestimonialConfigCopyWith<$Res>  {
  factory $HorizontalTestimonialConfigCopyWith(HorizontalTestimonialConfig value, $Res Function(HorizontalTestimonialConfig) _then) = _$HorizontalTestimonialConfigCopyWithImpl;
@useResult
$Res call({
 TestimonialStyle style, FluxListViewConfig listConfig, List<ProductReviewTileConfig> items, HorizontalTestimonialDesign design
});


$TestimonialStyleCopyWith<$Res> get style;$FluxListViewConfigCopyWith<$Res> get listConfig;

}
/// @nodoc
class _$HorizontalTestimonialConfigCopyWithImpl<$Res>
    implements $HorizontalTestimonialConfigCopyWith<$Res> {
  _$HorizontalTestimonialConfigCopyWithImpl(this._self, this._then);

  final HorizontalTestimonialConfig _self;
  final $Res Function(HorizontalTestimonialConfig) _then;

/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? style = null,Object? listConfig = null,Object? items = null,Object? design = null,}) {
  return _then(_self.copyWith(
style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TestimonialStyle,listConfig: null == listConfig ? _self.listConfig : listConfig // ignore: cast_nullable_to_non_nullable
as FluxListViewConfig,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductReviewTileConfig>,design: null == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as HorizontalTestimonialDesign,
  ));
}
/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestimonialStyleCopyWith<$Res> get style {
  
  return $TestimonialStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxListViewConfigCopyWith<$Res> get listConfig {
  
  return $FluxListViewConfigCopyWith<$Res>(_self.listConfig, (value) {
    return _then(_self.copyWith(listConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [HorizontalTestimonialConfig].
extension HorizontalTestimonialConfigPatterns on HorizontalTestimonialConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HorizontalTestimonialConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HorizontalTestimonialConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HorizontalTestimonialConfig value)  $default,){
final _that = this;
switch (_that) {
case _HorizontalTestimonialConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HorizontalTestimonialConfig value)?  $default,){
final _that = this;
switch (_that) {
case _HorizontalTestimonialConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TestimonialStyle style,  FluxListViewConfig listConfig,  List<ProductReviewTileConfig> items,  HorizontalTestimonialDesign design)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HorizontalTestimonialConfig() when $default != null:
return $default(_that.style,_that.listConfig,_that.items,_that.design);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TestimonialStyle style,  FluxListViewConfig listConfig,  List<ProductReviewTileConfig> items,  HorizontalTestimonialDesign design)  $default,) {final _that = this;
switch (_that) {
case _HorizontalTestimonialConfig():
return $default(_that.style,_that.listConfig,_that.items,_that.design);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TestimonialStyle style,  FluxListViewConfig listConfig,  List<ProductReviewTileConfig> items,  HorizontalTestimonialDesign design)?  $default,) {final _that = this;
switch (_that) {
case _HorizontalTestimonialConfig() when $default != null:
return $default(_that.style,_that.listConfig,_that.items,_that.design);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HorizontalTestimonialConfig extends HorizontalTestimonialConfig {
  const _HorizontalTestimonialConfig({this.style = const TestimonialStyle(), this.listConfig = const FluxListViewConfig(), final  List<ProductReviewTileConfig> items = const [], this.design = HorizontalTestimonialDesign.tile}): _items = items,super._();
  factory _HorizontalTestimonialConfig.fromJson(Map<String, dynamic> json) => _$HorizontalTestimonialConfigFromJson(json);

/// Base styling applied to all testimonial items
@override@JsonKey() final  TestimonialStyle style;
/// List view layout configuration
@override@JsonKey() final  FluxListViewConfig listConfig;
/// Individual testimonial configurations
/// [Warning] - This list is not merged with the base style
 final  List<ProductReviewTileConfig> _items;
/// Individual testimonial configurations
/// [Warning] - This list is not merged with the base style
@override@JsonKey() List<ProductReviewTileConfig> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Visual design style
@override@JsonKey() final  HorizontalTestimonialDesign design;

/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HorizontalTestimonialConfigCopyWith<_HorizontalTestimonialConfig> get copyWith => __$HorizontalTestimonialConfigCopyWithImpl<_HorizontalTestimonialConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HorizontalTestimonialConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HorizontalTestimonialConfig&&(identical(other.style, style) || other.style == style)&&(identical(other.listConfig, listConfig) || other.listConfig == listConfig)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.design, design) || other.design == design));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,style,listConfig,const DeepCollectionEquality().hash(_items),design);

@override
String toString() {
  return 'HorizontalTestimonialConfig(style: $style, listConfig: $listConfig, items: $items, design: $design)';
}


}

/// @nodoc
abstract mixin class _$HorizontalTestimonialConfigCopyWith<$Res> implements $HorizontalTestimonialConfigCopyWith<$Res> {
  factory _$HorizontalTestimonialConfigCopyWith(_HorizontalTestimonialConfig value, $Res Function(_HorizontalTestimonialConfig) _then) = __$HorizontalTestimonialConfigCopyWithImpl;
@override @useResult
$Res call({
 TestimonialStyle style, FluxListViewConfig listConfig, List<ProductReviewTileConfig> items, HorizontalTestimonialDesign design
});


@override $TestimonialStyleCopyWith<$Res> get style;@override $FluxListViewConfigCopyWith<$Res> get listConfig;

}
/// @nodoc
class __$HorizontalTestimonialConfigCopyWithImpl<$Res>
    implements _$HorizontalTestimonialConfigCopyWith<$Res> {
  __$HorizontalTestimonialConfigCopyWithImpl(this._self, this._then);

  final _HorizontalTestimonialConfig _self;
  final $Res Function(_HorizontalTestimonialConfig) _then;

/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? style = null,Object? listConfig = null,Object? items = null,Object? design = null,}) {
  return _then(_HorizontalTestimonialConfig(
style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TestimonialStyle,listConfig: null == listConfig ? _self.listConfig : listConfig // ignore: cast_nullable_to_non_nullable
as FluxListViewConfig,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductReviewTileConfig>,design: null == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as HorizontalTestimonialDesign,
  ));
}

/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestimonialStyleCopyWith<$Res> get style {
  
  return $TestimonialStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of HorizontalTestimonialConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxListViewConfigCopyWith<$Res> get listConfig {
  
  return $FluxListViewConfigCopyWith<$Res>(_self.listConfig, (value) {
    return _then(_self.copyWith(listConfig: value));
  });
}
}

// dart format on
