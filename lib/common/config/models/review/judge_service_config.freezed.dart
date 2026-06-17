// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'judge_service_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JudgeServiceConfig implements DiagnosticableTreeMixin {

 String get domain; String get apiKey;
/// Create a copy of JudgeServiceConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JudgeServiceConfigCopyWith<JudgeServiceConfig> get copyWith => _$JudgeServiceConfigCopyWithImpl<JudgeServiceConfig>(this as JudgeServiceConfig, _$identity);

  /// Serializes this JudgeServiceConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JudgeServiceConfig'))
    ..add(DiagnosticsProperty('domain', domain))..add(DiagnosticsProperty('apiKey', apiKey));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JudgeServiceConfig&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,apiKey);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JudgeServiceConfig(domain: $domain, apiKey: $apiKey)';
}


}

/// @nodoc
abstract mixin class $JudgeServiceConfigCopyWith<$Res>  {
  factory $JudgeServiceConfigCopyWith(JudgeServiceConfig value, $Res Function(JudgeServiceConfig) _then) = _$JudgeServiceConfigCopyWithImpl;
@useResult
$Res call({
 String domain, String apiKey
});




}
/// @nodoc
class _$JudgeServiceConfigCopyWithImpl<$Res>
    implements $JudgeServiceConfigCopyWith<$Res> {
  _$JudgeServiceConfigCopyWithImpl(this._self, this._then);

  final JudgeServiceConfig _self;
  final $Res Function(JudgeServiceConfig) _then;

/// Create a copy of JudgeServiceConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = null,Object? apiKey = null,}) {
  return _then(_self.copyWith(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JudgeServiceConfig].
extension JudgeServiceConfigPatterns on JudgeServiceConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JudgeServiceConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JudgeServiceConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JudgeServiceConfig value)  $default,){
final _that = this;
switch (_that) {
case _JudgeServiceConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JudgeServiceConfig value)?  $default,){
final _that = this;
switch (_that) {
case _JudgeServiceConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domain,  String apiKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JudgeServiceConfig() when $default != null:
return $default(_that.domain,_that.apiKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domain,  String apiKey)  $default,) {final _that = this;
switch (_that) {
case _JudgeServiceConfig():
return $default(_that.domain,_that.apiKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domain,  String apiKey)?  $default,) {final _that = this;
switch (_that) {
case _JudgeServiceConfig() when $default != null:
return $default(_that.domain,_that.apiKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JudgeServiceConfig with DiagnosticableTreeMixin implements JudgeServiceConfig {
  const _JudgeServiceConfig({this.domain = '', this.apiKey = ''});
  factory _JudgeServiceConfig.fromJson(Map<String, dynamic> json) => _$JudgeServiceConfigFromJson(json);

@override@JsonKey() final  String domain;
@override@JsonKey() final  String apiKey;

/// Create a copy of JudgeServiceConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JudgeServiceConfigCopyWith<_JudgeServiceConfig> get copyWith => __$JudgeServiceConfigCopyWithImpl<_JudgeServiceConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JudgeServiceConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'JudgeServiceConfig'))
    ..add(DiagnosticsProperty('domain', domain))..add(DiagnosticsProperty('apiKey', apiKey));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JudgeServiceConfig&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,apiKey);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'JudgeServiceConfig(domain: $domain, apiKey: $apiKey)';
}


}

/// @nodoc
abstract mixin class _$JudgeServiceConfigCopyWith<$Res> implements $JudgeServiceConfigCopyWith<$Res> {
  factory _$JudgeServiceConfigCopyWith(_JudgeServiceConfig value, $Res Function(_JudgeServiceConfig) _then) = __$JudgeServiceConfigCopyWithImpl;
@override @useResult
$Res call({
 String domain, String apiKey
});




}
/// @nodoc
class __$JudgeServiceConfigCopyWithImpl<$Res>
    implements _$JudgeServiceConfigCopyWith<$Res> {
  __$JudgeServiceConfigCopyWithImpl(this._self, this._then);

  final _JudgeServiceConfig _self;
  final $Res Function(_JudgeServiceConfig) _then;

/// Create a copy of JudgeServiceConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = null,Object? apiKey = null,}) {
  return _then(_JudgeServiceConfig(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
