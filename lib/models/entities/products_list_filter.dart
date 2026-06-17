class ProductsListFilter {
  final double? minPrice;
  final double? maxPrice;
  final int? page;
  final String? langCode;
  final String? orderBy;
  final String? order;
  final String? userId;
  final String? search;
  final bool? isSearch;
  final List? include;
  final String? listingLocationId;
  final Map<String, dynamic>? attributes;
  final bool? featured;
  final bool? onSale;

  ProductsListFilter({
    this.minPrice,
    this.maxPrice,
    this.page,
    this.langCode,
    this.orderBy,
    this.order,
    this.userId,
    this.search,
    this.listingLocationId,
    this.attributes,
    this.isSearch,
    this.include,
    this.featured,
    this.onSale,
  });

  Map<String, dynamic> toJson() {
    return {
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'page': page,
      'langCode': langCode,
      'orderBy': orderBy,
      'order': order,
      'userId': userId,
      'search': search,
      'listingLocationId': listingLocationId,
      'attributes': attributes,
      'isSearch': isSearch,
      'include': include,
      'featured': featured,
      'onSale': onSale,
    };
  }

  factory ProductsListFilter.fromJson(Map<String, dynamic> json) {
    return ProductsListFilter(
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      page: json['page'],
      langCode: json['langCode'],
      orderBy: json['orderBy'],
      order: json['order'],
      userId: json['userId'],
      search: json['search'],
      listingLocationId: json['listingLocationId'],
      attributes: json['attributes'],
      isSearch: json['isSearch'],
      include: json['include'],
      featured: json['featured'],
      onSale: json['onSale'],
    );
  }
}
