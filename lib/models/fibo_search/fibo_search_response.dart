import '../entities/category.dart';
import '../entities/product.dart';
import '../entities/tag.dart';

class FiboSearchResponse {
  final List<Category> categories;
  final List<Tag> tags;
  final List<Product> products;
  String? searchQuery;
  String? errorMessage;

  FiboSearchResponse({
    this.categories = const [],
    this.tags = const [],
    this.products = const [],
    this.searchQuery,
    this.errorMessage,
  });

  factory FiboSearchResponse.fromJson(Map<String, dynamic> json) {
    return FiboSearchResponse(
      categories:
          (json['categories'] as List?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
      tags: (json['tags'] as List?)?.map((e) => Tag.fromJson(e)).toList() ?? [],
      products:
          (json['products'] as List?)
              ?.map((e) => Product.jsonParser(e))
              .toList() ??
          [],
    );
  }
}
