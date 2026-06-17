import 'package:freezed_annotation/freezed_annotation.dart';

class StringConverter implements JsonConverter<String, String?> {
  const StringConverter();

  @override
  String fromJson(String? json) => json ?? '';

  @override
  String toJson(String object) => object;
}
