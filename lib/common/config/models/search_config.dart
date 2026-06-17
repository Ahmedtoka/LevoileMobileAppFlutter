enum AjaxSearchPlugin {
  /// ref: https://ajaxsearchpro.com/
  ajaxSearchPro,

  /// ref: https://wordpress.org/plugins/ajax-search-for-woocommerce/
  fiboSearch;

  static AjaxSearchPlugin fromString(String? plugin) {
    return AjaxSearchPlugin.values.firstWhere(
      (e) => e.name == plugin,
      orElse: () => AjaxSearchPlugin.fiboSearch,
    );
  }
}

class SearchConfig {
  final AjaxSearchConfig ajaxSearch;
  final bool enableSkuSearch;

  bool get isFiboSearchEnabled =>
      ajaxSearch.plugin == AjaxSearchPlugin.fiboSearch && ajaxSearch.enable;
  bool get isAjaxSearchProEnabled =>
      ajaxSearch.plugin == AjaxSearchPlugin.ajaxSearchPro && ajaxSearch.enable;

  const SearchConfig({
    this.ajaxSearch = const AjaxSearchConfig(),
    this.enableSkuSearch = false,
  });

  Map<String, dynamic> toJson() => {
    'ajaxSearch': ajaxSearch.toJson(),
    'enableSkuSearch': enableSkuSearch,
  };

  factory SearchConfig.fromJson(Map<dynamic, dynamic> json) {
    return SearchConfig(
      ajaxSearch: AjaxSearchConfig(
        enable: bool.tryParse('${json['ajaxSearch']?['enable']}') ?? false,
        plugin: AjaxSearchPlugin.fromString(
          json['ajaxSearch']?['plugin']?.toString(),
        ),
      ),
      enableSkuSearch: bool.tryParse('${json['enableSkuSearch']}') ?? false,
    );
  }

  factory SearchConfig.fromAdvanceConfigJson(Map<dynamic, dynamic> json) {
    return SearchConfig(
      ajaxSearch: AjaxSearchConfig(
        // Backward compatibility: enable Ajax search when AjaxSearchURL is set
        enable: json['AjaxSearchURL']?.toString().trim().isNotEmpty ?? false,
        plugin: AjaxSearchPlugin.ajaxSearchPro,
      ),
      enableSkuSearch: bool.tryParse('${json['EnableSkuSearch']}') ?? false,
    );
  }

  SearchConfig copyWith({AjaxSearchConfig? ajaxSearch, bool? enableSkuSearch}) {
    return SearchConfig(
      ajaxSearch: ajaxSearch ?? this.ajaxSearch,
      enableSkuSearch: enableSkuSearch ?? this.enableSkuSearch,
    );
  }
}

class AjaxSearchConfig {
  final bool enable;
  final AjaxSearchPlugin plugin;

  const AjaxSearchConfig({
    this.enable = false,
    this.plugin = AjaxSearchPlugin.fiboSearch,
  });

  Map<String, dynamic> toJson() => {'enable': enable, 'plugin': plugin.name};
}
