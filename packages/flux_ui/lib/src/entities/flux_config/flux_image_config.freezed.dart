// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_image_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxImageConfig {

 String get url; FluxImageStyleConfig? get styleConfig;
/// Create a copy of FluxImageConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxImageConfigCopyWith<FluxImageConfig> get copyWith => _$FluxImageConfigCopyWithImpl<FluxImageConfig>(this as FluxImageConfig, _$identity);

  /// Serializes this FluxImageConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxImageConfig&&(identical(other.url, url) || other.url == url)&&(identical(other.styleConfig, styleConfig) || other.styleConfig == styleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,styleConfig);

@override
String toString() {
  return 'FluxImageConfig(url: $url, styleConfig: $styleConfig)';
}


}

/// @nodoc
abstract mixin class $FluxImageConfigCopyWith<$Res>  {
  factory $FluxImageConfigCopyWith(FluxImageConfig value, $Res Function(FluxImageConfig) _then) = _$FluxImageConfigCopyWithImpl;
@useResult
$Res call({
 String url, FluxImageStyleConfig? styleConfig
});


$FluxImageStyleConfigCopyWith<$Res>? get styleConfig;

}
/// @nodoc
class _$FluxImageConfigCopyWithImpl<$Res>
    implements $FluxImageConfigCopyWith<$Res> {
  _$FluxImageConfigCopyWithImpl(this._self, this._then);

  final FluxImageConfig _self;
  final $Res Function(FluxImageConfig) _then;

/// Create a copy of FluxImageConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? styleConfig = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,styleConfig: freezed == styleConfig ? _self.styleConfig : styleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,
  ));
}
/// Create a copy of FluxImageConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get styleConfig {
    if (_self.styleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.styleConfig!, (value) {
    return _then(_self.copyWith(styleConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [FluxImageConfig].
extension FluxImageConfigPatterns on FluxImageConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxImageConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxImageConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxImageConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxImageConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxImageConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxImageConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  FluxImageStyleConfig? styleConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxImageConfig() when $default != null:
return $default(_that.url,_that.styleConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  FluxImageStyleConfig? styleConfig)  $default,) {final _that = this;
switch (_that) {
case _FluxImageConfig():
return $default(_that.url,_that.styleConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  FluxImageStyleConfig? styleConfig)?  $default,) {final _that = this;
switch (_that) {
case _FluxImageConfig() when $default != null:
return $default(_that.url,_that.styleConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxImageConfig implements FluxImageConfig {
  const _FluxImageConfig({this.url = '', this.styleConfig});
  factory _FluxImageConfig.fromJson(Map<String, dynamic> json) => _$FluxImageConfigFromJson(json);

@override@JsonKey() final  String url;
@override final  FluxImageStyleConfig? styleConfig;

/// Create a copy of FluxImageConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxImageConfigCopyWith<_FluxImageConfig> get copyWith => __$FluxImageConfigCopyWithImpl<_FluxImageConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxImageConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxImageConfig&&(identical(other.url, url) || other.url == url)&&(identical(other.styleConfig, styleConfig) || other.styleConfig == styleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,styleConfig);

@override
String toString() {
  return 'FluxImageConfig(url: $url, styleConfig: $styleConfig)';
}


}

/// @nodoc
abstract mixin class _$FluxImageConfigCopyWith<$Res> implements $FluxImageConfigCopyWith<$Res> {
  factory _$FluxImageConfigCopyWith(_FluxImageConfig value, $Res Function(_FluxImageConfig) _then) = __$FluxImageConfigCopyWithImpl;
@override @useResult
$Res call({
 String url, FluxImageStyleConfig? styleConfig
});


@override $FluxImageStyleConfigCopyWith<$Res>? get styleConfig;

}
/// @nodoc
class __$FluxImageConfigCopyWithImpl<$Res>
    implements _$FluxImageConfigCopyWith<$Res> {
  __$FluxImageConfigCopyWithImpl(this._self, this._then);

  final _FluxImageConfig _self;
  final $Res Function(_FluxImageConfig) _then;

/// Create a copy of FluxImageConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? styleConfig = freezed,}) {
  return _then(_FluxImageConfig(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,styleConfig: freezed == styleConfig ? _self.styleConfig : styleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,
  ));
}

/// Create a copy of FluxImageConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get styleConfig {
    if (_self.styleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.styleConfig!, (value) {
    return _then(_self.copyWith(styleConfig: value));
  });
}
}


/// @nodoc
mixin _$FluxImageStyleConfig {

 double? get width; double? get height; double? get aspectRatio;@BorderRadiusDirectionalConverter() BorderRadiusDirectional? get borderRadius;@BoxFitConverter() BoxFit? get fit;@ColorConverter() Color? get color;@AlignmentDirectionalConverter() AlignmentDirectional? get alignment;
/// Create a copy of FluxImageStyleConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<FluxImageStyleConfig> get copyWith => _$FluxImageStyleConfigCopyWithImpl<FluxImageStyleConfig>(this as FluxImageStyleConfig, _$identity);

  /// Serializes this FluxImageStyleConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxImageStyleConfig&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.color, color) || other.color == color)&&(identical(other.alignment, alignment) || other.alignment == alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,aspectRatio,borderRadius,fit,color,alignment);

@override
String toString() {
  return 'FluxImageStyleConfig(width: $width, height: $height, aspectRatio: $aspectRatio, borderRadius: $borderRadius, fit: $fit, color: $color, alignment: $alignment)';
}


}

/// @nodoc
abstract mixin class $FluxImageStyleConfigCopyWith<$Res>  {
  factory $FluxImageStyleConfigCopyWith(FluxImageStyleConfig value, $Res Function(FluxImageStyleConfig) _then) = _$FluxImageStyleConfigCopyWithImpl;
@useResult
$Res call({
 double? width, double? height, double? aspectRatio,@BorderRadiusDirectionalConverter() BorderRadiusDirectional? borderRadius,@BoxFitConverter() BoxFit? fit,@ColorConverter() Color? color,@AlignmentDirectionalConverter() AlignmentDirectional? alignment
});




}
/// @nodoc
class _$FluxImageStyleConfigCopyWithImpl<$Res>
    implements $FluxImageStyleConfigCopyWith<$Res> {
  _$FluxImageStyleConfigCopyWithImpl(this._self, this._then);

  final FluxImageStyleConfig _self;
  final $Res Function(FluxImageStyleConfig) _then;

/// Create a copy of FluxImageStyleConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = freezed,Object? height = freezed,Object? aspectRatio = freezed,Object? borderRadius = freezed,Object? fit = freezed,Object? color = freezed,Object? alignment = freezed,}) {
  return _then(_self.copyWith(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,aspectRatio: freezed == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double?,borderRadius: freezed == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as BorderRadiusDirectional?,fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as AlignmentDirectional?,
  ));
}

}


/// Adds pattern-matching-related methods to [FluxImageStyleConfig].
extension FluxImageStyleConfigPatterns on FluxImageStyleConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxImageStyleConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxImageStyleConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxImageStyleConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxImageStyleConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxImageStyleConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxImageStyleConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? width,  double? height,  double? aspectRatio, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional? borderRadius, @BoxFitConverter()  BoxFit? fit, @ColorConverter()  Color? color, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxImageStyleConfig() when $default != null:
return $default(_that.width,_that.height,_that.aspectRatio,_that.borderRadius,_that.fit,_that.color,_that.alignment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? width,  double? height,  double? aspectRatio, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional? borderRadius, @BoxFitConverter()  BoxFit? fit, @ColorConverter()  Color? color, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment)  $default,) {final _that = this;
switch (_that) {
case _FluxImageStyleConfig():
return $default(_that.width,_that.height,_that.aspectRatio,_that.borderRadius,_that.fit,_that.color,_that.alignment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? width,  double? height,  double? aspectRatio, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional? borderRadius, @BoxFitConverter()  BoxFit? fit, @ColorConverter()  Color? color, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment)?  $default,) {final _that = this;
switch (_that) {
case _FluxImageStyleConfig() when $default != null:
return $default(_that.width,_that.height,_that.aspectRatio,_that.borderRadius,_that.fit,_that.color,_that.alignment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxImageStyleConfig extends FluxImageStyleConfig {
  const _FluxImageStyleConfig({this.width, this.height, this.aspectRatio, @BorderRadiusDirectionalConverter() this.borderRadius, @BoxFitConverter() this.fit, @ColorConverter() this.color, @AlignmentDirectionalConverter() this.alignment}): super._();
  factory _FluxImageStyleConfig.fromJson(Map<String, dynamic> json) => _$FluxImageStyleConfigFromJson(json);

@override final  double? width;
@override final  double? height;
@override final  double? aspectRatio;
@override@BorderRadiusDirectionalConverter() final  BorderRadiusDirectional? borderRadius;
@override@BoxFitConverter() final  BoxFit? fit;
@override@ColorConverter() final  Color? color;
@override@AlignmentDirectionalConverter() final  AlignmentDirectional? alignment;

/// Create a copy of FluxImageStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxImageStyleConfigCopyWith<_FluxImageStyleConfig> get copyWith => __$FluxImageStyleConfigCopyWithImpl<_FluxImageStyleConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxImageStyleConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxImageStyleConfig&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.color, color) || other.color == color)&&(identical(other.alignment, alignment) || other.alignment == alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,aspectRatio,borderRadius,fit,color,alignment);

@override
String toString() {
  return 'FluxImageStyleConfig(width: $width, height: $height, aspectRatio: $aspectRatio, borderRadius: $borderRadius, fit: $fit, color: $color, alignment: $alignment)';
}


}

/// @nodoc
abstract mixin class _$FluxImageStyleConfigCopyWith<$Res> implements $FluxImageStyleConfigCopyWith<$Res> {
  factory _$FluxImageStyleConfigCopyWith(_FluxImageStyleConfig value, $Res Function(_FluxImageStyleConfig) _then) = __$FluxImageStyleConfigCopyWithImpl;
@override @useResult
$Res call({
 double? width, double? height, double? aspectRatio,@BorderRadiusDirectionalConverter() BorderRadiusDirectional? borderRadius,@BoxFitConverter() BoxFit? fit,@ColorConverter() Color? color,@AlignmentDirectionalConverter() AlignmentDirectional? alignment
});




}
/// @nodoc
class __$FluxImageStyleConfigCopyWithImpl<$Res>
    implements _$FluxImageStyleConfigCopyWith<$Res> {
  __$FluxImageStyleConfigCopyWithImpl(this._self, this._then);

  final _FluxImageStyleConfig _self;
  final $Res Function(_FluxImageStyleConfig) _then;

/// Create a copy of FluxImageStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = freezed,Object? height = freezed,Object? aspectRatio = freezed,Object? borderRadius = freezed,Object? fit = freezed,Object? color = freezed,Object? alignment = freezed,}) {
  return _then(_FluxImageStyleConfig(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,aspectRatio: freezed == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double?,borderRadius: freezed == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as BorderRadiusDirectional?,fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BoxFit?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as AlignmentDirectional?,
  ));
}


}

// dart format on
