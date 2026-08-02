import 'package:flux_ui/flux_ui.dart';

import '../../../common/config/models/age_restriction_config.dart';
import 'tab_bar_config.dart';
import 'tab_bar_floating_config.dart';
import 'tab_bar_indicator_config.dart';

var kDefaultTabBar = TabBarConfig(
  tabBarIndicator: TabBarIndicatorConfig(),
  tabBarFloating: TabBarFloatingConfig(),
);

final kDefaultAgeRestrictionConfig = AgeRestrictionConfig();

final kSmartEngagementBannerConfig = SmartEngagementBannerConfig();

class AppSetting {
  late String mainColor;
  late String fontFamily;
  late String fontHeader;
  late String productListLayout;
  late bool stickyHeader;
  late bool showChat;
  TabBarConfig tabBarConfig = kDefaultTabBar;
  Map productColors = {};

  /// Le Voile: maps a Shopify product TAG to the label shown on the product
  /// card ({"new": "New", "best-seller": "Bestseller"}). Kept as a raw map —
  /// like productColors above — so merchandising can add a badge from the
  /// dashboard without an app release. Read by LvProductBadges.
  Map productBadgeTags = {};

  /// Le Voile: the product-page reassurance strip
  /// ([{"icon": "delivery", "label": "Fast\nDelivery"}]). Raw list so the
  /// dashboard can add or reword an item without an app release. Read by
  /// LvTrustStrip.
  List productTrustItems = [];

  /// Le Voile: the search screen's empty state — headings, the trending chips,
  /// and a ready-built product block for "Popular Right Now". Kept as a raw
  /// Map so the dashboard can reword or restock it without an app release.
  /// Read by LvSearchIntro.
  Map lvSearch = {};
  double? ratioProductImage;
  String? copyright;
  late String? productDetail;
  late String? blogDetail;
  late bool? useMaterial3;
  AgeRestrictionConfig ageRestrictionConfig = kDefaultAgeRestrictionConfig;
  SmartEngagementBannerConfig smartEngagementBannerConfig =
      kSmartEngagementBannerConfig;

  String? aboutUS;
  String? privacy;
  String? fAQ;
  String? news;
  String? support;
  String? downloadApp;

  AppSetting({
    this.mainColor = '',
    this.fontFamily = 'Roboto',
    this.fontHeader = 'Raleway',
    this.productListLayout = 'list',
    this.stickyHeader = false,
    this.showChat = true,
    this.ratioProductImage,
    this.copyright,
    this.productDetail,
    this.blogDetail,
    this.useMaterial3,
    required this.tabBarConfig,
    required this.ageRestrictionConfig,
    required this.smartEngagementBannerConfig,
    this.aboutUS,
    this.privacy,
    this.fAQ,
    this.news,
    this.support,
    this.downloadApp,
    this.productColors = const {},
    this.productBadgeTags = const {},
    this.productTrustItems = const [],
    this.lvSearch = const {},
  });

  AppSetting.fromJson(Map config) {
    mainColor = config['MainColor'] ?? '';
    fontFamily = config['FontFamily'] ?? 'Roboto';
    fontHeader = config['FontHeader'] ?? 'Raleway';
    copyright = config['Copyright'];
    productListLayout = config['ProductListLayout'] ?? 'list';
    stickyHeader = config['StickyHeader'] ?? false;
    showChat = config['ShowChat'] ?? true;
    ratioProductImage = config['ratioProductImage'];
    productDetail = config['ProductDetail'];
    blogDetail = config['BlogDetail'];
    useMaterial3 = config['useMaterial3'] ?? false;

    ///
    aboutUS = config['AboutUS'];
    privacy = config['Privacy'];
    fAQ = config['FAQ'];
    news = config['News'];
    support = config['Support'];
    downloadApp = config['DownloadApp'];

    if (config['ProductColors'] != null && config['ProductColors'] is Map) {
      productColors = config['ProductColors'];
    }

    // Le Voile: product-card badge labels, keyed by Shopify tag. Without this
    // the field stays empty forever and LvProductBadges silently falls back to
    // its built-in defaults, so the dashboard setting does nothing.
    if (config['ProductBadgeTags'] != null && config['ProductBadgeTags'] is Map) {
      productBadgeTags = config['ProductBadgeTags'];
    }

    // Le Voile: product-page trust strip.
    if (config['ProductTrustItems'] is List) {
      productTrustItems = config['ProductTrustItems'];
    }

    // Le Voile: the search screen's empty state.
    if (config['LvSearch'] is Map) {
      lvSearch = config['LvSearch'];
    }

    if (config['TabBarConfig'] != null) {
      tabBarConfig = TabBarConfig.fromJson(config['TabBarConfig']);
    }

    if (config['AgeRestriction'] is Map) {
      ageRestrictionConfig = AgeRestrictionConfig.fromMap(
        config['AgeRestriction'],
      );
    }
    if (config['SmartEngagementBanner'] is Map) {
      smartEngagementBannerConfig = SmartEngagementBannerConfig.fromJson(
        config['SmartEngagementBanner'],
      );
    }
  }

  AppSetting copyWith({
    String? mainColor,
    String? fontFamily,
    String? fontHeader,
    String? productListLayout,
    bool? stickyHeader,
    bool? showChat,
    double? ratioProductImage,
    String? productDetail,
    String? blogDetail,
    String? copyright,
    TabBarConfig? tabBarConfig,
    Map? productColors,
    Map? productBadgeTags,
    List? productTrustItems,
    Map? lvSearch,
    bool? useMaterial3,
    AgeRestrictionConfig? ageRestrictionConfig,
    SmartEngagementBannerConfig? smartEngagementBannerConfig,
    String? aboutUS,
    String? privacy,
    String? fAQ,
    String? news,
    String? support,
    String? downloadApp,
  }) {
    return AppSetting(
      mainColor: mainColor ?? this.mainColor,
      fontFamily: fontFamily ?? this.fontFamily,
      fontHeader: fontHeader ?? this.fontHeader,
      productListLayout: productListLayout ?? this.productListLayout,
      stickyHeader: stickyHeader ?? this.stickyHeader,
      showChat: showChat ?? this.showChat,
      copyright: copyright ?? this.copyright,
      ratioProductImage: ratioProductImage ?? this.ratioProductImage,
      productDetail: productDetail ?? this.productDetail,
      blogDetail: blogDetail ?? this.blogDetail,
      tabBarConfig: tabBarConfig ?? this.tabBarConfig,
      productColors: productColors ?? this.productColors,
      productBadgeTags: productBadgeTags ?? this.productBadgeTags,
      productTrustItems: productTrustItems ?? this.productTrustItems,
      lvSearch: lvSearch ?? this.lvSearch,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      ageRestrictionConfig: ageRestrictionConfig ?? this.ageRestrictionConfig,
      smartEngagementBannerConfig:
          smartEngagementBannerConfig ?? this.smartEngagementBannerConfig,
      aboutUS: aboutUS ?? this.aboutUS,
      privacy: privacy ?? this.privacy,
      fAQ: fAQ ?? this.fAQ,
      news: news ?? this.news,
      support: support ?? this.support,
      downloadApp: downloadApp ?? this.downloadApp,
    );
  }
}
