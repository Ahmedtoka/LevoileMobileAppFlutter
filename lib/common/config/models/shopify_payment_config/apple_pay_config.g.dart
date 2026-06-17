// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_pay_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplePayConfig _$ApplePayConfigFromJson(Map<String, dynamic> json) =>
    _ApplePayConfig(
      enable: json['enable'] as bool? ?? false,
      merchantId: json['merchantId'] as String? ?? '',
    );

Map<String, dynamic> _$ApplePayConfigToJson(_ApplePayConfig instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'merchantId': instance.merchantId,
    };
