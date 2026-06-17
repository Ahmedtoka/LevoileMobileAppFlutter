// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductListConfig {

 double get itemSpacing; ItemSizeAdvanceConfig get itemSizeConfig;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding; ImageConfig get imageConfig;
/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductListConfigCopyWith<ProductListConfig> get copyWith => _$ProductListConfigCopyWithImpl<ProductListConfig>(this as ProductListConfig, _$identity);

  /// Serializes this ProductListConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListConfig&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.itemSizeConfig, itemSizeConfig) || other.itemSizeConfig == itemSizeConfig)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.imageConfig, imageConfig) || other.imageConfig == imageConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemSpacing,itemSizeConfig,padding,imageConfig);

@override
String toString() {
  return 'ProductListConfig(itemSpacing: $itemSpacing, itemSizeConfig: $itemSizeConfig, padding: $padding, imageConfig: $imageConfig)';
}


}

/// @nodoc
abstract mixin class $ProductListConfigCopyWith<$Res>  {
  factory $ProductListConfigCopyWith(ProductListConfig value, $Res Function(ProductListConfig) _then) = _$ProductListConfigCopyWithImpl;
@useResult
$Res call({
 double itemSpacing, ItemSizeAdvanceConfig itemSizeConfig,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, ImageConfig imageConfig
});


$ItemSizeAdvanceConfigCopyWith<$Res> get itemSizeConfig;$ImageConfigCopyWith<$Res> get imageConfig;

}
/// @nodoc
class _$ProductListConfigCopyWithImpl<$Res>
    implements $ProductListConfigCopyWith<$Res> {
  _$ProductListConfigCopyWithImpl(this._self, this._then);

  final ProductListConfig _self;
  final $Res Function(ProductListConfig) _then;

/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemSpacing = null,Object? itemSizeConfig = null,Object? padding = freezed,Object? imageConfig = null,}) {
  return _then(_self.copyWith(
itemSpacing: null == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double,itemSizeConfig: null == itemSizeConfig ? _self.itemSizeConfig : itemSizeConfig // ignore: cast_nullable_to_non_nullable
as ItemSizeAdvanceConfig,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,imageConfig: null == imageConfig ? _self.imageConfig : imageConfig // ignore: cast_nullable_to_non_nullable
as ImageConfig,
  ));
}
/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemSizeAdvanceConfigCopyWith<$Res> get itemSizeConfig {
  
  return $ItemSizeAdvanceConfigCopyWith<$Res>(_self.itemSizeConfig, (value) {
    return _then(_self.copyWith(itemSizeConfig: value));
  });
}/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageConfigCopyWith<$Res> get imageConfig {
  
  return $ImageConfigCopyWith<$Res>(_self.imageConfig, (value) {
    return _then(_self.copyWith(imageConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductListConfig].
extension ProductListConfigPatterns on ProductListConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductListConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductListConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductListConfig value)  $default,){
final _that = this;
switch (_that) {
case _ProductListConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductListConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ProductListConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double itemSpacing,  ItemSizeAdvanceConfig itemSizeConfig, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  ImageConfig imageConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductListConfig() when $default != null:
return $default(_that.itemSpacing,_that.itemSizeConfig,_that.padding,_that.imageConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double itemSpacing,  ItemSizeAdvanceConfig itemSizeConfig, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  ImageConfig imageConfig)  $default,) {final _that = this;
switch (_that) {
case _ProductListConfig():
return $default(_that.itemSpacing,_that.itemSizeConfig,_that.padding,_that.imageConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double itemSpacing,  ItemSizeAdvanceConfig itemSizeConfig, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  ImageConfig imageConfig)?  $default,) {final _that = this;
switch (_that) {
case _ProductListConfig() when $default != null:
return $default(_that.itemSpacing,_that.itemSizeConfig,_that.padding,_that.imageConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductListConfig implements ProductListConfig {
  const _ProductListConfig({this.itemSpacing = _defaultItemSpacing, this.itemSizeConfig = _defaultItemSizeConfig, @EdgeInsetsDirectionalConverter() this.padding = _defaultPadding, this.imageConfig = const ImageConfig()});
  factory _ProductListConfig.fromJson(Map<String, dynamic> json) => _$ProductListConfigFromJson(json);

@override@JsonKey() final  double itemSpacing;
@override@JsonKey() final  ItemSizeAdvanceConfig itemSizeConfig;
@override@JsonKey()@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;
@override@JsonKey() final  ImageConfig imageConfig;

/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductListConfigCopyWith<_ProductListConfig> get copyWith => __$ProductListConfigCopyWithImpl<_ProductListConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductListConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductListConfig&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.itemSizeConfig, itemSizeConfig) || other.itemSizeConfig == itemSizeConfig)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.imageConfig, imageConfig) || other.imageConfig == imageConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemSpacing,itemSizeConfig,padding,imageConfig);

@override
String toString() {
  return 'ProductListConfig(itemSpacing: $itemSpacing, itemSizeConfig: $itemSizeConfig, padding: $padding, imageConfig: $imageConfig)';
}


}

/// @nodoc
abstract mixin class _$ProductListConfigCopyWith<$Res> implements $ProductListConfigCopyWith<$Res> {
  factory _$ProductListConfigCopyWith(_ProductListConfig value, $Res Function(_ProductListConfig) _then) = __$ProductListConfigCopyWithImpl;
@override @useResult
$Res call({
 double itemSpacing, ItemSizeAdvanceConfig itemSizeConfig,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, ImageConfig imageConfig
});


@override $ItemSizeAdvanceConfigCopyWith<$Res> get itemSizeConfig;@override $ImageConfigCopyWith<$Res> get imageConfig;

}
/// @nodoc
class __$ProductListConfigCopyWithImpl<$Res>
    implements _$ProductListConfigCopyWith<$Res> {
  __$ProductListConfigCopyWithImpl(this._self, this._then);

  final _ProductListConfig _self;
  final $Res Function(_ProductListConfig) _then;

/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemSpacing = null,Object? itemSizeConfig = null,Object? padding = freezed,Object? imageConfig = null,}) {
  return _then(_ProductListConfig(
itemSpacing: null == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double,itemSizeConfig: null == itemSizeConfig ? _self.itemSizeConfig : itemSizeConfig // ignore: cast_nullable_to_non_nullable
as ItemSizeAdvanceConfig,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,imageConfig: null == imageConfig ? _self.imageConfig : imageConfig // ignore: cast_nullable_to_non_nullable
as ImageConfig,
  ));
}

/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemSizeAdvanceConfigCopyWith<$Res> get itemSizeConfig {
  
  return $ItemSizeAdvanceConfigCopyWith<$Res>(_self.itemSizeConfig, (value) {
    return _then(_self.copyWith(itemSizeConfig: value));
  });
}/// Create a copy of ProductListConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageConfigCopyWith<$Res> get imageConfig {
  
  return $ImageConfigCopyWith<$Res>(_self.imageConfig, (value) {
    return _then(_self.copyWith(imageConfig: value));
  });
}
}

// dart format on
