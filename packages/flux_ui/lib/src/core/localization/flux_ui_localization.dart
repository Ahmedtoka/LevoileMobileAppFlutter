import 'package:flutter/material.dart';

abstract class FluxUILocalization {
  final BuildContext context;

  FluxUILocalization(this.context);
  bool isRTL(String languageCode);

  String get apply;

  String get selectStore;

  String get instantlyClose;

  String get dateWiseClose;

  String get seeAll;

  String endsIn(String time);
}
