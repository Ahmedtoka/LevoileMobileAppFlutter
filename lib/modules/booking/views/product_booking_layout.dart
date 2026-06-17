import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../common/tools/flash.dart';
import '../../../models/booking/booking_model.dart';
import '../../../models/cart/cart_item_meta_data.dart';
import '../../../models/index.dart' show CartModel, Product;
import '../../../routes/flux_navigate.dart';
import '../../../screens/cart/cart_screen.dart';
import '../booking_constants.dart';
import 'booking_widget.dart';

class ProductBookingLayout extends StatefulWidget {
  final Product product;
  final Function(BookingModel bookingInfo)? onCallBack;

  const ProductBookingLayout({
    super.key,
    required this.product,
    this.onCallBack,
  });

  @override
  State<ProductBookingLayout> createState() => _ProductBookingLayoutState();
}

class _ProductBookingLayoutState extends State<ProductBookingLayout>
    with SingleTickerProviderStateMixin {
  var top = 0.0;

  void onBooking(
    BuildContext ct,
    BookingModel model, {
    bool requiredStaff = false,
  }) {
    if (model.isEmpty == false &&
        ((requiredStaff && (model.staffs?.isNotEmpty ?? false) ||
            (!requiredStaff)))) {
      widget.product.bookingInfo = model;
      if (widget.onCallBack != null) {
        widget.onCallBack!(widget.product.bookingInfo!);
        return;
      }
      addToCartForProductBooking(ct);
    }
  }

  void addToCartForProductBooking(BuildContext ct) async {
    final cartModel = context.read<CartModel>();
    var (success, message) = await cartModel.checkMultiVendorDetected(
      context,
      widget.product,
    );

    if (message.isNotEmpty) {
      unawaited(FlashHelper.errorMessage(context, message: message));
      return;
    }
    if (!success) {
      return;
    }

    (success, message) = await cartModel.addProductToCart(
      context: ct,
      product: widget.product,
      quantity: 1,
      cartItemMetaData: const CartItemMetaData(),
    );

    if (message.isNotEmpty) {
      unawaited(FlashHelper.errorMessage(context, message: message));
      return;
    }
    if (success) {
      final name = widget.product.name;
      unawaited(
        FluxNavigate.pushNamed(
          RouteList.cart,
          context: context,
          arguments: CartScreenArgument(isModal: true, isBuyNow: true),
        ),
      );
      unawaited(
        FlashHelper.message(
          ct,
          message: name != null
              ? S.of(context).productAddToCart(name)
              : S.of(context).addToCartSuccessfully,
          messageStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      );
    }
  }

  @override
  void dispose() {
    FlashHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlashHelper.init(context);
    return BookingWidget(
      product: widget.product,
      requiredStaff: BookingConstants.requiredStaff,
      onBooking: (model) {
        onBooking(
          context,
          model,
          requiredStaff: BookingConstants.requiredStaff,
        );
      },
    );
  }
}
