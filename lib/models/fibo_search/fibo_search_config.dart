class FiboSearchConfig {
  final int minChars; //
  final String searchPlaceholder;
  final int limitChars;
  final String searchNoResultsText;
  final bool showProductImage;
  final bool showProductPrice;
  final bool showProductDesc;
  final bool showProductSku;
  final String searchSeeAllResultsText;
  final bool showMatchingCategories;
  final bool showMatchingTags;
  final bool showCategoriesImages;
  final bool searchInProductDescription;
  final bool searchInProductShortDescription;
  final bool searchInProductSku;
  final bool excludeOutOfStockProducts;

  FiboSearchConfig({
    this.minChars = 3,
    this.searchPlaceholder = 'Search for products...',
    this.limitChars = 9,
    this.searchNoResultsText = 'No results',
    this.showProductImage = true,
    this.showProductPrice = true,
    this.showProductDesc = true,
    this.showProductSku = true,
    this.searchSeeAllResultsText = 'See all products...',
    this.showMatchingCategories = true,
    this.showMatchingTags = false,
    this.showCategoriesImages = false,
    this.searchInProductDescription = true,
    this.searchInProductShortDescription = false,
    this.searchInProductSku = true,
    this.excludeOutOfStockProducts = false,
  });

  factory FiboSearchConfig.fromJson(Map<String, dynamic> json) {
    final settings = json['settings'] as Map<String, dynamic>;
    return FiboSearchConfig(
      minChars: settings['min_chars'] as int? ?? 3,
      searchPlaceholder:
          settings['search_placeholder'] as String? ?? 'Search for products...',
      limitChars: settings['limit_chars'] as int? ?? 9,
      searchNoResultsText:
          settings['search_no_results_text'] as String? ?? 'No results',
      showProductImage: settings['show_product_image'] as bool? ?? true,
      showProductPrice: settings['show_product_price'] as bool? ?? true,
      showProductDesc: settings['show_product_desc'] as bool? ?? true,
      showProductSku: settings['show_product_sku'] as bool? ?? true,
      searchSeeAllResultsText:
          settings['search_see_all_results_text'] as String? ??
          'See all products...',
      showMatchingCategories:
          settings['show_matching_categories'] as bool? ?? true,
      showMatchingTags: settings['show_matching_tags'] as bool? ?? false,
      showCategoriesImages:
          settings['show_categories_images'] as bool? ?? false,
      searchInProductDescription:
          settings['search_in_product_description'] as bool? ?? true,
      searchInProductShortDescription:
          settings['search_in_product_short_description'] as bool? ?? false,
      searchInProductSku: settings['search_in_product_sku'] as bool? ?? true,
      excludeOutOfStockProducts:
          settings['exclude_out_of_stock_products'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'settings': {
        'min_chars': minChars,
        'search_placeholder': searchPlaceholder,
        'limit_chars': limitChars,
        'search_no_results_text': searchNoResultsText,
        'show_product_image': showProductImage,
        'show_product_price': showProductPrice,
        'show_product_desc': showProductDesc,
        'show_product_sku': showProductSku,
        'search_see_all_results_text': searchSeeAllResultsText,
        'show_matching_categories': showMatchingCategories,
        'show_matching_tags': showMatchingTags,
        'show_categories_images': showCategoriesImages,
        'search_in_product_description': searchInProductDescription,
        'search_in_product_short_description': searchInProductShortDescription,
        'search_in_product_sku': searchInProductSku,
        'exclude_out_of_stock_products': excludeOutOfStockProducts,
      },
    };
  }
}
