// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_edge_insets_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxEdgeInsetsConfig implements DiagnosticableTreeMixin {

@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) double get start;@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) double get end; double get top; double get bottom;
/// Create a copy of FluxEdgeInsetsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxEdgeInsetsConfigCopyWith<FluxEdgeInsetsConfig> get copyWith => _$FluxEdgeInsetsConfigCopyWithImpl<FluxEdgeInsetsConfig>(this as FluxEdgeInsetsConfig, _$identity);

  /// Serializes this FluxEdgeInsetsConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxEdgeInsetsConfig'))
    ..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('top', top))..add(DiagnosticsProperty('bottom', bottom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxEdgeInsetsConfig&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.top, top) || other.top == top)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,top,bottom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxEdgeInsetsConfig(start: $start, end: $end, top: $top, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class $FluxEdgeInsetsConfigCopyWith<$Res>  {
  factory $FluxEdgeInsetsConfigCopyWith(FluxEdgeInsetsConfig value, $Res Function(FluxEdgeInsetsConfig) _then) = _$FluxEdgeInsetsConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) double start,@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) double end, double top, double bottom
});




}
/// @nodoc
class _$FluxEdgeInsetsConfigCopyWithImpl<$Res>
    implements $FluxEdgeInsetsConfigCopyWith<$Res> {
  _$FluxEdgeInsetsConfigCopyWithImpl(this._self, this._then);

  final FluxEdgeInsetsConfig _self;
  final $Res Function(FluxEdgeInsetsConfig) _then;

/// Create a copy of FluxEdgeInsetsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,Object? top = null,Object? bottom = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FluxEdgeInsetsConfig].
extension FluxEdgeInsetsConfigPatterns on FluxEdgeInsetsConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxEdgeInsetsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxEdgeInsetsConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxEdgeInsetsConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxEdgeInsetsConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxEdgeInsetsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxEdgeInsetsConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig)  double start, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig)  double end,  double top,  double bottom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxEdgeInsetsConfig() when $default != null:
return $default(_that.start,_that.end,_that.top,_that.bottom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig)  double start, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig)  double end,  double top,  double bottom)  $default,) {final _that = this;
switch (_that) {
case _FluxEdgeInsetsConfig():
return $default(_that.start,_that.end,_that.top,_that.bottom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig)  double start, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig)  double end,  double top,  double bottom)?  $default,) {final _that = this;
switch (_that) {
case _FluxEdgeInsetsConfig() when $default != null:
return $default(_that.start,_that.end,_that.top,_that.bottom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxEdgeInsetsConfig with DiagnosticableTreeMixin implements FluxEdgeInsetsConfig {
  const _FluxEdgeInsetsConfig({@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) this.start = 0, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) this.end = 0, this.top = 0, this.bottom = 0});
  factory _FluxEdgeInsetsConfig.fromJson(Map<String, dynamic> json) => _$FluxEdgeInsetsConfigFromJson(json);

@override@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) final  double start;
@override@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) final  double end;
@override@JsonKey() final  double top;
@override@JsonKey() final  double bottom;

/// Create a copy of FluxEdgeInsetsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxEdgeInsetsConfigCopyWith<_FluxEdgeInsetsConfig> get copyWith => __$FluxEdgeInsetsConfigCopyWithImpl<_FluxEdgeInsetsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxEdgeInsetsConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxEdgeInsetsConfig'))
    ..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('top', top))..add(DiagnosticsProperty('bottom', bottom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxEdgeInsetsConfig&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.top, top) || other.top == top)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,top,bottom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxEdgeInsetsConfig(start: $start, end: $end, top: $top, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class _$FluxEdgeInsetsConfigCopyWith<$Res> implements $FluxEdgeInsetsConfigCopyWith<$Res> {
  factory _$FluxEdgeInsetsConfigCopyWith(_FluxEdgeInsetsConfig value, $Res Function(_FluxEdgeInsetsConfig) _then) = __$FluxEdgeInsetsConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) double start,@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) double end, double top, double bottom
});




}
/// @nodoc
class __$FluxEdgeInsetsConfigCopyWithImpl<$Res>
    implements _$FluxEdgeInsetsConfigCopyWith<$Res> {
  __$FluxEdgeInsetsConfigCopyWithImpl(this._self, this._then);

  final _FluxEdgeInsetsConfig _self;
  final $Res Function(_FluxEdgeInsetsConfig) _then;

/// Create a copy of FluxEdgeInsetsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,Object? top = null,Object? bottom = null,}) {
  return _then(_FluxEdgeInsetsConfig(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
