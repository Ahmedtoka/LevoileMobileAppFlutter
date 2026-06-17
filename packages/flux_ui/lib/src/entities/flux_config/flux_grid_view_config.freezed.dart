// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_grid_view_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxGridViewConfig implements DiagnosticableTreeMixin {

 int get crossAxisCount; double get crossAxisSpacing; double get mainAxisSpacing; double get childAspectRatio;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding;
/// Create a copy of FluxGridViewConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxGridViewConfigCopyWith<FluxGridViewConfig> get copyWith => _$FluxGridViewConfigCopyWithImpl<FluxGridViewConfig>(this as FluxGridViewConfig, _$identity);

  /// Serializes this FluxGridViewConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxGridViewConfig'))
    ..add(DiagnosticsProperty('crossAxisCount', crossAxisCount))..add(DiagnosticsProperty('crossAxisSpacing', crossAxisSpacing))..add(DiagnosticsProperty('mainAxisSpacing', mainAxisSpacing))..add(DiagnosticsProperty('childAspectRatio', childAspectRatio))..add(DiagnosticsProperty('padding', padding));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxGridViewConfig&&(identical(other.crossAxisCount, crossAxisCount) || other.crossAxisCount == crossAxisCount)&&(identical(other.crossAxisSpacing, crossAxisSpacing) || other.crossAxisSpacing == crossAxisSpacing)&&(identical(other.mainAxisSpacing, mainAxisSpacing) || other.mainAxisSpacing == mainAxisSpacing)&&(identical(other.childAspectRatio, childAspectRatio) || other.childAspectRatio == childAspectRatio)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,crossAxisCount,crossAxisSpacing,mainAxisSpacing,childAspectRatio,padding);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxGridViewConfig(crossAxisCount: $crossAxisCount, crossAxisSpacing: $crossAxisSpacing, mainAxisSpacing: $mainAxisSpacing, childAspectRatio: $childAspectRatio, padding: $padding)';
}


}

/// @nodoc
abstract mixin class $FluxGridViewConfigCopyWith<$Res>  {
  factory $FluxGridViewConfigCopyWith(FluxGridViewConfig value, $Res Function(FluxGridViewConfig) _then) = _$FluxGridViewConfigCopyWithImpl;
@useResult
$Res call({
 int crossAxisCount, double crossAxisSpacing, double mainAxisSpacing, double childAspectRatio,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding
});




}
/// @nodoc
class _$FluxGridViewConfigCopyWithImpl<$Res>
    implements $FluxGridViewConfigCopyWith<$Res> {
  _$FluxGridViewConfigCopyWithImpl(this._self, this._then);

  final FluxGridViewConfig _self;
  final $Res Function(FluxGridViewConfig) _then;

/// Create a copy of FluxGridViewConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? crossAxisCount = null,Object? crossAxisSpacing = null,Object? mainAxisSpacing = null,Object? childAspectRatio = null,Object? padding = freezed,}) {
  return _then(_self.copyWith(
crossAxisCount: null == crossAxisCount ? _self.crossAxisCount : crossAxisCount // ignore: cast_nullable_to_non_nullable
as int,crossAxisSpacing: null == crossAxisSpacing ? _self.crossAxisSpacing : crossAxisSpacing // ignore: cast_nullable_to_non_nullable
as double,mainAxisSpacing: null == mainAxisSpacing ? _self.mainAxisSpacing : mainAxisSpacing // ignore: cast_nullable_to_non_nullable
as double,childAspectRatio: null == childAspectRatio ? _self.childAspectRatio : childAspectRatio // ignore: cast_nullable_to_non_nullable
as double,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}

}


/// Adds pattern-matching-related methods to [FluxGridViewConfig].
extension FluxGridViewConfigPatterns on FluxGridViewConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxGridViewConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxGridViewConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxGridViewConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxGridViewConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxGridViewConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxGridViewConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int crossAxisCount,  double crossAxisSpacing,  double mainAxisSpacing,  double childAspectRatio, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxGridViewConfig() when $default != null:
return $default(_that.crossAxisCount,_that.crossAxisSpacing,_that.mainAxisSpacing,_that.childAspectRatio,_that.padding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int crossAxisCount,  double crossAxisSpacing,  double mainAxisSpacing,  double childAspectRatio, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)  $default,) {final _that = this;
switch (_that) {
case _FluxGridViewConfig():
return $default(_that.crossAxisCount,_that.crossAxisSpacing,_that.mainAxisSpacing,_that.childAspectRatio,_that.padding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int crossAxisCount,  double crossAxisSpacing,  double mainAxisSpacing,  double childAspectRatio, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)?  $default,) {final _that = this;
switch (_that) {
case _FluxGridViewConfig() when $default != null:
return $default(_that.crossAxisCount,_that.crossAxisSpacing,_that.mainAxisSpacing,_that.childAspectRatio,_that.padding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxGridViewConfig with DiagnosticableTreeMixin implements FluxGridViewConfig {
  const _FluxGridViewConfig({this.crossAxisCount = _defaultCrossAxisCount, this.crossAxisSpacing = _defaultCrossAxisSpacing, this.mainAxisSpacing = _defaultMainAxisSpacing, this.childAspectRatio = _defaultChildAspectRatio, @EdgeInsetsDirectionalConverter() this.padding});
  factory _FluxGridViewConfig.fromJson(Map<String, dynamic> json) => _$FluxGridViewConfigFromJson(json);

@override@JsonKey() final  int crossAxisCount;
@override@JsonKey() final  double crossAxisSpacing;
@override@JsonKey() final  double mainAxisSpacing;
@override@JsonKey() final  double childAspectRatio;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;

/// Create a copy of FluxGridViewConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxGridViewConfigCopyWith<_FluxGridViewConfig> get copyWith => __$FluxGridViewConfigCopyWithImpl<_FluxGridViewConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxGridViewConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxGridViewConfig'))
    ..add(DiagnosticsProperty('crossAxisCount', crossAxisCount))..add(DiagnosticsProperty('crossAxisSpacing', crossAxisSpacing))..add(DiagnosticsProperty('mainAxisSpacing', mainAxisSpacing))..add(DiagnosticsProperty('childAspectRatio', childAspectRatio))..add(DiagnosticsProperty('padding', padding));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxGridViewConfig&&(identical(other.crossAxisCount, crossAxisCount) || other.crossAxisCount == crossAxisCount)&&(identical(other.crossAxisSpacing, crossAxisSpacing) || other.crossAxisSpacing == crossAxisSpacing)&&(identical(other.mainAxisSpacing, mainAxisSpacing) || other.mainAxisSpacing == mainAxisSpacing)&&(identical(other.childAspectRatio, childAspectRatio) || other.childAspectRatio == childAspectRatio)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,crossAxisCount,crossAxisSpacing,mainAxisSpacing,childAspectRatio,padding);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxGridViewConfig(crossAxisCount: $crossAxisCount, crossAxisSpacing: $crossAxisSpacing, mainAxisSpacing: $mainAxisSpacing, childAspectRatio: $childAspectRatio, padding: $padding)';
}


}

/// @nodoc
abstract mixin class _$FluxGridViewConfigCopyWith<$Res> implements $FluxGridViewConfigCopyWith<$Res> {
  factory _$FluxGridViewConfigCopyWith(_FluxGridViewConfig value, $Res Function(_FluxGridViewConfig) _then) = __$FluxGridViewConfigCopyWithImpl;
@override @useResult
$Res call({
 int crossAxisCount, double crossAxisSpacing, double mainAxisSpacing, double childAspectRatio,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding
});




}
/// @nodoc
class __$FluxGridViewConfigCopyWithImpl<$Res>
    implements _$FluxGridViewConfigCopyWith<$Res> {
  __$FluxGridViewConfigCopyWithImpl(this._self, this._then);

  final _FluxGridViewConfig _self;
  final $Res Function(_FluxGridViewConfig) _then;

/// Create a copy of FluxGridViewConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? crossAxisCount = null,Object? crossAxisSpacing = null,Object? mainAxisSpacing = null,Object? childAspectRatio = null,Object? padding = freezed,}) {
  return _then(_FluxGridViewConfig(
crossAxisCount: null == crossAxisCount ? _self.crossAxisCount : crossAxisCount // ignore: cast_nullable_to_non_nullable
as int,crossAxisSpacing: null == crossAxisSpacing ? _self.crossAxisSpacing : crossAxisSpacing // ignore: cast_nullable_to_non_nullable
as double,mainAxisSpacing: null == mainAxisSpacing ? _self.mainAxisSpacing : mainAxisSpacing // ignore: cast_nullable_to_non_nullable
as double,childAspectRatio: null == childAspectRatio ? _self.childAspectRatio : childAspectRatio // ignore: cast_nullable_to_non_nullable
as double,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}


}

// dart format on
