// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_card_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxCardConfig {

@ColorConverter() Color? get color;@ColorConverter() Color? get shadowColor;@ColorConverter() Color? get surfaceTintColor; double? get elevation;@BorderRadiusDirectionalConverter() BorderRadiusDirectional get borderRadius;@BorderSideConverter() BorderSide get borderSide;@ClipConverter() Clip? get clipBehavior;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get margin;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get contentPadding;
/// Create a copy of FluxCardConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxCardConfigCopyWith<FluxCardConfig> get copyWith => _$FluxCardConfigCopyWithImpl<FluxCardConfig>(this as FluxCardConfig, _$identity);

  /// Serializes this FluxCardConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxCardConfig&&(identical(other.color, color) || other.color == color)&&(identical(other.shadowColor, shadowColor) || other.shadowColor == shadowColor)&&(identical(other.surfaceTintColor, surfaceTintColor) || other.surfaceTintColor == surfaceTintColor)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.borderSide, borderSide) || other.borderSide == borderSide)&&(identical(other.clipBehavior, clipBehavior) || other.clipBehavior == clipBehavior)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.contentPadding, contentPadding) || other.contentPadding == contentPadding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,shadowColor,surfaceTintColor,elevation,borderRadius,borderSide,clipBehavior,margin,contentPadding);

@override
String toString() {
  return 'FluxCardConfig(color: $color, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor, elevation: $elevation, borderRadius: $borderRadius, borderSide: $borderSide, clipBehavior: $clipBehavior, margin: $margin, contentPadding: $contentPadding)';
}


}

/// @nodoc
abstract mixin class $FluxCardConfigCopyWith<$Res>  {
  factory $FluxCardConfigCopyWith(FluxCardConfig value, $Res Function(FluxCardConfig) _then) = _$FluxCardConfigCopyWithImpl;
@useResult
$Res call({
@ColorConverter() Color? color,@ColorConverter() Color? shadowColor,@ColorConverter() Color? surfaceTintColor, double? elevation,@BorderRadiusDirectionalConverter() BorderRadiusDirectional borderRadius,@BorderSideConverter() BorderSide borderSide,@ClipConverter() Clip? clipBehavior,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding
});




}
/// @nodoc
class _$FluxCardConfigCopyWithImpl<$Res>
    implements $FluxCardConfigCopyWith<$Res> {
  _$FluxCardConfigCopyWithImpl(this._self, this._then);

  final FluxCardConfig _self;
  final $Res Function(FluxCardConfig) _then;

/// Create a copy of FluxCardConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = freezed,Object? shadowColor = freezed,Object? surfaceTintColor = freezed,Object? elevation = freezed,Object? borderRadius = null,Object? borderSide = null,Object? clipBehavior = freezed,Object? margin = freezed,Object? contentPadding = freezed,}) {
  return _then(_self.copyWith(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,shadowColor: freezed == shadowColor ? _self.shadowColor : shadowColor // ignore: cast_nullable_to_non_nullable
as Color?,surfaceTintColor: freezed == surfaceTintColor ? _self.surfaceTintColor : surfaceTintColor // ignore: cast_nullable_to_non_nullable
as Color?,elevation: freezed == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double?,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as BorderRadiusDirectional,borderSide: null == borderSide ? _self.borderSide : borderSide // ignore: cast_nullable_to_non_nullable
as BorderSide,clipBehavior: freezed == clipBehavior ? _self.clipBehavior : clipBehavior // ignore: cast_nullable_to_non_nullable
as Clip?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,contentPadding: freezed == contentPadding ? _self.contentPadding : contentPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}

}


/// Adds pattern-matching-related methods to [FluxCardConfig].
extension FluxCardConfigPatterns on FluxCardConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxCardConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxCardConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxCardConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxCardConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxCardConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxCardConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ColorConverter()  Color? color, @ColorConverter()  Color? shadowColor, @ColorConverter()  Color? surfaceTintColor,  double? elevation, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional borderRadius, @BorderSideConverter()  BorderSide borderSide, @ClipConverter()  Clip? clipBehavior, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxCardConfig() when $default != null:
return $default(_that.color,_that.shadowColor,_that.surfaceTintColor,_that.elevation,_that.borderRadius,_that.borderSide,_that.clipBehavior,_that.margin,_that.contentPadding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ColorConverter()  Color? color, @ColorConverter()  Color? shadowColor, @ColorConverter()  Color? surfaceTintColor,  double? elevation, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional borderRadius, @BorderSideConverter()  BorderSide borderSide, @ClipConverter()  Clip? clipBehavior, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding)  $default,) {final _that = this;
switch (_that) {
case _FluxCardConfig():
return $default(_that.color,_that.shadowColor,_that.surfaceTintColor,_that.elevation,_that.borderRadius,_that.borderSide,_that.clipBehavior,_that.margin,_that.contentPadding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ColorConverter()  Color? color, @ColorConverter()  Color? shadowColor, @ColorConverter()  Color? surfaceTintColor,  double? elevation, @BorderRadiusDirectionalConverter()  BorderRadiusDirectional borderRadius, @BorderSideConverter()  BorderSide borderSide, @ClipConverter()  Clip? clipBehavior, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding)?  $default,) {final _that = this;
switch (_that) {
case _FluxCardConfig() when $default != null:
return $default(_that.color,_that.shadowColor,_that.surfaceTintColor,_that.elevation,_that.borderRadius,_that.borderSide,_that.clipBehavior,_that.margin,_that.contentPadding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxCardConfig implements FluxCardConfig {
  const _FluxCardConfig({@ColorConverter() this.color, @ColorConverter() this.shadowColor, @ColorConverter() this.surfaceTintColor, this.elevation, @BorderRadiusDirectionalConverter() this.borderRadius = BorderRadiusDirectional.zero, @BorderSideConverter() this.borderSide = BorderSide.none, @ClipConverter() this.clipBehavior, @EdgeInsetsDirectionalConverter() this.margin, @EdgeInsetsDirectionalConverter() this.contentPadding});
  factory _FluxCardConfig.fromJson(Map<String, dynamic> json) => _$FluxCardConfigFromJson(json);

@override@ColorConverter() final  Color? color;
@override@ColorConverter() final  Color? shadowColor;
@override@ColorConverter() final  Color? surfaceTintColor;
@override final  double? elevation;
@override@JsonKey()@BorderRadiusDirectionalConverter() final  BorderRadiusDirectional borderRadius;
@override@JsonKey()@BorderSideConverter() final  BorderSide borderSide;
@override@ClipConverter() final  Clip? clipBehavior;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? margin;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? contentPadding;

/// Create a copy of FluxCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxCardConfigCopyWith<_FluxCardConfig> get copyWith => __$FluxCardConfigCopyWithImpl<_FluxCardConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxCardConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxCardConfig&&(identical(other.color, color) || other.color == color)&&(identical(other.shadowColor, shadowColor) || other.shadowColor == shadowColor)&&(identical(other.surfaceTintColor, surfaceTintColor) || other.surfaceTintColor == surfaceTintColor)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.borderSide, borderSide) || other.borderSide == borderSide)&&(identical(other.clipBehavior, clipBehavior) || other.clipBehavior == clipBehavior)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.contentPadding, contentPadding) || other.contentPadding == contentPadding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,shadowColor,surfaceTintColor,elevation,borderRadius,borderSide,clipBehavior,margin,contentPadding);

@override
String toString() {
  return 'FluxCardConfig(color: $color, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor, elevation: $elevation, borderRadius: $borderRadius, borderSide: $borderSide, clipBehavior: $clipBehavior, margin: $margin, contentPadding: $contentPadding)';
}


}

/// @nodoc
abstract mixin class _$FluxCardConfigCopyWith<$Res> implements $FluxCardConfigCopyWith<$Res> {
  factory _$FluxCardConfigCopyWith(_FluxCardConfig value, $Res Function(_FluxCardConfig) _then) = __$FluxCardConfigCopyWithImpl;
@override @useResult
$Res call({
@ColorConverter() Color? color,@ColorConverter() Color? shadowColor,@ColorConverter() Color? surfaceTintColor, double? elevation,@BorderRadiusDirectionalConverter() BorderRadiusDirectional borderRadius,@BorderSideConverter() BorderSide borderSide,@ClipConverter() Clip? clipBehavior,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding
});




}
/// @nodoc
class __$FluxCardConfigCopyWithImpl<$Res>
    implements _$FluxCardConfigCopyWith<$Res> {
  __$FluxCardConfigCopyWithImpl(this._self, this._then);

  final _FluxCardConfig _self;
  final $Res Function(_FluxCardConfig) _then;

/// Create a copy of FluxCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = freezed,Object? shadowColor = freezed,Object? surfaceTintColor = freezed,Object? elevation = freezed,Object? borderRadius = null,Object? borderSide = null,Object? clipBehavior = freezed,Object? margin = freezed,Object? contentPadding = freezed,}) {
  return _then(_FluxCardConfig(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,shadowColor: freezed == shadowColor ? _self.shadowColor : shadowColor // ignore: cast_nullable_to_non_nullable
as Color?,surfaceTintColor: freezed == surfaceTintColor ? _self.surfaceTintColor : surfaceTintColor // ignore: cast_nullable_to_non_nullable
as Color?,elevation: freezed == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double?,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as BorderRadiusDirectional,borderSide: null == borderSide ? _self.borderSide : borderSide // ignore: cast_nullable_to_non_nullable
as BorderSide,clipBehavior: freezed == clipBehavior ? _self.clipBehavior : clipBehavior // ignore: cast_nullable_to_non_nullable
as Clip?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,contentPadding: freezed == contentPadding ? _self.contentPadding : contentPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}


}

// dart format on
