// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_container_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxContainerConfig {

 double? get width; double? get height;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get margin;@DecorationConverter() BoxDecoration? get decoration;@AlignmentDirectionalConverter() AlignmentDirectional? get alignment;@ConstraintsConverter() BoxConstraints? get constraints;@ClipConverter() Clip get clipBehavior;
/// Create a copy of FluxContainerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxContainerConfigCopyWith<FluxContainerConfig> get copyWith => _$FluxContainerConfigCopyWithImpl<FluxContainerConfig>(this as FluxContainerConfig, _$identity);

  /// Serializes this FluxContainerConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxContainerConfig&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.constraints, constraints) || other.constraints == constraints)&&(identical(other.clipBehavior, clipBehavior) || other.clipBehavior == clipBehavior));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,padding,margin,decoration,alignment,constraints,clipBehavior);

@override
String toString() {
  return 'FluxContainerConfig(width: $width, height: $height, padding: $padding, margin: $margin, decoration: $decoration, alignment: $alignment, constraints: $constraints, clipBehavior: $clipBehavior)';
}


}

/// @nodoc
abstract mixin class $FluxContainerConfigCopyWith<$Res>  {
  factory $FluxContainerConfigCopyWith(FluxContainerConfig value, $Res Function(FluxContainerConfig) _then) = _$FluxContainerConfigCopyWithImpl;
@useResult
$Res call({
 double? width, double? height,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,@DecorationConverter() BoxDecoration? decoration,@AlignmentDirectionalConverter() AlignmentDirectional? alignment,@ConstraintsConverter() BoxConstraints? constraints,@ClipConverter() Clip clipBehavior
});




}
/// @nodoc
class _$FluxContainerConfigCopyWithImpl<$Res>
    implements $FluxContainerConfigCopyWith<$Res> {
  _$FluxContainerConfigCopyWithImpl(this._self, this._then);

  final FluxContainerConfig _self;
  final $Res Function(FluxContainerConfig) _then;

/// Create a copy of FluxContainerConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = freezed,Object? height = freezed,Object? padding = freezed,Object? margin = freezed,Object? decoration = freezed,Object? alignment = freezed,Object? constraints = freezed,Object? clipBehavior = null,}) {
  return _then(_self.copyWith(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as BoxDecoration?,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as AlignmentDirectional?,constraints: freezed == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints?,clipBehavior: null == clipBehavior ? _self.clipBehavior : clipBehavior // ignore: cast_nullable_to_non_nullable
as Clip,
  ));
}

}


/// Adds pattern-matching-related methods to [FluxContainerConfig].
extension FluxContainerConfigPatterns on FluxContainerConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxContainerConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxContainerConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxContainerConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxContainerConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxContainerConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxContainerConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? width,  double? height, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @DecorationConverter()  BoxDecoration? decoration, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment, @ConstraintsConverter()  BoxConstraints? constraints, @ClipConverter()  Clip clipBehavior)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxContainerConfig() when $default != null:
return $default(_that.width,_that.height,_that.padding,_that.margin,_that.decoration,_that.alignment,_that.constraints,_that.clipBehavior);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? width,  double? height, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @DecorationConverter()  BoxDecoration? decoration, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment, @ConstraintsConverter()  BoxConstraints? constraints, @ClipConverter()  Clip clipBehavior)  $default,) {final _that = this;
switch (_that) {
case _FluxContainerConfig():
return $default(_that.width,_that.height,_that.padding,_that.margin,_that.decoration,_that.alignment,_that.constraints,_that.clipBehavior);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? width,  double? height, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @DecorationConverter()  BoxDecoration? decoration, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment, @ConstraintsConverter()  BoxConstraints? constraints, @ClipConverter()  Clip clipBehavior)?  $default,) {final _that = this;
switch (_that) {
case _FluxContainerConfig() when $default != null:
return $default(_that.width,_that.height,_that.padding,_that.margin,_that.decoration,_that.alignment,_that.constraints,_that.clipBehavior);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxContainerConfig extends FluxContainerConfig {
  const _FluxContainerConfig({this.width, this.height, @EdgeInsetsDirectionalConverter() this.padding, @EdgeInsetsDirectionalConverter() this.margin, @DecorationConverter() this.decoration, @AlignmentDirectionalConverter() this.alignment, @ConstraintsConverter() this.constraints, @ClipConverter() this.clipBehavior = Clip.none}): super._();
  factory _FluxContainerConfig.fromJson(Map<String, dynamic> json) => _$FluxContainerConfigFromJson(json);

@override final  double? width;
@override final  double? height;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? margin;
@override@DecorationConverter() final  BoxDecoration? decoration;
@override@AlignmentDirectionalConverter() final  AlignmentDirectional? alignment;
@override@ConstraintsConverter() final  BoxConstraints? constraints;
@override@JsonKey()@ClipConverter() final  Clip clipBehavior;

/// Create a copy of FluxContainerConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxContainerConfigCopyWith<_FluxContainerConfig> get copyWith => __$FluxContainerConfigCopyWithImpl<_FluxContainerConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxContainerConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxContainerConfig&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.constraints, constraints) || other.constraints == constraints)&&(identical(other.clipBehavior, clipBehavior) || other.clipBehavior == clipBehavior));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,padding,margin,decoration,alignment,constraints,clipBehavior);

@override
String toString() {
  return 'FluxContainerConfig(width: $width, height: $height, padding: $padding, margin: $margin, decoration: $decoration, alignment: $alignment, constraints: $constraints, clipBehavior: $clipBehavior)';
}


}

/// @nodoc
abstract mixin class _$FluxContainerConfigCopyWith<$Res> implements $FluxContainerConfigCopyWith<$Res> {
  factory _$FluxContainerConfigCopyWith(_FluxContainerConfig value, $Res Function(_FluxContainerConfig) _then) = __$FluxContainerConfigCopyWithImpl;
@override @useResult
$Res call({
 double? width, double? height,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,@DecorationConverter() BoxDecoration? decoration,@AlignmentDirectionalConverter() AlignmentDirectional? alignment,@ConstraintsConverter() BoxConstraints? constraints,@ClipConverter() Clip clipBehavior
});




}
/// @nodoc
class __$FluxContainerConfigCopyWithImpl<$Res>
    implements _$FluxContainerConfigCopyWith<$Res> {
  __$FluxContainerConfigCopyWithImpl(this._self, this._then);

  final _FluxContainerConfig _self;
  final $Res Function(_FluxContainerConfig) _then;

/// Create a copy of FluxContainerConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = freezed,Object? height = freezed,Object? padding = freezed,Object? margin = freezed,Object? decoration = freezed,Object? alignment = freezed,Object? constraints = freezed,Object? clipBehavior = null,}) {
  return _then(_FluxContainerConfig(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as BoxDecoration?,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as AlignmentDirectional?,constraints: freezed == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints?,clipBehavior: null == clipBehavior ? _self.clipBehavior : clipBehavior // ignore: cast_nullable_to_non_nullable
as Clip,
  ));
}


}

// dart format on
