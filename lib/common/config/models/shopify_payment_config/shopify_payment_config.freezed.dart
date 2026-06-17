// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopify_payment_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShopifyPaymentConfig implements DiagnosticableTreeMixin {

 String get shopName; String get countryCode; bool get productionMode; PaymentCardConfig get paymentCardConfig; GooglePayConfig get googlePayConfig; ApplePayConfig get applePayConfig;
/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopifyPaymentConfigCopyWith<ShopifyPaymentConfig> get copyWith => _$ShopifyPaymentConfigCopyWithImpl<ShopifyPaymentConfig>(this as ShopifyPaymentConfig, _$identity);

  /// Serializes this ShopifyPaymentConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ShopifyPaymentConfig'))
    ..add(DiagnosticsProperty('shopName', shopName))..add(DiagnosticsProperty('countryCode', countryCode))..add(DiagnosticsProperty('productionMode', productionMode))..add(DiagnosticsProperty('paymentCardConfig', paymentCardConfig))..add(DiagnosticsProperty('googlePayConfig', googlePayConfig))..add(DiagnosticsProperty('applePayConfig', applePayConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopifyPaymentConfig&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.productionMode, productionMode) || other.productionMode == productionMode)&&(identical(other.paymentCardConfig, paymentCardConfig) || other.paymentCardConfig == paymentCardConfig)&&(identical(other.googlePayConfig, googlePayConfig) || other.googlePayConfig == googlePayConfig)&&(identical(other.applePayConfig, applePayConfig) || other.applePayConfig == applePayConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,countryCode,productionMode,paymentCardConfig,googlePayConfig,applePayConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ShopifyPaymentConfig(shopName: $shopName, countryCode: $countryCode, productionMode: $productionMode, paymentCardConfig: $paymentCardConfig, googlePayConfig: $googlePayConfig, applePayConfig: $applePayConfig)';
}


}

/// @nodoc
abstract mixin class $ShopifyPaymentConfigCopyWith<$Res>  {
  factory $ShopifyPaymentConfigCopyWith(ShopifyPaymentConfig value, $Res Function(ShopifyPaymentConfig) _then) = _$ShopifyPaymentConfigCopyWithImpl;
@useResult
$Res call({
 String shopName, String countryCode, bool productionMode, PaymentCardConfig paymentCardConfig, GooglePayConfig googlePayConfig, ApplePayConfig applePayConfig
});


$PaymentCardConfigCopyWith<$Res> get paymentCardConfig;$GooglePayConfigCopyWith<$Res> get googlePayConfig;$ApplePayConfigCopyWith<$Res> get applePayConfig;

}
/// @nodoc
class _$ShopifyPaymentConfigCopyWithImpl<$Res>
    implements $ShopifyPaymentConfigCopyWith<$Res> {
  _$ShopifyPaymentConfigCopyWithImpl(this._self, this._then);

  final ShopifyPaymentConfig _self;
  final $Res Function(ShopifyPaymentConfig) _then;

/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shopName = null,Object? countryCode = null,Object? productionMode = null,Object? paymentCardConfig = null,Object? googlePayConfig = null,Object? applePayConfig = null,}) {
  return _then(_self.copyWith(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,productionMode: null == productionMode ? _self.productionMode : productionMode // ignore: cast_nullable_to_non_nullable
as bool,paymentCardConfig: null == paymentCardConfig ? _self.paymentCardConfig : paymentCardConfig // ignore: cast_nullable_to_non_nullable
as PaymentCardConfig,googlePayConfig: null == googlePayConfig ? _self.googlePayConfig : googlePayConfig // ignore: cast_nullable_to_non_nullable
as GooglePayConfig,applePayConfig: null == applePayConfig ? _self.applePayConfig : applePayConfig // ignore: cast_nullable_to_non_nullable
as ApplePayConfig,
  ));
}
/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCardConfigCopyWith<$Res> get paymentCardConfig {
  
  return $PaymentCardConfigCopyWith<$Res>(_self.paymentCardConfig, (value) {
    return _then(_self.copyWith(paymentCardConfig: value));
  });
}/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GooglePayConfigCopyWith<$Res> get googlePayConfig {
  
  return $GooglePayConfigCopyWith<$Res>(_self.googlePayConfig, (value) {
    return _then(_self.copyWith(googlePayConfig: value));
  });
}/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplePayConfigCopyWith<$Res> get applePayConfig {
  
  return $ApplePayConfigCopyWith<$Res>(_self.applePayConfig, (value) {
    return _then(_self.copyWith(applePayConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShopifyPaymentConfig].
extension ShopifyPaymentConfigPatterns on ShopifyPaymentConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopifyPaymentConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopifyPaymentConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopifyPaymentConfig value)  $default,){
final _that = this;
switch (_that) {
case _ShopifyPaymentConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopifyPaymentConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ShopifyPaymentConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String shopName,  String countryCode,  bool productionMode,  PaymentCardConfig paymentCardConfig,  GooglePayConfig googlePayConfig,  ApplePayConfig applePayConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopifyPaymentConfig() when $default != null:
return $default(_that.shopName,_that.countryCode,_that.productionMode,_that.paymentCardConfig,_that.googlePayConfig,_that.applePayConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String shopName,  String countryCode,  bool productionMode,  PaymentCardConfig paymentCardConfig,  GooglePayConfig googlePayConfig,  ApplePayConfig applePayConfig)  $default,) {final _that = this;
switch (_that) {
case _ShopifyPaymentConfig():
return $default(_that.shopName,_that.countryCode,_that.productionMode,_that.paymentCardConfig,_that.googlePayConfig,_that.applePayConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String shopName,  String countryCode,  bool productionMode,  PaymentCardConfig paymentCardConfig,  GooglePayConfig googlePayConfig,  ApplePayConfig applePayConfig)?  $default,) {final _that = this;
switch (_that) {
case _ShopifyPaymentConfig() when $default != null:
return $default(_that.shopName,_that.countryCode,_that.productionMode,_that.paymentCardConfig,_that.googlePayConfig,_that.applePayConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopifyPaymentConfig extends ShopifyPaymentConfig with DiagnosticableTreeMixin {
  const _ShopifyPaymentConfig({this.shopName = '', this.countryCode = 'US', this.productionMode = false, this.paymentCardConfig = const PaymentCardConfig(), this.googlePayConfig = const GooglePayConfig(), this.applePayConfig = const ApplePayConfig()}): super._();
  factory _ShopifyPaymentConfig.fromJson(Map<String, dynamic> json) => _$ShopifyPaymentConfigFromJson(json);

@override@JsonKey() final  String shopName;
@override@JsonKey() final  String countryCode;
@override@JsonKey() final  bool productionMode;
@override@JsonKey() final  PaymentCardConfig paymentCardConfig;
@override@JsonKey() final  GooglePayConfig googlePayConfig;
@override@JsonKey() final  ApplePayConfig applePayConfig;

/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopifyPaymentConfigCopyWith<_ShopifyPaymentConfig> get copyWith => __$ShopifyPaymentConfigCopyWithImpl<_ShopifyPaymentConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopifyPaymentConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ShopifyPaymentConfig'))
    ..add(DiagnosticsProperty('shopName', shopName))..add(DiagnosticsProperty('countryCode', countryCode))..add(DiagnosticsProperty('productionMode', productionMode))..add(DiagnosticsProperty('paymentCardConfig', paymentCardConfig))..add(DiagnosticsProperty('googlePayConfig', googlePayConfig))..add(DiagnosticsProperty('applePayConfig', applePayConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopifyPaymentConfig&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.productionMode, productionMode) || other.productionMode == productionMode)&&(identical(other.paymentCardConfig, paymentCardConfig) || other.paymentCardConfig == paymentCardConfig)&&(identical(other.googlePayConfig, googlePayConfig) || other.googlePayConfig == googlePayConfig)&&(identical(other.applePayConfig, applePayConfig) || other.applePayConfig == applePayConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,countryCode,productionMode,paymentCardConfig,googlePayConfig,applePayConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ShopifyPaymentConfig(shopName: $shopName, countryCode: $countryCode, productionMode: $productionMode, paymentCardConfig: $paymentCardConfig, googlePayConfig: $googlePayConfig, applePayConfig: $applePayConfig)';
}


}

/// @nodoc
abstract mixin class _$ShopifyPaymentConfigCopyWith<$Res> implements $ShopifyPaymentConfigCopyWith<$Res> {
  factory _$ShopifyPaymentConfigCopyWith(_ShopifyPaymentConfig value, $Res Function(_ShopifyPaymentConfig) _then) = __$ShopifyPaymentConfigCopyWithImpl;
@override @useResult
$Res call({
 String shopName, String countryCode, bool productionMode, PaymentCardConfig paymentCardConfig, GooglePayConfig googlePayConfig, ApplePayConfig applePayConfig
});


@override $PaymentCardConfigCopyWith<$Res> get paymentCardConfig;@override $GooglePayConfigCopyWith<$Res> get googlePayConfig;@override $ApplePayConfigCopyWith<$Res> get applePayConfig;

}
/// @nodoc
class __$ShopifyPaymentConfigCopyWithImpl<$Res>
    implements _$ShopifyPaymentConfigCopyWith<$Res> {
  __$ShopifyPaymentConfigCopyWithImpl(this._self, this._then);

  final _ShopifyPaymentConfig _self;
  final $Res Function(_ShopifyPaymentConfig) _then;

/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopName = null,Object? countryCode = null,Object? productionMode = null,Object? paymentCardConfig = null,Object? googlePayConfig = null,Object? applePayConfig = null,}) {
  return _then(_ShopifyPaymentConfig(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,productionMode: null == productionMode ? _self.productionMode : productionMode // ignore: cast_nullable_to_non_nullable
as bool,paymentCardConfig: null == paymentCardConfig ? _self.paymentCardConfig : paymentCardConfig // ignore: cast_nullable_to_non_nullable
as PaymentCardConfig,googlePayConfig: null == googlePayConfig ? _self.googlePayConfig : googlePayConfig // ignore: cast_nullable_to_non_nullable
as GooglePayConfig,applePayConfig: null == applePayConfig ? _self.applePayConfig : applePayConfig // ignore: cast_nullable_to_non_nullable
as ApplePayConfig,
  ));
}

/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCardConfigCopyWith<$Res> get paymentCardConfig {
  
  return $PaymentCardConfigCopyWith<$Res>(_self.paymentCardConfig, (value) {
    return _then(_self.copyWith(paymentCardConfig: value));
  });
}/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GooglePayConfigCopyWith<$Res> get googlePayConfig {
  
  return $GooglePayConfigCopyWith<$Res>(_self.googlePayConfig, (value) {
    return _then(_self.copyWith(googlePayConfig: value));
  });
}/// Create a copy of ShopifyPaymentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplePayConfigCopyWith<$Res> get applePayConfig {
  
  return $ApplePayConfigCopyWith<$Res>(_self.applePayConfig, (value) {
    return _then(_self.copyWith(applePayConfig: value));
  });
}
}

// dart format on
