// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageConfig {

 double get aspectRatio;@ColorConverter() Color? get color;@BoxFitConverter() BoxFit? get fit;@BorderRadiusDirectionalConverter() BorderRadiusDirectional get borderRadius;
/// Create a copy of ImageConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageConfigCopyWith<ImageConfig> get copyWith => _$ImageConfigCopyWithImpl<ImageConfig>(this as ImageConfig, _$identity);

  /// Serializes this ImageConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageConfig&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.color, color) || other.color == color)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aspectRatio,color,fit,borderRadius);

@override
String toString() {
  return 'ImageConfig(aspectRatio: $aspectRatio, color: $color, fit: $fit, borderRadius: $borderRadius)';
}


}

/// @nodoc
abstract mixin class $ImageConfigCopyWith<$Res>  {
  factory $ImageConfigCopyWith(ImageConfig value, $Res Function(ImageConfig) _then) = _$ImageConfigCopyWithImpl;
@useResult
$Res call({
 double aspectRatio,@ColorConverter() Color? color,@BoxFitConverter() BoxFit? fit,@BorderRadiusDirectionalConverter() BorderRadiusDirectional borderRadius
});




}
/// @nodoc
class _$ImageConfigCopyWithImpl<$Res>
    implements $ImageConfigCopyWith<$Res> {
  _$ImageConfigCopyWithImpl(this._self, this._then);

  final ImageConfig _self;
  final $Res Function(ImageConfig) _then;

/// Create a copy of ImageConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aspectRatio = null,Object? color = freezed,Object? fit = freezed,Object? borderRadius = null,}) {
  return _then(_self.copyWith(
aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit?,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as BorderRadiusDirectional,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageConfig].
extension ImageConfigPatterns on ImageConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageConfig value)  $default,){
final _that = this;
switch (_that) {
case _ImageConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ImageConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double aspectRatio, @ColorConverter()  Color? color, @BoxFitConverter()  BoxFit? fit, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional borderRadius)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageConfig() when $default != null:
return $default(_that.aspectRatio,_that.color,_that.fit,_that.borderRadius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double aspectRatio, @ColorConverter()  Color? color, @BoxFitConverter()  BoxFit? fit, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional borderRadius)  $default,) {final _that = this;
switch (_that) {
case _ImageConfig():
return $default(_that.aspectRatio,_that.color,_that.fit,_that.borderRadius);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double aspectRatio, @ColorConverter()  Color? color, @BoxFitConverter()  BoxFit? fit, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional borderRadius)?  $default,) {final _that = this;
switch (_that) {
case _ImageConfig() when $default != null:
return $default(_that.aspectRatio,_that.color,_that.fit,_that.borderRadius);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageConfig implements ImageConfig {
  const _ImageConfig({this.aspectRatio = _defaultImageAspectRatio, @ColorConverter() this.color, @BoxFitConverter() this.fit, @BorderRadiusDirectionalConverter() this.borderRadius = _defaultImageBorderRadius});
  factory _ImageConfig.fromJson(Map<String, dynamic> json) => _$ImageConfigFromJson(json);

@override@JsonKey() final  double aspectRatio;
@override@ColorConverter() final  Color? color;
@override@BoxFitConverter() final  BoxFit? fit;
@override@JsonKey()@BorderRadiusDirectionalConverter() final  BorderRadiusDirectional borderRadius;

/// Create a copy of ImageConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageConfigCopyWith<_ImageConfig> get copyWith => __$ImageConfigCopyWithImpl<_ImageConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageConfig&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.color, color) || other.color == color)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aspectRatio,color,fit,borderRadius);

@override
String toString() {
  return 'ImageConfig(aspectRatio: $aspectRatio, color: $color, fit: $fit, borderRadius: $borderRadius)';
}


}

/// @nodoc
abstract mixin class _$ImageConfigCopyWith<$Res> implements $ImageConfigCopyWith<$Res> {
  factory _$ImageConfigCopyWith(_ImageConfig value, $Res Function(_ImageConfig) _then) = __$ImageConfigCopyWithImpl;
@override @useResult
$Res call({
 double aspectRatio,@ColorConverter() Color? color,@BoxFitConverter() BoxFit? fit,@BorderRadiusDirectionalConverter() BorderRadiusDirectional borderRadius
});




}
/// @nodoc
class __$ImageConfigCopyWithImpl<$Res>
    implements _$ImageConfigCopyWith<$Res> {
  __$ImageConfigCopyWithImpl(this._self, this._then);

  final _ImageConfig _self;
  final $Res Function(_ImageConfig) _then;

/// Create a copy of ImageConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aspectRatio = null,Object? color = freezed,Object? fit = freezed,Object? borderRadius = null,}) {
  return _then(_ImageConfig(
aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit?,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as BorderRadiusDirectional,
  ));
}


}

// dart format on
