import 'rental_date_selection.dart';

class RentalCartInfo {
  const RentalCartInfo({this.selection, this.totalPrice, this.quantity});

  final RentalDateSelection? selection;
  final double? totalPrice;
  final int? quantity;

  RentalCartInfo copyWith({
    RentalDateSelection? selection,
    double? totalPrice,
    int? quantity,
  }) {
    return RentalCartInfo(
      selection: selection ?? this.selection,
      totalPrice: totalPrice ?? this.totalPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() => {
    'selection': selection?.toJson(),
    'totalPrice': totalPrice,
    'quantity': quantity,
  };

  factory RentalCartInfo.fromJson(Map<String, dynamic> json) {
    return RentalCartInfo(
      selection: RentalDateSelection.fromJson(json['selection']),
      totalPrice: json['totalPrice'] != null
          ? double.tryParse('${json['totalPrice']}')
          : null,
      quantity: json['quantity'] != null
          ? int.tryParse('${json['quantity']}')
          : null,
    );
  }

  static RentalCartInfo? fromCartJson(Map json) {
    final raw = json['rentalInfo'];
    if (raw is Map<String, dynamic>) {
      return RentalCartInfo.fromJson(raw);
    }

    final selection = RentalDateSelection.fromJson(json['rentalDateSelection']);
    final totalPrice = json['rentalTotalPrice'] != null
        ? double.tryParse('${json['rentalTotalPrice']}')
        : null;
    final quantity = json['rentalQuantity'] != null
        ? int.tryParse('${json['rentalQuantity']}')
        : null;

    if (selection == null && totalPrice == null && quantity == null) {
      return null;
    }

    return RentalCartInfo(
      selection: selection,
      totalPrice: totalPrice,
      quantity: quantity,
    );
  }
}
