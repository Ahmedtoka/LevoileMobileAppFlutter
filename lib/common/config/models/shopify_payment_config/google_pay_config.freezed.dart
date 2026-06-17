// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_pay_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GooglePayConfig implements DiagnosticableTreeMixin {

 bool get enable; String get stripePublishableKey; String get merchantId;
/// Create a copy of GooglePayConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GooglePayConfigCopyWith<GooglePayConfig> get copyWith => _$GooglePayConfigCopyWithImpl<GooglePayConfig>(this as GooglePayConfig, _$identity);

  /// Serializes this GooglePayConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GooglePayConfig'))
    ..add(DiagnosticsProperty('enable', enable))..add(DiagnosticsProperty('stripePublishableKey', stripePublishableKey))..add(DiagnosticsProperty('merchantId', merchantId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GooglePayConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,stripePublishableKey,merchantId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GooglePayConfig(enable: $enable, stripePublishableKey: $stripePublishableKey, merchantId: $merchantId)';
}


}

/// @nodoc
abstract mixin class $GooglePayConfigCopyWith<$Res>  {
  factory $GooglePayConfigCopyWith(GooglePayConfig value, $Res Function(GooglePayConfig) _then) = _$GooglePayConfigCopyWithImpl;
@useResult
$Res call({
 bool enable, String stripePublishableKey, String merchantId
});




}
/// @nodoc
class _$GooglePayConfigCopyWithImpl<$Res>
    implements $GooglePayConfigCopyWith<$Res> {
  _$GooglePayConfigCopyWithImpl(this._self, this._then);

  final GooglePayConfig _self;
  final $Res Function(GooglePayConfig) _then;

/// Create a copy of GooglePayConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? stripePublishableKey = null,Object? merchantId = null,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,stripePublishableKey: null == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GooglePayConfig].
extension GooglePayConfigPatterns on GooglePayConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GooglePayConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GooglePayConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GooglePayConfig value)  $default,){
final _that = this;
switch (_that) {
case _GooglePayConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GooglePayConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GooglePayConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  String stripePublishableKey,  String merchantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GooglePayConfig() when $default != null:
return $default(_that.enable,_that.stripePublishableKey,_that.merchantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  String stripePublishableKey,  String merchantId)  $default,) {final _that = this;
switch (_that) {
case _GooglePayConfig():
return $default(_that.enable,_that.stripePublishableKey,_that.merchantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  String stripePublishableKey,  String merchantId)?  $default,) {final _that = this;
switch (_that) {
case _GooglePayConfig() when $default != null:
return $default(_that.enable,_that.stripePublishableKey,_that.merchantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GooglePayConfig with DiagnosticableTreeMixin implements GooglePayConfig {
  const _GooglePayConfig({this.enable = false, this.stripePublishableKey = '', this.merchantId = ''});
  factory _GooglePayConfig.fromJson(Map<String, dynamic> json) => _$GooglePayConfigFromJson(json);

@override@JsonKey() final  bool enable;
@override@JsonKey() final  String stripePublishableKey;
@override@JsonKey() final  String merchantId;

/// Create a copy of GooglePayConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GooglePayConfigCopyWith<_GooglePayConfig> get copyWith => __$GooglePayConfigCopyWithImpl<_GooglePayConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GooglePayConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GooglePayConfig'))
    ..add(DiagnosticsProperty('enable', enable))..add(DiagnosticsProperty('stripePublishableKey', stripePublishableKey))..add(DiagnosticsProperty('merchantId', merchantId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GooglePayConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,stripePublishableKey,merchantId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GooglePayConfig(enable: $enable, stripePublishableKey: $stripePublishableKey, merchantId: $merchantId)';
}


}

/// @nodoc
abstract mixin class _$GooglePayConfigCopyWith<$Res> implements $GooglePayConfigCopyWith<$Res> {
  factory _$GooglePayConfigCopyWith(_GooglePayConfig value, $Res Function(_GooglePayConfig) _then) = __$GooglePayConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enable, String stripePublishableKey, String merchantId
});




}
/// @nodoc
class __$GooglePayConfigCopyWithImpl<$Res>
    implements _$GooglePayConfigCopyWith<$Res> {
  __$GooglePayConfigCopyWithImpl(this._self, this._then);

  final _GooglePayConfig _self;
  final $Res Function(_GooglePayConfig) _then;

/// Create a copy of GooglePayConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? stripePublishableKey = null,Object? merchantId = null,}) {
  return _then(_GooglePayConfig(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,stripePublishableKey: null == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String,merchantId: null == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
