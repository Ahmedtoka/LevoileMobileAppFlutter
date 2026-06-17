import '../../../models/entities/wishlist_type.dart';

class WishListConfig {
  static const _defaultEmptyImage = 'assets/images/empty_wishlist.png';
  static const _defaultBoxFit = 'contain';

  final WishListType type;

  /// only support wishlist type "normal"
  final bool showCartButton;

  /// The image to show when the wishlist is empty.
  final String emptyImage;
  final String boxFit;

  WishListConfig({
    this.type = WishListType.normal,
    this.showCartButton = true,
    this.emptyImage = _defaultEmptyImage,
    this.boxFit = _defaultBoxFit,
  });

  factory WishListConfig.fromJson(Map json) {
    return WishListConfig(
      type: WishListType.fromString(json['type']),
      showCartButton: bool.tryParse(json['showCartButton'].toString()) ?? true,
      emptyImage: json['emptyImage']?.toString() ?? _defaultEmptyImage,
      boxFit: json['boxFit']?.toString() ?? _defaultBoxFit,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type.name;
    data['showCartButton'] = showCartButton;
    data['emptyImage'] = emptyImage;
    data['boxFit'] = boxFit;
    return data;
  }
}
