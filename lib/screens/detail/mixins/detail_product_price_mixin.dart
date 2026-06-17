import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiver/strings.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/app_model.dart';
import '../../../models/entities/product.dart';
import '../../../models/entities/product_variation.dart';
import '../../../models/product_model.dart';
import '../../../models/product_variant_model.dart';

mixin DetailProductPriceMixin<T extends StatefulWidget> on State<T> {
  String? _price;
  int? _dateOnSaleTo;
  String? _regularPrice;
  ProductVariation? _productVariation;

  bool _onSale = false;
  int _sale = 100;
  bool _isSaleOff = false;
  bool _isShowCountDown = false;
  int _countDown = 0;

  Product? get productData;
  AppModel get _appModel => Provider.of<AppModel>(context, listen: false);
  void onUpdateVariant() {}

  StreamSubscription? _eventBusSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) _getProductPrice();
    });

    if (kProductDetail.showSelectedImageVariant) {
      _eventBusSubscription = eventBus
          .on<EventChangeSelectedVariation>()
          .listen((event) {
            if (!mounted) {
              return;
            }
            onUpdateVariant();
          });
    }
  }

  @override
  void dispose() {
    _eventBusSubscription?.cancel();
    super.dispose();
  }

  DetailProductPriceStateUI calculatorPrice() {
    if (productData != null) {
      _productVariation = Provider.of<ProductModel>(
        context,
        listen: false,
      ).selectedVariation;
      _getProductPrice();

      _dateOnSaleTo = DateTime.tryParse(
        _productVariation?.dateOnSaleTo ?? productData!.dateOnSaleTo ?? '',
      )?.millisecondsSinceEpoch;
      _countDown = (_dateOnSaleTo ?? 0) - DateTime.now().millisecondsSinceEpoch;
      _isShowCountDown =
          kSaleOffProduct.showCountDown &&
          _dateOnSaleTo != null &&
          _countDown > 0;

      _isSaleOff =
          (_onSale &&
              productData!.type != 'grouped' &&
              productData!.type != 'variable') ||
          (_onSale &&
              productData!.isVariableProduct &&
              _productVariation != null);
    }

    return DetailProductPriceStateUI(
      product: productData,
      countDown: _countDown,
      currency: _appModel.currency,
      currencyRate: _appModel.currencyRate,
      dateOnSaleTo: _dateOnSaleTo,
      isSaleOff: _isSaleOff,
      isShowCountDown: _isShowCountDown,
      productVariation: _productVariation,
      regularPrice: _regularPrice,
      sale: _sale,
      price: _price,
    );
  }

  void _getProductPrice() {
    try {
      var selectedTiredPrice = Provider.of<ProductVariantModel>(
        context,
        listen: false,
      ).selectedTiredPrice;
      if (selectedTiredPrice != null) {
        _regularPrice = selectedTiredPrice.price.toString();
        _price = _regularPrice;
        _onSale = false;
        return;
      }

      if (productData?.isGiftCardProduct == true &&
          (productData?.giftCardAmounts?.isNotEmpty ?? false)) {
        _regularPrice = productData?.giftCardAmounts?.first;
        _price = _regularPrice;
        _onSale = false;
        return;
      }
      _regularPrice = _productVariation != null
          ? _productVariation!.regularPrice
          : productData!.regularPrice;
      _onSale = _productVariation != null
          ? _productVariation!.onSale ?? false
          : productData!.onSale ?? false;
      _price =
          _productVariation != null &&
              (_productVariation?.price?.isNotEmpty ?? false)
          ? _productVariation!.price
          : isNotBlank(productData!.price)
          ? productData!.price
          : productData!.regularPrice;

      /// update the Sale price
      if (_onSale) {
        _price =
            _productVariation != null &&
                (_productVariation?.salePrice?.isNotEmpty ?? false)
            ? _productVariation!.salePrice
            : isNotBlank(productData!.salePrice)
            ? productData!.salePrice
            : productData!.price;
        // _dateOnSaleTo = _productVariation != null
        //     ? _productVariation!.dateOnSaleTo
        //     : productData!.dateOnSaleTo;
      }

      if (_onSale &&
          _price?.isNotEmpty == true &&
          _regularPrice?.isNotEmpty == true) {
        final regularPrice = double.tryParse('$_regularPrice') ?? 0;
        final price = double.tryParse('$_price') ?? 0;
        if (regularPrice > 0 && price >= 0) {
          _sale = (100 - (price / regularPrice) * 100).toInt();
        }
      }
    } catch (e, trace) {
      printError(e, trace);
    }
  }
}

class DetailProductPriceStateUI {
  final Product? product;
  final bool isSaleOff;
  final bool isShowCountDown;
  final ProductVariation? productVariation;
  final int? dateOnSaleTo;
  final int countDown;
  final int sale;
  final dynamic regularPrice;
  final Map<String, dynamic> currencyRate;
  final String? currency;
  final String? price;

  DetailProductPriceStateUI({
    required this.product,
    required this.isSaleOff,
    required this.isShowCountDown,
    required this.productVariation,
    required this.dateOnSaleTo,
    required this.countDown,
    required this.sale,
    required this.regularPrice,
    required this.currencyRate,
    required this.currency,
    required this.price,
  });
}
