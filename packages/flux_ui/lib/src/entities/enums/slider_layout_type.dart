import 'package:collection/collection.dart';

enum SliderLayoutType {
  contentEndCard,
  contentBetweenCard;

  factory SliderLayoutType.fromString(String type) {
    return SliderLayoutType.values.firstWhereOrNull((e) => e.name == type) ??
        SliderLayoutType.contentEndCard;
  }
}
