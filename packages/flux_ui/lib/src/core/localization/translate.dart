import 'package:intl/intl.dart';

import 'flux_ui_localization.dart';

class FluxUiImplementationLocalization extends FluxUILocalization {
  FluxUiImplementationLocalization(super.context);

  @override
  String get apply => 'Apply';

  @override
  String get selectStore => 'Select Store';

  @override
  String get instantlyClose => 'Instantly Close';

  @override
  String get dateWiseClose => 'Date Wise Close';

  @override
  bool isRTL(String languageCode) {
    return Bidi.isRtlLanguage(languageCode);
  }

  @override
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get seeAll => 'See All';
}
