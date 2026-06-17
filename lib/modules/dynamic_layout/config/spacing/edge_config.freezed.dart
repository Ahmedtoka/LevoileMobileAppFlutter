// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edge_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdgeConfig implements DiagnosticableTreeMixin {

@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) double? get start;@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) double? get end; double? get top; double? get bottom;
/// Create a copy of EdgeConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EdgeConfigCopyWith<EdgeConfig> get copyWith => _$EdgeConfigCopyWithImpl<EdgeConfig>(this as EdgeConfig, _$identity);

  /// Serializes this EdgeConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'EdgeConfig'))
    ..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('top', top))..add(DiagnosticsProperty('bottom', bottom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EdgeConfig&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.top, top) || other.top == top)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,top,bottom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'EdgeConfig(start: $start, end: $end, top: $top, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class $EdgeConfigCopyWith<$Res>  {
  factory $EdgeConfigCopyWith(EdgeConfig value, $Res Function(EdgeConfig) _then) = _$EdgeConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) double? start,@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) double? end, double? top, double? bottom
});




}
/// @nodoc
class _$EdgeConfigCopyWithImpl<$Res>
    implements $EdgeConfigCopyWith<$Res> {
  _$EdgeConfigCopyWithImpl(this._self, this._then);

  final EdgeConfig _self;
  final $Res Function(EdgeConfig) _then;

/// Create a copy of EdgeConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = freezed,Object? end = freezed,Object? top = freezed,Object? bottom = freezed,}) {
  return _then(_self.copyWith(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double?,top: freezed == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double?,bottom: freezed == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [EdgeConfig].
extension EdgeConfigPatterns on EdgeConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EdgeConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EdgeConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EdgeConfig value)  $default,){
final _that = this;
switch (_that) {
case _EdgeConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EdgeConfig value)?  $default,){
final _that = this;
switch (_that) {
case _EdgeConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig)  double? start, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig)  double? end,  double? top,  double? bottom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EdgeConfig() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig)  double? start, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig)  double? end,  double? top,  double? bottom)  $default,) {final _that = this;
switch (_that) {
case _EdgeConfig():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig)  double? start, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig)  double? end,  double? top,  double? bottom)?  $default,) {final _that = this;
switch (_that) {
case _EdgeConfig() when $default != null:
return $default(_that.start,_that.end,_that.top,_that.bottom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EdgeConfig with DiagnosticableTreeMixin implements EdgeConfig {
  const _EdgeConfig({@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) this.start, @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) this.end, this.top, this.bottom});
  factory _EdgeConfig.fromJson(Map<String, dynamic> json) => _$EdgeConfigFromJson(json);

@override@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) final  double? start;
@override@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) final  double? end;
@override final  double? top;
@override final  double? bottom;

/// Create a copy of EdgeConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EdgeConfigCopyWith<_EdgeConfig> get copyWith => __$EdgeConfigCopyWithImpl<_EdgeConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EdgeConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'EdgeConfig'))
    ..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('top', top))..add(DiagnosticsProperty('bottom', bottom));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EdgeConfig&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.top, top) || other.top == top)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,top,bottom);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'EdgeConfig(start: $start, end: $end, top: $top, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class _$EdgeConfigCopyWith<$Res> implements $EdgeConfigCopyWith<$Res> {
  factory _$EdgeConfigCopyWith(_EdgeConfig value, $Res Function(_EdgeConfig) _then) = __$EdgeConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig) double? start,@JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig) double? end, double? top, double? bottom
});




}
/// @nodoc
class __$EdgeConfigCopyWithImpl<$Res>
    implements _$EdgeConfigCopyWith<$Res> {
  __$EdgeConfigCopyWithImpl(this._self, this._then);

  final _EdgeConfig _self;
  final $Res Function(_EdgeConfig) _then;

/// Create a copy of EdgeConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = freezed,Object? end = freezed,Object? top = freezed,Object? bottom = freezed,}) {
  return _then(_EdgeConfig(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double?,top: freezed == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double?,bottom: freezed == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
