import 'package:flutter/material.dart';

import 'package:flux_localization/flux_localization.dart';

enum MyOrderStatus {
  any('any'),
  pending('pending'),
  processing('processing'),
  onHold('on-hold'),
  completed('completed'),
  cancelled('cancelled'),
  refunded('refunded'),
  failed('failed');

  const MyOrderStatus(this.status);
  final String status;

  String getName(BuildContext context) {
    switch (this) {
      case pending:
        return S.of(context).pending;
      case processing:
        return S.of(context).processing;
      case onHold:
        return S.of(context).onHold;
      case completed:
        return S.of(context).completed;
      case cancelled:
        return S.of(context).cancelled;
      case refunded:
        return S.of(context).refunded;
      case failed:
        return S.of(context).failed;
      default:
        return S.of(context).all;
    }
  }
}
