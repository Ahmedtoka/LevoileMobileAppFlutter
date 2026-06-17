extension AnimatedStringNullableExtension on String? {
  double? tryParseDouble() {
    return num.tryParse(toString())?.toDouble();
  }

  int? tryParseInt() {
    return num.tryParse(toString())?.toInt();
  }

  bool? tryParseBool() {
    return bool.tryParse(toString());
  }
}

extension AnimatedStringExtension on String {
  double? tryParseDouble() {
    return num.tryParse(this)?.toDouble();
  }

  int? tryParseInt() {
    return num.tryParse(this)?.toInt();
  }

  bool? tryParseBool() {
    return bool.tryParse(this);
  }
}
