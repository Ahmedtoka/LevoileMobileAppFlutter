// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_pay_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GooglePayConfig _$GooglePayConfigFromJson(Map<String, dynamic> json) =>
    _GooglePayConfig(
      enable: json['enable'] as bool? ?? false,
      stripePublishableKey: json['stripePublishableKey'] as String? ?? '',
      merchantId: json['merchantId'] as String? ?? '',
    );

Map<String, dynamic> _$GooglePayConfigToJson(_GooglePayConfig instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'stripePublishableKey': instance.stripePublishableKey,
      'merchantId': instance.merchantId,
    };
