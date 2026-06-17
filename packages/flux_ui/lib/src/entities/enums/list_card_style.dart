import 'package:collection/collection.dart';

enum ListCardStyle {
  subtitleHeading,
  titleHeading;

  factory ListCardStyle.fromString(String type) {
    return ListCardStyle.values.firstWhereOrNull((e) => e.name == type) ??
        ListCardStyle.subtitleHeading;
  }
}
