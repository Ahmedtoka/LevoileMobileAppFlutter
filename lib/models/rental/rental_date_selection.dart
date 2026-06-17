import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RentalDateSelection {
  RentalDateSelection({required this.start, required this.end})
    : assert(
        !end.isBefore(start),
        'End date must be on or after the start date',
      );

  final DateTime start;
  final DateTime end;

  DateTimeRange toRange() => DateTimeRange(start: start, end: end);

  String format(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final dateFormat = DateFormat.yMMMd(locale);

    if (DateUtils.isSameDay(start, end)) {
      return dateFormat.format(start);
    }

    return '${dateFormat.format(start)} – ${dateFormat.format(end)}';
  }

  Map<String, dynamic> toJson() => {
    'start': start.toIso8601String(),
    'end': end.toIso8601String(),
  };

  static RentalDateSelection? fromJson(dynamic value) {
    if (value is Map<String, dynamic>) {
      final start = DateTime.tryParse('${value['start']}');
      final end = DateTime.tryParse('${value['end']}');
      if (start != null && end != null) {
        return RentalDateSelection(start: start, end: end);
      }
    }
    return null;
  }
}
