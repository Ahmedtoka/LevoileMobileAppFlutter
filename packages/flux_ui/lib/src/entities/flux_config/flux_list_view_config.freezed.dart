// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_list_view_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxListViewConfig {

 ItemSizeAdvanceConfig get itemSize; double get itemSpacing;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding;
/// Create a copy of FluxListViewConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxListViewConfigCopyWith<FluxListViewConfig> get copyWith => _$FluxListViewConfigCopyWithImpl<FluxListViewConfig>(this as FluxListViewConfig, _$identity);

  /// Serializes this FluxListViewConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxListViewConfig&&(identical(other.itemSize, itemSize) || other.itemSize == itemSize)&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemSize,itemSpacing,padding);

@override
String toString() {
  return 'FluxListViewConfig(itemSize: $itemSize, itemSpacing: $itemSpacing, padding: $padding)';
}


}

/// @nodoc
abstract mixin class $FluxListViewConfigCopyWith<$Res>  {
  factory $FluxListViewConfigCopyWith(FluxListViewConfig value, $Res Function(FluxListViewConfig) _then) = _$FluxListViewConfigCopyWithImpl;
@useResult
$Res call({
 ItemSizeAdvanceConfig itemSize, double itemSpacing,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding
});


$ItemSizeAdvanceConfigCopyWith<$Res> get itemSize;

}
/// @nodoc
class _$FluxListViewConfigCopyWithImpl<$Res>
    implements $FluxListViewConfigCopyWith<$Res> {
  _$FluxListViewConfigCopyWithImpl(this._self, this._then);

  final FluxListViewConfig _self;
  final $Res Function(FluxListViewConfig) _then;

/// Create a copy of FluxListViewConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemSize = null,Object? itemSpacing = null,Object? padding = freezed,}) {
  return _then(_self.copyWith(
itemSize: null == itemSize ? _self.itemSize : itemSize // ignore: cast_nullable_to_non_nullable
as ItemSizeAdvanceConfig,itemSpacing: null == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}
/// Create a copy of FluxListViewConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemSizeAdvanceConfigCopyWith<$Res> get itemSize {
  
  return $ItemSizeAdvanceConfigCopyWith<$Res>(_self.itemSize, (value) {
    return _then(_self.copyWith(itemSize: value));
  });
}
}


/// Adds pattern-matching-related methods to [FluxListViewConfig].
extension FluxListViewConfigPatterns on FluxListViewConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxListViewConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxListViewConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxListViewConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxListViewConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxListViewConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxListViewConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ItemSizeAdvanceConfig itemSize,  double itemSpacing, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxListViewConfig() when $default != null:
return $default(_that.itemSize,_that.itemSpacing,_that.padding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ItemSizeAdvanceConfig itemSize,  double itemSpacing, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)  $default,) {final _that = this;
switch (_that) {
case _FluxListViewConfig():
return $default(_that.itemSize,_that.itemSpacing,_that.padding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ItemSizeAdvanceConfig itemSize,  double itemSpacing, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)?  $default,) {final _that = this;
switch (_that) {
case _FluxListViewConfig() when $default != null:
return $default(_that.itemSize,_that.itemSpacing,_that.padding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxListViewConfig implements FluxListViewConfig {
  const _FluxListViewConfig({this.itemSize = _defaultItemSize, this.itemSpacing = _defaultSpacing, @EdgeInsetsDirectionalConverter() this.padding});
  factory _FluxListViewConfig.fromJson(Map<String, dynamic> json) => _$FluxListViewConfigFromJson(json);

@override@JsonKey() final  ItemSizeAdvanceConfig itemSize;
@override@JsonKey() final  double itemSpacing;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;

/// Create a copy of FluxListViewConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxListViewConfigCopyWith<_FluxListViewConfig> get copyWith => __$FluxListViewConfigCopyWithImpl<_FluxListViewConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxListViewConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxListViewConfig&&(identical(other.itemSize, itemSize) || other.itemSize == itemSize)&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemSize,itemSpacing,padding);

@override
String toString() {
  return 'FluxListViewConfig(itemSize: $itemSize, itemSpacing: $itemSpacing, padding: $padding)';
}


}

/// @nodoc
abstract mixin class _$FluxListViewConfigCopyWith<$Res> implements $FluxListViewConfigCopyWith<$Res> {
  factory _$FluxListViewConfigCopyWith(_FluxListViewConfig value, $Res Function(_FluxListViewConfig) _then) = __$FluxListViewConfigCopyWithImpl;
@override @useResult
$Res call({
 ItemSizeAdvanceConfig itemSize, double itemSpacing,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding
});


@override $ItemSizeAdvanceConfigCopyWith<$Res> get itemSize;

}
/// @nodoc
class __$FluxListViewConfigCopyWithImpl<$Res>
    implements _$FluxListViewConfigCopyWith<$Res> {
  __$FluxListViewConfigCopyWithImpl(this._self, this._then);

  final _FluxListViewConfig _self;
  final $Res Function(_FluxListViewConfig) _then;

/// Create a copy of FluxListViewConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemSize = null,Object? itemSpacing = null,Object? padding = freezed,}) {
  return _then(_FluxListViewConfig(
itemSize: null == itemSize ? _self.itemSize : itemSize // ignore: cast_nullable_to_non_nullable
as ItemSizeAdvanceConfig,itemSpacing: null == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}

/// Create a copy of FluxListViewConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemSizeAdvanceConfigCopyWith<$Res> get itemSize {
  
  return $ItemSizeAdvanceConfigCopyWith<$Res>(_self.itemSize, (value) {
    return _then(_self.copyWith(itemSize: value));
  });
}
}

// dart format on
