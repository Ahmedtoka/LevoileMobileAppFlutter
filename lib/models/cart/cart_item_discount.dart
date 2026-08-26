/// Le Voile: one cart row's share of an applied discount.
///
/// The cart used to answer "how much came off?" with a single number at the
/// bottom of the screen — "Coupon code applied successfully - 253.00LE" — and
/// left every row showing its full price. A customer looking at four pieces
/// could not tell which one the 253 came off, nor what any single piece
/// actually costs them now. This carries both halves of that answer for one
/// row, so the row can print the before price, the after price, and the gap
/// between them without recomputing anything itself.
///
/// All three amounts are LINE totals in the SHOP's currency (quantity already
/// multiplied in, no display-currency conversion yet), because that is the
/// shape Shopify reports a discount in. Dividing back down to a per-unit
/// price is the widget's job, and only it knows the quantity it is drawing.
class CartItemDiscount {
  const CartItemDiscount({
    required this.subtotal,
    required this.amount,
    this.label,
  });

  /// What this row is worth at full price.
  final double subtotal;

  /// How much of the discount landed on this row.
  final double amount;

  /// The name of the discount — the coupon code the customer typed, or the
  /// campaign title of an automatic one. Null when Shopify does not name it.
  final String? label;

  /// What this row actually costs after the discount.
  ///
  /// Clamped at zero: a discount can take a row to free, never past it into
  /// money owed back.
  double get total => subtotal - amount > 0 ? subtotal - amount : 0;
}
