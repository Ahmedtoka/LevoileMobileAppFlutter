import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';

import '../../../../../common/constants.dart';
import '../../../../../models/index.dart' show AppModel;

class CalendarWidget extends StatefulWidget {
  final BuildContext context;
  final DateTime selectedDateTime;
  final Function(DateTime, List<EventInterface>) onDayPressed;
  final int? limitDay;
  final bool hasRestrictedDays;
  final bool Function(DateTime)? isRestrictedDay;

  const CalendarWidget.booking(
    this.context, {
    super.key,
    required this.selectedDateTime,
    required this.onDayPressed,
    this.limitDay,
    this.hasRestrictedDays = false,
    this.isRestrictedDay,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime month = DateTime.now();

  String get langCode => context.watch<AppModel>().langCode;

  bool get canNext {
    final limitDay = widget.limitDay;
    if (limitDay == null) {
      return true;
    }
    final now = DateTime.now();
    final nextDate = DateTime(month.year, month.month + 1, 1);
    final maxDate = now.add(Duration(days: limitDay));
    return nextDate.compareTo(maxDate) <= 0;
  }

  bool get canPrev {
    final now = DateTime.now();
    return month.compareTo(now) >= 0;
  }

  int numCalRow() {
    final now = month;
    final start = DateTime(now.year, now.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);
    final day = start.weekday + daysInMonth;
    var row = day ~/ 7;
    if (row * 7 < day) {
      row++;
    }
    return row;
  }

  Widget? customDayBuilder(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle textStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime now,
  ) {
    if (!widget.hasRestrictedDays) {
      return null;
    }
    final isRestrictedDay = widget.isRestrictedDay?.call(now) ?? false;
    if (!isRestrictedDay) {
      return null;
    }
    return Center(
      child: Text(
        '${now.day}',
        style: textStyle.copyWith(
          color: Theme.of(context).unselectedWidgetColor.withValueOpacity(0.25),
        ),
      ),
    );
  }

  Widget renderCalendar({double? width}) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodySmall ?? const TextStyle();
    final onPrimaryColor = theme.colorScheme.secondary;
    final unselectedWidgetColor = theme.unselectedWidgetColor.withValueOpacity(
      0.25,
    );

    final rowCal = numCalRow();
    var heightCal = 340.0;
    if (rowCal > 5) {
      heightCal = 380.0;
    }
    return SizedBox(
      width: width,
      height: heightCal,
      child: CalendarCarousel(
        onDayPressed: (DateTime time, List<EventInterface> events) {
          widget.onDayPressed(time, events);
          if (time.month != month.month) {
            setState(() {
              month = time;
            });
          }
        },
        targetDateTime: month,
        customDayBuilder: customDayBuilder,
        headerText: DateFormat('MMMM yyyy').format(month),
        headerTitleTouchable: true,
        weekFormat: false,
        selectedDateTime: widget.selectedDateTime,
        showIconBehindDayText: true,
        daysHaveCircularBorder: false,
        customGridViewPhysics: const NeverScrollableScrollPhysics(),
        markedDateShowIcon: true,
        markedDateIconMaxShown: 2,
        onCalendarChanged: (time) {
          if (time.compareTo(month) == 0) return;
          setState(() {
            month = time;
          });
        },
        headerTextStyle: textStyle.copyWith(
          color: theme.colorScheme.secondary,
          fontSize: 18,
        ),
        leftButtonIcon: Icon(
          Icons.arrow_back,
          color: canPrev ? theme.iconTheme.color : unselectedWidgetColor,
        ),
        rightButtonIcon: Icon(
          Icons.arrow_forward,
          color: canNext ? theme.iconTheme.color : unselectedWidgetColor,
        ),
        minSelectedDate: DateTime.now().subtract(const Duration(days: 1)),
        maxSelectedDate: widget.limitDay != null
            ? DateTime.now().add(Duration(days: widget.limitDay!))
            : null,
        todayButtonColor: Colors.transparent,
        todayBorderColor: Colors.transparent,
        daysTextStyle: textStyle.copyWith(color: onPrimaryColor),
        weekdayTextStyle: textStyle.copyWith(color: onPrimaryColor),
        todayTextStyle: textStyle.copyWith(color: Colors.red),
        selectedDayTextStyle: textStyle.copyWith(
          color: theme.primaryColor.getColorBasedOnBackground,
        ),
        selectedDayBorderColor: Colors.transparent,
        selectedDayButtonColor: theme.primaryColor,
        weekendTextStyle: textStyle.copyWith(color: onPrimaryColor),
        firstDayOfWeek: 1,
        markedDateMoreShowTotal: true,
        inactiveDaysTextStyle: textStyle.copyWith(color: unselectedWidgetColor),
        inactiveWeekendTextStyle: textStyle.copyWith(
          color: unselectedWidgetColor,
        ),
        nextDaysTextStyle: textStyle.copyWith(color: unselectedWidgetColor),
        locale: langCode,
        height: heightCal,
        childAspectRatio: 1.2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // The displayed names of the days of the week are quite long in some languages
        // It's necessary to fit the screen, minimum width 380
        const minimumWidth = 380.0;
        final maxWidth = constraints.maxWidth;
        final largeNameLocales = ['ar', 'fa', 'ta'];
        if (maxWidth > minimumWidth || !largeNameLocales.contains(langCode)) {
          return renderCalendar();
        }
        return FittedBox(
          fit: BoxFit.fitWidth,
          child: renderCalendar(width: minimumWidth),
        );
      },
    );
  }
}
