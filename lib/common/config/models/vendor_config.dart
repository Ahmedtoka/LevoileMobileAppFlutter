const int _defaultCountVendor = 3;
const _defaultStoreBanner = 'assets/images/default-store-banner.png';
const _defaultStoreProfile = 'assets/images/default-store-profile.png';

class VendorConfig {
  final bool vendorRegister;
  final bool deliveryRegister;
  final bool ownerRegister;
  final bool disableVendorShipping;
  final bool showAllVendorMarkers;
  final bool disableNativeStoreManagement;
  final String dokan;
  final String wcfm;
  final bool disableMultiVendorCheckout;
  final bool disablePendingProduct;
  final String newProductStatus;
  final String defaultStoreBanner;
  final String defaultStoreProfile;
  final String? bannerFit;
  final String? profileFit;
  final bool expandStoreLocationByDefault;
  final bool disableNativeDeliveryManagement;
  final bool hideStoreContactInfo;
  final int gridCountVendor;
  final int columnCountVendor;
  final String vendorDashboardUrl;
  final String deliveryDashboardUrl;

  /// If [_showPopUpIfMultiVendorDetected] is true and
  /// [disableMultiVendorCheckout] is true, then will show a pop up if it
  /// detects user adding a product from a new vendor to cart
  final bool _showPopUpIfMultiVendorDetected;

  bool get showPopUpIfMultiVendorDetected =>
      _showPopUpIfMultiVendorDetected && disableMultiVendorCheckout;

  VendorConfig({
    this.vendorRegister = false,
    this.deliveryRegister = false,
    this.ownerRegister = false,
    this.disableVendorShipping = true,
    this.showAllVendorMarkers = true,
    this.disableNativeStoreManagement = true,
    this.dokan = '',
    this.wcfm = '',
    this.disableMultiVendorCheckout = false,
    this.disablePendingProduct = false,
    this.newProductStatus = 'draft',
    this.defaultStoreBanner = _defaultStoreBanner,
    this.defaultStoreProfile = _defaultStoreProfile,
    this.bannerFit,
    this.profileFit,
    this.expandStoreLocationByDefault = true,
    this.disableNativeDeliveryManagement = true,
    this.hideStoreContactInfo = false,
    this.gridCountVendor = _defaultCountVendor,
    this.columnCountVendor = _defaultCountVendor,
    this.vendorDashboardUrl = '',
    this.deliveryDashboardUrl = '',
    showPopUpIfMultiVendorDetected = false,
  }) : _showPopUpIfMultiVendorDetected = showPopUpIfMultiVendorDetected;

  bool get enableAutoApplicationApproval =>
      false; //Automatic account approval should be disabled due to a security vulnerability in the MStore API."

  factory VendorConfig.fromJson(Map json) {
    return VendorConfig(
      vendorRegister: json['VendorRegister'] == true,
      deliveryRegister: json['DeliveryRegister'] == true,
      ownerRegister: json['OwnerRegister'] == true,
      disableVendorShipping: json['DisableVendorShipping'] != false,
      showAllVendorMarkers: json['ShowAllVendorMarkers'] != false,
      disableNativeStoreManagement:
          json['DisableNativeStoreManagement'] != false,
      dokan: json['dokan']?.toString() ?? '',
      wcfm: json['wcfm']?.toString() ?? '',
      disableMultiVendorCheckout: json['DisableMultiVendorCheckout'] == true,
      disablePendingProduct: json['DisablePendingProduct'] == true,
      newProductStatus: json['NewProductStatus']?.toString() ?? 'draft',
      defaultStoreBanner:
          json['DefaultStoreImage'] ??
          json['DefaultStoreBanner'] ??
          _defaultStoreBanner,
      defaultStoreProfile: json['DefaultStoreProfile'] ?? _defaultStoreProfile,
      bannerFit: json['BannerFit'],
      profileFit: json['ProfileFit'],
      expandStoreLocationByDefault:
          json['ExpandStoreLocationByDefault'] != false,
      disableNativeDeliveryManagement:
          (json['DisableNativeDeliveryManagement'] ??
              json['DisableDeliveryManagement']) !=
          false,
      hideStoreContactInfo: json['HideStoreContactInfo'] ?? false,
      gridCountVendor: json['GridCountVendor'] ?? _defaultCountVendor,
      columnCountVendor: json['ColumnCountVendor'] ?? _defaultCountVendor,
      vendorDashboardUrl: json['VendorDashboardUrl'] ?? '',
      deliveryDashboardUrl: json['DeliveryDashboardUrl'] ?? '',
      showPopUpIfMultiVendorDetected:
          json['ShowPopUpIfMultiVendorDetected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['VendorRegister'] = vendorRegister;
    data['DeliveryRegister'] = deliveryRegister;
    data['OwnerRegister'] = ownerRegister;
    data['DisableVendorShipping'] = disableVendorShipping;
    data['ShowAllVendorMarkers'] = showAllVendorMarkers;
    data['DisableNativeStoreManagement'] = disableNativeStoreManagement;
    data['dokan'] = dokan;
    data['wcfm'] = wcfm;
    data['DisableMultiVendorCheckout'] = disableMultiVendorCheckout;
    data['DisablePendingProduct'] = disablePendingProduct;
    data['NewProductStatus'] = newProductStatus;
    data['DefaultStoreBanner'] = defaultStoreBanner;
    data['DefaultStoreProfile'] = defaultStoreProfile;
    data['BannerFit'] = bannerFit;
    data['ProfileFit'] = profileFit;
    data['ExpandStoreLocationByDefault'] = expandStoreLocationByDefault;
    data['DisableNativeDeliveryManagement'] = disableNativeDeliveryManagement;
    data['HideStoreContactInfo'] = hideStoreContactInfo;
    data['GridCountVendor'] = gridCountVendor;
    data['ColumnCountVendor'] = columnCountVendor;
    data['VendorDashboardUrl'] = vendorDashboardUrl;
    data['DeliveryDashboardUrl'] = deliveryDashboardUrl;
    data['ShowPopUpIfMultiVendorDetected'] = _showPopUpIfMultiVendorDetected;
    return data;
  }

  VendorConfig copyWith({
    bool? vendorRegister,
    bool? deliveryRegister,
    bool? ownerRegister,
    bool? disableVendorShipping,
    bool? showAllVendorMarkers,
    bool? disableNativeStoreManagement,
    String? dokan,
    String? wcfm,
    bool? disableMultiVendorCheckout,
    bool? disablePendingProduct,
    String? newProductStatus,
    String? defaultStoreBanner,
    String? defaultStoreProfile,
    String? bannerFit,
    String? profileFit,
    bool? expandStoreLocationByDefault,
    bool? disableNativeDeliveryManagement,
    bool? hideStoreContactInfo,
    int? gridCountVendor,
    int? columnCountVendor,
    String? vendorDashboardUrl,
    String? deliveryDashboardUrl,
    bool? showPopUpIfMultiVendorDetected,
  }) {
    return VendorConfig(
      vendorRegister: vendorRegister ?? this.vendorRegister,
      deliveryRegister: deliveryRegister ?? this.deliveryRegister,
      ownerRegister: ownerRegister ?? this.ownerRegister,
      disableVendorShipping:
          disableVendorShipping ?? this.disableVendorShipping,
      showAllVendorMarkers: showAllVendorMarkers ?? this.showAllVendorMarkers,
      disableNativeStoreManagement:
          disableNativeStoreManagement ?? this.disableNativeStoreManagement,
      dokan: dokan ?? this.dokan,
      wcfm: wcfm ?? this.wcfm,
      disableMultiVendorCheckout:
          disableMultiVendorCheckout ?? this.disableMultiVendorCheckout,
      disablePendingProduct:
          disablePendingProduct ?? this.disablePendingProduct,
      newProductStatus: newProductStatus ?? this.newProductStatus,
      defaultStoreBanner: defaultStoreBanner ?? this.defaultStoreBanner,
      defaultStoreProfile: defaultStoreProfile ?? this.defaultStoreProfile,
      bannerFit: bannerFit ?? this.bannerFit,
      profileFit: profileFit ?? this.profileFit,
      expandStoreLocationByDefault:
          expandStoreLocationByDefault ?? this.expandStoreLocationByDefault,
      disableNativeDeliveryManagement:
          disableNativeDeliveryManagement ??
          this.disableNativeDeliveryManagement,
      hideStoreContactInfo: hideStoreContactInfo ?? this.hideStoreContactInfo,
      gridCountVendor: gridCountVendor ?? this.gridCountVendor,
      columnCountVendor: columnCountVendor ?? this.columnCountVendor,
      vendorDashboardUrl: vendorDashboardUrl ?? this.vendorDashboardUrl,
      deliveryDashboardUrl: deliveryDashboardUrl ?? this.deliveryDashboardUrl,
      showPopUpIfMultiVendorDetected:
          showPopUpIfMultiVendorDetected ?? _showPopUpIfMultiVendorDetected,
    );
  }
}
