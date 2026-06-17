import 'package:flutter/material.dart';

import '../booking.dart';

class BookingChangeNotifier extends BookingModel with ChangeNotifier {
  bool _hasRestrictedDays = false;
  List<String>? _restrictedDays;

  BookingChangeNotifier({super.idProduct}) {
    final currentDate = DateTime.now();
    setDay(currentDate);
  }

  void initRestrictedDays({
    bool? hasRestrictedDays,
    List<String>? restrictedDays,
  }) {
    _hasRestrictedDays = hasRestrictedDays ?? false;
    _restrictedDays = restrictedDays;
    var currentTime = current;
    if (_hasRestrictedDays) {
      var count = 0;
      while (isRestrictedDay(currentTime) && count < 7) {
        count++;
        currentTime = currentTime.add(const Duration(days: 1));
      }
      super.setDay(currentTime);
    }
    notifyListeners();
  }

  DateTime get current {
    var date = DateTime.now();
    return DateTime(
      year ?? date.year,
      month ?? date.month,
      day ?? date.day,
      timeStart?.hour ?? date.hour,
    );
  }

  StaffBookingModel? get staff =>
      (staffs?.isNotEmpty ?? false) ? staffs?.first : null;

  bool get hasRestrictedDays => _hasRestrictedDays;

  bool get canBooking {
    if (_hasRestrictedDays && (_restrictedDays?.isEmpty ?? true)) {
      return false;
    }
    return true;
  }

  bool isRestrictedDay(DateTime date) {
    // The days are not restricted
    final days = _restrictedDays ?? [];
    if (days.isEmpty) {
      return false;
    }
    // [0->6] Sunday -> Saturday
    final weekday = date.weekday % 7;
    return !days.contains(weekday.toString());
  }

  @override
  void setDay(DateTime date) {
    super.setDay(date);
    notifyListeners();
  }

  @override
  void setHour(DateTime time) {
    super.setHour(time);
    notifyListeners();
  }

  void setStaff(StaffBookingModel? staff) {
    if (staff == null) {
      return;
    }
    staffs = [];
    staffs?.add(staff);
    notifyListeners();
  }

  BookingModel toBookingModel() {
    var value = toJson();
    return BookingModel.fromLocalJson(value);
  }
}
