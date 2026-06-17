import 'package:flutter/material.dart';

import '../data/boxes.dart';
import '../services/service_config.dart';
import 'mixins/language_mixin.dart';

class SearchModel extends ChangeNotifier with LanguageMixin {
  static const _searchPrefix = 'search_';
  static const _productKey = '${_searchPrefix}product';
  static const _listingKey = '${_searchPrefix}listing';

  SearchModel() {
    _getKeywords(true);
  }

  List<String> keywords = [];
  bool? _lastType;

  bool _getProductTypeValue(bool? productType) {
    final config = ServerConfig();
    if (config.isListingWoo) {
      return productType ?? false;
    }
    if (config.isListingType) {
      return false;
    }
    return true;
  }

  String _getKeyByPlatform(bool? productType) {
    final isProductType = _getProductTypeValue(productType);
    return isProductType ? _productKey : _listingKey;
  }

  void updateKeywords(String keyword, {bool? productType}) {
    if (keywords.contains(keyword)) {
      keywords.remove(keyword);
    }
    keywords.insert(0, keyword);
    _saveKeywords(keywords, productType);
    notifyListeners();
  }

  void clearKeywords({bool? productType}) {
    keywords = [];
    _saveKeywords(keywords, productType);
    notifyListeners();
  }

  void _saveKeywords(List<String> keywords, bool? productType) {
    final key = _getKeyByPlatform(productType);
    UserBox().box.put(key, keywords);
  }

  void _getKeywords(bool? productType) {
    if (_lastType == productType) return;

    final key = _getKeyByPlatform(productType);
    final isProductType = _getProductTypeValue(productType);

    keywords = List<String>.from(
      UserBox().box.get(key, defaultValue: <String>[]),
    );
    _lastType = isProductType;
  }

  List<String> getKeywordsByType(bool? productType) {
    _getKeywords(productType);
    return keywords;
  }
}
