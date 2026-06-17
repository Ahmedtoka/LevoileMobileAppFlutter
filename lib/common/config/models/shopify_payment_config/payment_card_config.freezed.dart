// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_card_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentCardConfig implements DiagnosticableTreeMixin {

 bool get enable; String get serverEndpoint;
/// Create a copy of PaymentCardConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCardConfigCopyWith<PaymentCardConfig> get copyWith => _$PaymentCardConfigCopyWithImpl<PaymentCardConfig>(this as PaymentCardConfig, _$identity);

  /// Serializes this PaymentCardConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaymentCardConfig'))
    ..add(DiagnosticsProperty('enable', enable))..add(DiagnosticsProperty('serverEndpoint', serverEndpoint));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCardConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.serverEndpoint, serverEndpoint) || other.serverEndpoint == serverEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,serverEndpoint);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaymentCardConfig(enable: $enable, serverEndpoint: $serverEndpoint)';
}


}

/// @nodoc
abstract mixin class $PaymentCardConfigCopyWith<$Res>  {
  factory $PaymentCardConfigCopyWith(PaymentCardConfig value, $Res Function(PaymentCardConfig) _then) = _$PaymentCardConfigCopyWithImpl;
@useResult
$Res call({
 bool enable, String serverEndpoint
});




}
/// @nodoc
class _$PaymentCardConfigCopyWithImpl<$Res>
    implements $PaymentCardConfigCopyWith<$Res> {
  _$PaymentCardConfigCopyWithImpl(this._self, this._then);

  final PaymentCardConfig _self;
  final $Res Function(PaymentCardConfig) _then;

/// Create a copy of PaymentCardConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? serverEndpoint = null,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,serverEndpoint: null == serverEndpoint ? _self.serverEndpoint : serverEndpoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentCardConfig].
extension PaymentCardConfigPatterns on PaymentCardConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentCardConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentCardConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentCardConfig value)  $default,){
final _that = this;
switch (_that) {
case _PaymentCardConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentCardConfig value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentCardConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  String serverEndpoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentCardConfig() when $default != null:
return $default(_that.enable,_that.serverEndpoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  String serverEndpoint)  $default,) {final _that = this;
switch (_that) {
case _PaymentCardConfig():
return $default(_that.enable,_that.serverEndpoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  String serverEndpoint)?  $default,) {final _that = this;
switch (_that) {
case _PaymentCardConfig() when $default != null:
return $default(_that.enable,_that.serverEndpoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentCardConfig with DiagnosticableTreeMixin implements PaymentCardConfig {
  const _PaymentCardConfig({this.enable = false, this.serverEndpoint = ''});
  factory _PaymentCardConfig.fromJson(Map<String, dynamic> json) => _$PaymentCardConfigFromJson(json);

@override@JsonKey() final  bool enable;
@override@JsonKey() final  String serverEndpoint;

/// Create a copy of PaymentCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCardConfigCopyWith<_PaymentCardConfig> get copyWith => __$PaymentCardConfigCopyWithImpl<_PaymentCardConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentCardConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaymentCardConfig'))
    ..add(DiagnosticsProperty('enable', enable))..add(DiagnosticsProperty('serverEndpoint', serverEndpoint));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentCardConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.serverEndpoint, serverEndpoint) || other.serverEndpoint == serverEndpoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,serverEndpoint);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaymentCardConfig(enable: $enable, serverEndpoint: $serverEndpoint)';
}


}

/// @nodoc
abstract mixin class _$PaymentCardConfigCopyWith<$Res> implements $PaymentCardConfigCopyWith<$Res> {
  factory _$PaymentCardConfigCopyWith(_PaymentCardConfig value, $Res Function(_PaymentCardConfig) _then) = __$PaymentCardConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enable, String serverEndpoint
});




}
/// @nodoc
class __$PaymentCardConfigCopyWithImpl<$Res>
    implements _$PaymentCardConfigCopyWith<$Res> {
  __$PaymentCardConfigCopyWithImpl(this._self, this._then);

  final _PaymentCardConfig _self;
  final $Res Function(_PaymentCardConfig) _then;

/// Create a copy of PaymentCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? serverEndpoint = null,}) {
  return _then(_PaymentCardConfig(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,serverEndpoint: null == serverEndpoint ? _self.serverEndpoint : serverEndpoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
