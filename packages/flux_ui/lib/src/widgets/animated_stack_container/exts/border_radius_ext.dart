import 'package:flutter/material.dart';

import '../exts/string_ext.dart';

extension BorderRadiusDirectionalExtension on BorderRadiusDirectional {
  static BorderRadiusDirectional fromJson(Map<String, dynamic> json) {
    return BorderRadiusDirectional.only(
      topStart: Radius.circular(
        json['topStart'].toString().tryParseDouble() ?? 0.0,
      ),
      topEnd: Radius.circular(
        json['topEnd'].toString().tryParseDouble() ?? 0.0,
      ),
      bottomStart: Radius.circular(
        json['bottomStart'].toString().tryParseDouble() ?? 0.0,
      ),
      bottomEnd: Radius.circular(
        json['bottomEnd'].toString().tryParseDouble() ?? 0.0,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topStart': topStart.x,
      'topEnd': topEnd.x,
      'bottomStart': bottomStart.x,
      'bottomEnd': bottomEnd.x,
    };
  }
}
