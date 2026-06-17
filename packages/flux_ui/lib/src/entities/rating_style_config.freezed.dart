// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_style_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxRatingStyleConfig {

 double get size; AppColor get color;
/// Create a copy of FluxRatingStyleConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxRatingStyleConfigCopyWith<FluxRatingStyleConfig> get copyWith => _$FluxRatingStyleConfigCopyWithImpl<FluxRatingStyleConfig>(this as FluxRatingStyleConfig, _$identity);

  /// Serializes this FluxRatingStyleConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxRatingStyleConfig&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,color);

@override
String toString() {
  return 'FluxRatingStyleConfig(size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class $FluxRatingStyleConfigCopyWith<$Res>  {
  factory $FluxRatingStyleConfigCopyWith(FluxRatingStyleConfig value, $Res Function(FluxRatingStyleConfig) _then) = _$FluxRatingStyleConfigCopyWithImpl;
@useResult
$Res call({
 double size, AppColor color
});


$AppColorCopyWith<$Res> get color;

}
/// @nodoc
class _$FluxRatingStyleConfigCopyWithImpl<$Res>
    implements $FluxRatingStyleConfigCopyWith<$Res> {
  _$FluxRatingStyleConfigCopyWithImpl(this._self, this._then);

  final FluxRatingStyleConfig _self;
  final $Res Function(FluxRatingStyleConfig) _then;

/// Create a copy of FluxRatingStyleConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? color = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as AppColor,
  ));
}
/// Create a copy of FluxRatingStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res> get color {
  
  return $AppColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [FluxRatingStyleConfig].
extension FluxRatingStyleConfigPatterns on FluxRatingStyleConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxRatingStyleConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxRatingStyleConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxRatingStyleConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxRatingStyleConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxRatingStyleConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxRatingStyleConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double size,  AppColor color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxRatingStyleConfig() when $default != null:
return $default(_that.size,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double size,  AppColor color)  $default,) {final _that = this;
switch (_that) {
case _FluxRatingStyleConfig():
return $default(_that.size,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double size,  AppColor color)?  $default,) {final _that = this;
switch (_that) {
case _FluxRatingStyleConfig() when $default != null:
return $default(_that.size,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxRatingStyleConfig implements FluxRatingStyleConfig {
  const _FluxRatingStyleConfig({this.size = 16, this.color = AppColor.primary});
  factory _FluxRatingStyleConfig.fromJson(Map<String, dynamic> json) => _$FluxRatingStyleConfigFromJson(json);

@override@JsonKey() final  double size;
@override@JsonKey() final  AppColor color;

/// Create a copy of FluxRatingStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxRatingStyleConfigCopyWith<_FluxRatingStyleConfig> get copyWith => __$FluxRatingStyleConfigCopyWithImpl<_FluxRatingStyleConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxRatingStyleConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxRatingStyleConfig&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,color);

@override
String toString() {
  return 'FluxRatingStyleConfig(size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class _$FluxRatingStyleConfigCopyWith<$Res> implements $FluxRatingStyleConfigCopyWith<$Res> {
  factory _$FluxRatingStyleConfigCopyWith(_FluxRatingStyleConfig value, $Res Function(_FluxRatingStyleConfig) _then) = __$FluxRatingStyleConfigCopyWithImpl;
@override @useResult
$Res call({
 double size, AppColor color
});


@override $AppColorCopyWith<$Res> get color;

}
/// @nodoc
class __$FluxRatingStyleConfigCopyWithImpl<$Res>
    implements _$FluxRatingStyleConfigCopyWith<$Res> {
  __$FluxRatingStyleConfigCopyWithImpl(this._self, this._then);

  final _FluxRatingStyleConfig _self;
  final $Res Function(_FluxRatingStyleConfig) _then;

/// Create a copy of FluxRatingStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? color = null,}) {
  return _then(_FluxRatingStyleConfig(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as AppColor,
  ));
}

/// Create a copy of FluxRatingStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res> get color {
  
  return $AppColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}

// dart format on
