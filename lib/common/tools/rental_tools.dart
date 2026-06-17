import '../../models/rental/rental_cart_info.dart';

class RentalTools {
  const RentalTools._();

  /// Returns the per-unit rental price if available.
  static double? getPerUnitPrice(RentalCartInfo? rentalInfo) {
    final totalPrice = rentalInfo?.totalPrice;
    if (totalPrice == null) {
      return null;
    }

    final baseQuantity = rentalInfo?.quantity ?? 1;
    final divisor = baseQuantity > 0 ? baseQuantity : 1;
    return totalPrice / divisor;
  }

  /// Calculates the total amount for the provided cart quantity.
  static double? getCartTotal(RentalCartInfo? rentalInfo, int? cartQuantity) {
    final perUnit = getPerUnitPrice(rentalInfo);
    if (perUnit == null) {
      return null;
    }

    var normalizedQuantity = cartQuantity ?? 1;
    if (normalizedQuantity <= 0) {
      normalizedQuantity = 1;
    }
    return perUnit * normalizedQuantity;
  }
}
