// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentCardConfig _$PaymentCardConfigFromJson(Map<String, dynamic> json) =>
    _PaymentCardConfig(
      enable: json['enable'] as bool? ?? false,
      serverEndpoint: json['serverEndpoint'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentCardConfigToJson(_PaymentCardConfig instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'serverEndpoint': instance.serverEndpoint,
    };
