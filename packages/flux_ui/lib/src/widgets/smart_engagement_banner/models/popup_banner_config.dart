class PopupBannerConfig {
  final bool enable;
  final dynamic data;
  final bool alwaysShowUponOpen;
  final String? closePosition;
  final int updatedTime;
  final bool allowTapOutsideToClose;
  final double iconSize;

  const PopupBannerConfig({
    this.enable = false,
    this.data,
    this.alwaysShowUponOpen = true,
    this.closePosition = 'topRight',
    this.updatedTime = 0,
    this.allowTapOutsideToClose = false,
    this.iconSize = 24.0,
  });

  factory PopupBannerConfig.fromJson(Map<String, dynamic> json) =>
      PopupBannerConfig(
        enable: json['enable'] ?? false,
        data: json['data'] ?? {},
        alwaysShowUponOpen: json['alwaysShowUponOpen'] ?? true,
        closePosition: json['closePosition'] ?? 'topRight',
        updatedTime: json['updatedTime'] ?? 0,
        allowTapOutsideToClose: json['allowTapOutsideToClose'] ?? false,
        iconSize: num.tryParse('${json['iconSize']}')?.toDouble() ?? 24.0,
      );

  Map<String, dynamic> toJson() => {
    'enable': enable,
    'data': data,
    'alwaysShowUponOpen': alwaysShowUponOpen,
    'closePosition': closePosition,
    'updatedTime': updatedTime,
    'allowTapOutsideToClose': allowTapOutsideToClose,
    'iconSize': iconSize,
  };
}
