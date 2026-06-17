import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null) return null;

    return DateTime.tryParse(json);
  }

  @override
  String? toJson(DateTime? object) {
    return object?.toIso8601String();
  }
}
