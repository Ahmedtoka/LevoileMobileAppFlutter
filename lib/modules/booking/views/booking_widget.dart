import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../models/booking/booking_model.dart';
import '../../../models/booking/staff_booking_model.dart';
import '../../../models/index.dart' show Product;
import '../../../services/services.dart';
import '../booking_constants.dart';
import '../viewmodel/booking_model_change_notifier.dart';
import '../viewmodel/booking_value_nofifier.dart';
import 'widgets/calendar/calendar.dart';
import 'widgets/choose_staff.dart';
import 'widgets/choose_time/choose_time_widget.dart';

class BookingWidget extends StatefulWidget {
  final Function(BookingModel)? onBooking;
  final Product product;
  final bool requiredStaff;

  const BookingWidget({
    super.key,
    required this.product,
    this.onBooking,
    this.requiredStaff = false,
  });

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  BookingNotifier bookingNotifier = BookingNotifier();
  late BookingChangeNotifier bookingChangeNotifier;
  List<StaffBookingModel> get staffs => bookingNotifier.staffs ?? [];

  @override
  void initState() {
    super.initState();
    bookingChangeNotifier = BookingChangeNotifier(idProduct: widget.product.id);
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) {
        init();
      }
    });
  }

  Future<void> init() async {
    bookingChangeNotifier.initRestrictedDays(
      hasRestrictedDays: widget.product.hasRestrictedDays,
      restrictedDays: widget.product.restrictedDays,
    );
    await bookingNotifier.init(
      widget.product.id,
      hasStaff: widget.product.hasStaff ?? true,
    );
    if (staffs.isNotEmpty) {
      bookingChangeNotifier.setStaff(staffs.first);
    }
  }

  @override
  void dispose() {
    bookingNotifier.dispose();
    super.dispose();
  }

  Widget _renderSlotTime() {
    final value = bookingNotifier.value;
    if (value.isLoadingSlot) {
      return SizedBox(
        height: 260,
        child: Center(child: kLoadingWidget(context)),
      );
    }
    return Selector<BookingChangeNotifier, DateTime?>(
      selector: (context, model) => model.timeStart,
      builder: (context, hour, _) {
        final slots = value.listSlotSelect?.map(DateTime.parse).toList() ?? [];
        return ChooseTimeWidget(
          initValue: hour,
          listSlotTime: slots,
          selectDate: bookingChangeNotifier.current,
          onChooseTime: (value) {
            bookingChangeNotifier.setHour(value);
          },
        );
      },
    );
  }

  Widget _renderBookingError() {
    return Selector<BookingChangeNotifier, bool>(
      selector: (context, model) => model.canBooking,
      builder: (_, canBooking, __) {
        if (canBooking) return const SizedBox();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 20, color: Theme.of(context).unselectedWidgetColor),
            Text(
              S.of(context).appointmentStartInvalidDay,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).unselectedWidgetColor,
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product.inStock ?? false) {
      return ChangeNotifierProvider<BookingChangeNotifier>.value(
        value: bookingChangeNotifier,
        child: ValueListenableBuilder(
          valueListenable: bookingNotifier,
          builder: (context, value, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Services().widget.getProductAddonsWidget(
                  product: widget.product,
                  isProductInfoLoading: false,
                  appointmentWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChooseStaff(
                        staffs: value.staffs ?? [],
                        onChanged: (value) {
                          bookingNotifier.updateSlot.call(
                            bookingChangeNotifier.current,
                            value?.id,
                          );
                          bookingChangeNotifier.setStaff.call(value);
                        },
                      ),
                      CalendarWidget.booking(
                        context,
                        key: const ValueKey(
                          BookingConstants.keyBookingChangeDate,
                        ),
                        selectedDateTime: bookingChangeNotifier.current,
                        onDayPressed: (DateTime date, events) {
                          bookingChangeNotifier.setDay(date);
                          bookingNotifier.updateSlot(
                            date,
                            bookingChangeNotifier.staff?.id,
                          );
                        },
                        limitDay: kProductDetail.limitDayBooking,
                        hasRestrictedDays:
                            bookingChangeNotifier.hasRestrictedDays,
                        isRestrictedDay: bookingChangeNotifier.isRestrictedDay,
                      ),
                      Divider(
                        height: 20,
                        color: Theme.of(context).unselectedWidgetColor,
                      ),
                      _renderSlotTime(),
                      _renderBookingError(),
                    ],
                  ),
                ),
                Consumer<BookingChangeNotifier>(
                  builder: (_, value, __) {
                    final hide =
                        value.isEmpty ||
                        (widget.requiredStaff && value.staff == null) ||
                        !value.canBooking;
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0.1,
                      ),
                      key: const ValueKey(BookingConstants.keyBookingNow),
                      onPressed: hide
                          ? null
                          : () => widget.onBooking?.call(
                              bookingChangeNotifier.toBookingModel(),
                            ),
                      child: Text(S.of(context).bookingNow),
                    );
                  },
                ),
              ],
            );
          },
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          S.of(context).outOfStock,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: const Color(0xFFe74c3c),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
  }
}
