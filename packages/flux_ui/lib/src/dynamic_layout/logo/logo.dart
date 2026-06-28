import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/icons/icon_picker.dart' deferred as defer_icon;
import 'package:inspireui/inspireui.dart';

import '../../entities/logo_config.dart';
import '../../entities/multi_site.dart';
import '../../widgets/flux_image.dart';
import '../multi_site/multi_site_mixin.dart';

class LogoIcon extends StatelessWidget {
  final LogoConfig config;
  final Function onTap;
  final MenuIcon? menuIcon;
  final EdgeInsetsDirectional? padding;
  final bool showNumber;
  final int number;

  const LogoIcon({
    super.key,
    required this.config,
    required this.onTap,
    this.menuIcon,
    this.showNumber = false,
    this.number = 0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final boxSize = config.iconSize + config.iconSpreadRadius;
    Widget widget = Container(
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color:
            config.iconBackground ??
            Theme.of(
              context,
            ).colorScheme.surface.withValueOpacity(config.iconOpacity),
        borderRadius: BorderRadius.circular(config.iconRadius),
      ),
      child: menuIcon != null
          ? DeferredWidget(
              defer_icon.loadLibrary,
              () => Icon(
                defer_icon.iconPicker(
                  menuIcon!.name!,
                  menuIcon!.fontFamily ?? 'CupertinoIcons',
                ),
                color:
                    config.iconColor ??
                    Theme.of(
                      context,
                    ).colorScheme.secondary.withValueOpacity(0.9),
                size: config.iconSize,
              ),
            )
          : Icon(
              Icons.menu,
              color:
                  config.iconColor ??
                  Theme.of(context).colorScheme.secondary.withValueOpacity(0.9),
              size: config.iconSize,
            ),
    );
    if (showNumber) {
      final boxSizeWithNumber = boxSize + 6;
      widget = SizedBox(
        width: boxSizeWithNumber,
        height: boxSizeWithNumber,
        child: Stack(
          children: [
            Center(child: widget),
            if (number > 0)
              PositionedDirectional(
                end: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: Padding(padding: padding ?? EdgeInsets.zero, child: widget),
    );
  }
}

class MultiSiteArgument {
  final bool enableMultiSite;
  final String? multiSiteIcon;
  final MultiSiteConfig? multiSiteConfig;
  final List<MultiSiteConfig>? multiSiteConfigs;
  final Future<void> Function(MultiSiteConfig?) onSiteChanged;
  final Future<void> Function(String) onErrorChangeSite;

  MultiSiteArgument({
    required this.enableMultiSite,
    required this.multiSiteIcon,
    required this.multiSiteConfig,
    required this.multiSiteConfigs,
    required this.onSiteChanged,
    required this.onErrorChangeSite,
  });
}

class LogoWidget extends StatelessWidget with MultiSiteMixin {
  final Function() onSearch;
  final Function() onCheckout;
  final Function() onTapDrawerMenu;
  final Function() onTapNotifications;
  final String? logo;
  final LogoConfig config;
  final int totalCart;
  final int notificationCount;
  final MultiSiteArgument? multiSiteArgument;

  const LogoWidget({
    super.key,
    required this.config,
    required this.onSearch,
    required this.onCheckout,
    required this.onTapDrawerMenu,
    required this.onTapNotifications,
    this.logo,
    this.totalCart = 0,
    this.notificationCount = 0,
    this.multiSiteArgument,
  });

  Widget renderLogo() {
    final logoSize = config.logoSize;
    final image = config.image;

    if (image != null) {
      if (image.isURL) {
        return SizedBox(
          height: logoSize - 10,
          child: FluxImage(
            imageUrl: image,
            height: logoSize,
            fit: BoxFit.contain,
          ),
        );
      }
      return Image.asset(image, height: logoSize);
    }

    /// render from config to support dark/light theme
    if (logo != null) {
      return FluxImage(imageUrl: logo!, height: logoSize);
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final isEnableMultiSite = multiSiteArgument?.enableMultiSite ?? false;
    final showSwitcherSite = config.showSwitcherSite;

    final textConfig = config.textConfig;
    return Container(
      constraints: const BoxConstraints(minHeight: kToolbarHeight),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      color:
          config.color ??
          Theme.of(
            context,
          ).colorScheme.surface.withValueOpacity(config.opacity),
      child: Row(
        children: [
          if (config.showMenu ?? false)
            LogoIcon(
              menuIcon: config.menuIcon,
              onTap: onTapDrawerMenu,
              config: config,
            ),
          Expanded(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (config.showLogo) Center(child: renderLogo()),
                if (textConfig != null) ...[
                  if (config.showLogo) const SizedBox(width: 5),
                  Expanded(
                    child: Align(
                      alignment: textConfig.alignment,
                      child: Text(
                        textConfig.text,
                        style: TextStyle(
                          fontSize: textConfig.fontSize,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (config.showSearch)
            LogoIcon(
              menuIcon: config.searchIcon ?? MenuIcon(name: 'search'),
              onTap: onSearch,
              config: config,
            ),
          if (config.showBadgeCart)
            GestureDetector(
              onTap: onCheckout,
              behavior: HitTestBehavior.translucent,
              child: Container(
                margin: const EdgeInsetsDirectional.only(start: 8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  totalCart.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          if (config.showCart)
            LogoIcon(
              padding: const EdgeInsetsDirectional.only(start: 8),
              menuIcon: config.cartIcon ?? MenuIcon(name: 'bag'),
              onTap: onCheckout,
              config: config,
              showNumber: true,
              number: totalCart,
            ),
          if (config.showNotification)
            LogoIcon(
              padding: const EdgeInsetsDirectional.only(start: 8),
              menuIcon: config.notificationIcon ?? MenuIcon(name: 'bell'),
              onTap: onTapNotifications,
              config: config,
              showNumber: true,
              number: notificationCount,
            ),
          if (isEnableMultiSite && showSwitcherSite)
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: GestureDetector(
                  onTap: () => showMultiSiteSelection(
                    context,
                    config: multiSiteArgument!.multiSiteConfig,
                    multiSiteConfigs: multiSiteArgument!.multiSiteConfigs,
                    onChanged: multiSiteArgument!.onSiteChanged,
                    onError: multiSiteArgument!.onErrorChangeSite,
                  ),
                  child: multiSiteArgument!.multiSiteIcon?.isEmpty ?? true
                      ? const Icon(CupertinoIcons.globe)
                      : FluxImage(
                          imageUrl: multiSiteArgument!.multiSiteIcon!,
                          width: 25,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          if (!isEnableMultiSite &&
              !config.showSearch &&
              !config.showCart &&
              !config.showBadgeCart &&
              !config.showNotification)
            const Spacer(),
        ],
      ),
    );
  }
}
