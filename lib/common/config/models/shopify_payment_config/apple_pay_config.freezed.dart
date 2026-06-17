// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple_pay_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplePayConfig implements DiagnosticableTreeMixin {

 bool get enable; String get merchantId;
/// Create a copy of ApplePayConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplePayConfigCopyWith<ApplePayConfig> get copyWith => _$ApplePayConfigCopyWithImpl<ApplePayConfig>(this as ApplePayConfig, _$identity);

  /// Serializes this ApplePayConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ApplePayConfig'))
    ..add(DiagnosticsProperty('enable', enable))..add(DiagnosticsProperty('merchantId', merchantId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplePayConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,merchantId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ApplePayConfig(enable: $enable, merchantId: $merchantId)';
}


}

/// @nodoc
abstract mixin class $ApplePayConfigCopyWith<$Res>  {
  factory $ApplePayConfigCopyWith(ApplePayConfig value, $Res Function(ApplePayConfig) _then) = _$ApplePayConfigCopyWithImpl;
@useResult
$Res call({
 bool enable, String merchantId
});




}
/// @nodoc
class _$ApplePayConfigCopyWithImpl<$Res>
    implements $ApplePayConfigCopyWith<$Res> {
  _$ApplePayConfigCopyWithImpl(this._self, this._then);

  final ApplePayConfig _self;
  final $Res Function(ApplePayConfig) _then;

/// Create a copy of ApplePayConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? merchantId = null,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplePayConfig].
extension ApplePayConfigPatterns on ApplePayConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplePayConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplePayConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplePayConfig value)  $default,){
final _that = this;
switch (_that) {
case _ApplePayConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplePayConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ApplePayConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  String merchantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplePayConfig() when $default != null:
return $default(_that.enable,_that.merchantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  String merchantId)  $default,) {final _that = this;
switch (_that) {
case _ApplePayConfig():
return $default(_that.enable,_that.merchantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  String merchantId)?  $default,) {final _that = this;
switch (_that) {
case _ApplePayConfig() when $default != null:
return $default(_that.enable,_that.merchantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplePayConfig with DiagnosticableTreeMixin implements ApplePayConfig {
  const _ApplePayConfig({this.enable = false, this.merchantId = ''});
  factory _ApplePayConfig.fromJson(Map<String, dynamic> json) => _$ApplePayConfigFromJson(json);

@override@JsonKey() final  bool enable;
@override@JsonKey() final  String merchantId;

/// Create a copy of ApplePayConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplePayConfigCopyWith<_ApplePayConfig> get copyWith => __$ApplePayConfigCopyWithImpl<_ApplePayConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplePayConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ApplePayConfig'))
    ..add(DiagnosticsProperty('enable', enable))..add(DiagnosticsProperty('merchantId', merchantId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplePayConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,merchantId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ApplePayConfig(enable: $enable, merchantId: $merchantId)';
}


}

/// @nodoc
abstract mixin class _$ApplePayConfigCopyWith<$Res> implements $ApplePayConfigCopyWith<$Res> {
  factory _$ApplePayConfigCopyWith(_ApplePayConfig value, $Res Function(_ApplePayConfig) _then) = __$ApplePayConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enable, String merchantId
});




}
/// @nodoc
class __$ApplePayConfigCopyWithImpl<$Res>
    implements _$ApplePayConfigCopyWith<$Res> {
  __$ApplePayConfigCopyWithImpl(this._self, this._then);

  final _ApplePayConfig _self;
  final $Res Function(_ApplePayConfig) _then;

/// Create a copy of ApplePayConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? merchantId = null,}) {
  return _then(_ApplePayConfig(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
