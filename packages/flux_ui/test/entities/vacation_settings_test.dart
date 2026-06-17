import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';

void main() {
  group('VacationSettings', () {
    test('Default values', () {
      final settings = VacationSettings();

      expect(settings.vacationMode, false);
      expect(settings.disableVacationPurchase, false);
      expect(settings.vacationOption, VacationOption.instant);
      expect(settings.startDate, isNull);
      expect(settings.endDate, isNull);
      expect(settings.message, '');
    });

    test('fromJson', () {
      final json = {
        'wcfm_vacation_mode': 'yes',
        'wcfm_disable_vacation_purchase': 'no',
        'wcfm_vacation_mode_type': 'date_wise',
        'wcfm_vacation_start_date': '2022-12-31',
        'wcfm_vacation_end_date': '2023-01-01',
        'wcfm_vacation_mode_msg': 'Vacation message',
      };

      final settings = VacationSettings.fromJson(json);

      expect(settings.vacationMode, true);
      expect(settings.disableVacationPurchase, false);
      expect(settings.vacationOption, VacationOption.dateWise);
      expect(settings.startDate, DateTime(2022, 12, 31));
      expect(settings.endDate, DateTime(2023, 1, 1));
      expect(settings.message, 'Vacation message');
    });

    test('toJson', () {
      final settings = VacationSettings();
      settings.vacationMode = true;
      settings.disableVacationPurchase = true;
      settings.vacationOption = VacationOption.dateWise;
      settings.startDate = DateTime(2022, 12, 31);
      settings.endDate = DateTime(2023, 1, 1);
      settings.message = 'Vacation message';

      final json = settings.toJson();

      expect(json['wcfm_vacation_mode'], 'yes');
      expect(json['wcfm_disable_vacation_purchase'], 'yes');
      expect(json['wcfm_vacation_mode_type'], 'date_wise');
      expect(json['wcfm_vacation_start_date'], '2022-12-31');
      expect(json['wcfm_vacation_end_date'], '2023-01-01');
      expect(json['wcfm_vacation_mode_msg'], 'Vacation message');
    });

    test('isOpen', () {
      final settings = VacationSettings();
      settings.vacationMode = true;
      settings.vacationOption = VacationOption.instant;

      expect(settings.isOpen(), false);

      settings.vacationOption = VacationOption.dateWise;
      settings.startDate = DateTime(2022, 12, 31);
      settings.endDate = DateTime(2023, 1, 1);

      expect(settings.isOpen(), true);
    });
  });
}
