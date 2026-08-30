import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/icons/icon_picker.dart';
import 'package:provider/provider.dart';

import '../common/config.dart';
import '../common/config/models/index.dart';
import '../common/constants.dart';
import '../common/tools.dart';
import '../models/index.dart'
    show AppModel, BackDropArguments, Category, CategoryModel, UserModel;
import '../modules/dynamic_layout/config/app_config.dart';
import '../modules/dynamic_layout/helper/helper.dart';
import '../routes/flux_navigate.dart';
import '../services/index.dart';
import '../screens/custom/contact_screen.dart';
import '../screens/custom/policy_screen.dart';
import '../screens/custom/about_screen.dart';
import '../screens/custom/my_coupons_screen.dart';
import '../screens/custom/outfits_screen.dart';
import '../screens/custom/store_locator_screen.dart';
import '../widgets/common/index.dart' show WebView;
import '../widgets/general/index.dart';
import 'maintab_delegate.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu();

  @override
  MenuBarState createState() => MenuBarState();
}

class MenuBarState extends State<SideBarMenu> {
  bool get isEcommercePlatform =>
      !ServerConfig().isListingType || !ServerConfig().isWordPress;

  DrawerMenuConfig get drawer =>
      Provider.of<AppModel>(context, listen: false).appConfig?.drawer ??
      kDefaultDrawer;

  Color get backgroundColor =>
      drawer.backgroundColor.toColor() ?? Theme.of(context).colorScheme.surface;

  Color get textColor {
    return drawer.textColor.toColor() ??
        backgroundColor.getColorBasedOnBackground;
  }

  Color get iconColor {
    return drawer.iconColor.toColor() ??
        backgroundColor.getColorBasedOnBackground;
  }

  TextStyle get textStyle => TextStyle(color: textColor);

  void pushNavigator({String? name, Widget? screen}) {
    eventBus.fire(const EventCloseNativeDrawer());
    if (name?.isNotEmpty ?? false) {
      MainTabControlDelegate.getInstance().changeTab(
        name?.replaceFirst('/', ''),
      );
      return;
    }
    if (screen != null) {
      // Push onto the active tab's nested navigator so the bottom tab bar
      // (Home / Branches / Cart) stays visible — same behaviour as opening a
      // page from inside My Account. Falls back to the root navigator if the
      // tab navigator isn't available.
      final tabNavigator =
          MainTabControlDelegate.getInstance().tabKey()?.currentState;
      if (tabNavigator != null) {
        tabNavigator.push(MaterialPageRoute(builder: (_) => screen));
      } else {
        FluxNavigate.push(
          MaterialPageRoute(builder: (_) => screen),
          context: context,
        );
      }
    }
  }

  void onNavigator() {
    eventBus.fire(const EventCloseNativeDrawer());
  }

  @override
  Widget build(BuildContext context) {
    var isDarkTheme = Provider.of<AppModel>(context, listen: false).darkTheme;
    var logo = drawer.getLogoByTheme(isDarkTheme);

    printLog('[AppState] Load Menu');

    return SafeArea(
      top: drawer.safeArea,
      right: false,
      // Le Voile: was `false`. A Scaffold strips the bottom inset from its
      // `body`, but NOT from its `drawer` — so on a gesture-navigation phone
      // the gesture bar sat over the last row, which is the always-appended
      // "login" item (ConfigBuilder appends it if the admin has not).
      bottom: true,
      left: false,
      child: Padding(
        key: drawer.key != null ? Key(drawer.key as String) : UniqueKey(),
        padding: EdgeInsets.only(
          bottom: injector<AudioManager>().isStickyAudioWidgetActive ? 46 : 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (logo != null) ...[
                Container(
                  color: drawer.logoConfig.backgroundColor.toColor(),
                  padding: EdgeInsets.only(
                    bottom: drawer.logoConfig.marginBottom.toDouble(),
                    top: drawer.logoConfig.marginTop.toDouble(),
                    left: drawer.logoConfig.marginLeft.toDouble(),
                    right: drawer.logoConfig.marginRight.toDouble(),
                  ),
                  child: FluxImage(
                    width: drawer.logoConfig.useMaxWidth
                        ? MediaQuery.of(context).size.width
                        : drawer.logoConfig.width?.toDouble(),
                    fit: Helper.boxFit(drawer.logoConfig.boxFit),
                    height: drawer.logoConfig.height.toDouble(),
                    imageUrl: logo,
                  ),
                ),
                const Divider(),
              ],
              ...List.generate(drawer.items?.length ?? 0, (index) {
                return drawerItem(
                  drawer.items![index],
                  drawer.subDrawerItem ?? {},
                );
              }),
              Layout.isDisplayDesktop(context)
                  ? const SizedBox(height: 300)
                  : const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItem(
    DrawerItemsConfig drawerItemConfig,
    Map<String, GeneralSettingItem> subDrawerItem,
  ) {
    if (drawerItemConfig.show == false) return const SizedBox();
    var value = drawerItemConfig.type;

    switch (value) {
      case 'home':
        {
          return ListTile(
            leading: Icon(
              isEcommercePlatform ? Icons.home : Icons.shopping_basket,
              size: 20,
              color: iconColor,
            ),
            title: Text(
              isEcommercePlatform ? S.of(context).home : S.of(context).shop,
              style: textStyle,
            ),
            onTap: () {
              pushNavigator(name: RouteList.home);
            },
          );
        }
      case 'categories':
        {
          return ListTile(
            leading: Icon(Icons.category, size: 20, color: iconColor),
            title: Text(S.of(context).categories, style: textStyle),
            onTap: () => pushNavigator(
              name: !Provider.of<AppModel>(context, listen: false).isMultiVendor
                  ? RouteList.category
                  : RouteList.vendorCategory,
            ),
          );
        }
      case 'cart':
        {
          final showCart =
              Services().widget.enableShoppingCart(null) &&
              ServerConfig().supportsShoppingCart;
          if (showCart == false) {
            return const SizedBox();
          }
          return ListTile(
            leading: Icon(Icons.shopping_cart, size: 20, color: iconColor),
            title: Text(S.of(context).cart, style: textStyle),
            onTap: () => pushNavigator(name: RouteList.cart),
          );
        }
      case 'profile':
        {
          return ListTile(
            leading: Icon(Icons.person, size: 20, color: iconColor),
            title: Text(S.of(context).settings, style: textStyle),
            onTap: () => pushNavigator(name: RouteList.profile),
          );
        }
      case 'web':
        {
          return ListTile(
            leading: Icon(Icons.web, size: 20, color: iconColor),
            title: Text(S.of(context).webView, style: textStyle),
            onTap: () {
              pushNavigator(
                screen: WebView(
                  'https://inspireui.com',
                  title: S.of(context).webView,
                ),
              );
            },
          );
        }
      case 'blog':
        {
          return ListTile(
            leading: Icon(
              CupertinoIcons.news_solid,
              size: 20,
              color: iconColor,
            ),
            title: Text(S.of(context).blog, style: textStyle),
            onTap: () => pushNavigator(name: RouteList.listBlog),
          );
        }
      case 'login':
        {
          if (!kLoginSetting.enable) {
            return const SizedBox();
          }
          return ListenableProvider.value(
            value: Provider.of<UserModel>(context, listen: false),
            child: Consumer<UserModel>(
              builder: (context, userModel, _) {
                final loggedIn = userModel.loggedIn;
                return ListTile(
                  leading: Icon(Icons.exit_to_app, size: 20, color: iconColor),
                  title: loggedIn
                      ? Text(S.of(context).logout, style: textStyle)
                      : Text(S.of(context).login, style: textStyle),
                  onTap: () async {
                    if (loggedIn) {
                      final confirmed = await context.showFluxDialogConfirm(
                        useAppNavigator: true,
                        primaryAsDestructiveAction: true,
                        title: S.of(context).logout,
                        body: S.of(context).areYouSureLogOut,
                      );
                      if (!confirmed) return;
                      unawaited(userModel.logout());
                      if (Services().widget.isRequiredLogin) {
                        unawaited(
                          NavigateTools.navigateToLogin(
                            context,
                            replacement: true,
                          ),
                        );
                      }
                    } else {
                      unawaited(NavigateTools.navigateToLogin(context));
                    }
                  },
                );
              },
            ),
          );
        }
      case 'category':
        {
          return buildListCategory();
        }
      default:
        {
          var item = subDrawerItem[value];
          // Le Voile: drawer keys are dash-separated and come from two places
          // with DIFFERENT suffixes, so neither a plain `==` nor the original
          // `contains()` is right:
          //   • ConfigBuilder::drawer() emits "{type}-{index}" → "about-3"
          //   • the bundled fallback configs (lib/config/config_{en,ar}.json)
          //     emit word suffixes → "title-shop", "category-scarfs",
          //     "policy-returns", "web-contact", "web-branches"
          // Matching on segments handles both, and unlike `contains()` it can't
          // fire on a mere substring (a future type "webinar" no longer hits the
          // `web` branch, "aboutus" no longer hits `about`).
          //
          // Note the Arabic bundled config relies on "web-contact" and
          // "web-branches" opening the NATIVE screens, so the native checks
          // below run against any segment and therefore win over `web`.
          final segments = (value ?? '').split('-');
          final type = segments.first;
          bool has(String t) => segments.contains(t);

          // Le Voile: a row the DASHBOARD gave sub-items to expands, whatever
          // its own type is. This used to be checked only inside the `category`
          // branch, which meant a "Shop" heading with children beneath it
          // rendered as a dead flat row and the children vanished entirely.
          if (item != null && item.children.isNotEmpty) {
            return buildCategoryGroup(item);
          }

          // Le Voile native pages.
          if (has('contact')) {
            return ListTile(
              leading: nativeLeading(item, Icons.headset_mic_rounded),
              title: Text(item?.title ?? 'Contact Us', style: textStyle),
              onTap: () => pushNavigator(screen: const ContactScreen()),
            );
          }
          if (has('policy')) {
            return ListTile(
              leading: nativeLeading(item, Icons.assignment_return_rounded),
              title: Text(
                item?.title ?? 'Exchange & Return',
                style: textStyle,
              ),
              onTap: () => pushNavigator(screen: const PolicyScreen()),
            );
          }
          // Le Voile native pages — My Coupons, Branches, About.
          if (has('coupons')) {
            return ListTile(
              leading: nativeLeading(item, Icons.local_activity_rounded),
              title: Text(item?.title ?? 'My Coupons', style: textStyle),
              onTap: () => pushNavigator(screen: const MyCouponsScreen()),
            );
          }
          // Le Voile: "shop the look". Replaces pointing a `web` row at the
          // Shopify lookbook page, which filled a second basket the app could
          // not see — see CLAUDE.md, "The lookbook webview has its own cart".
          if (has('outfits')) {
            return ListTile(
              leading: nativeLeading(item, Icons.checkroom_rounded),
              title: Text(item?.title ?? 'Shop the Look', style: textStyle),
              onTap: () => pushNavigator(screen: const LvOutfitsScreen()),
            );
          }
          if (has('branches')) {
            return ListTile(
              leading: nativeLeading(item, Icons.storefront_outlined),
              title: Text(item?.title ?? 'Branches', style: textStyle),
              onTap: () => pushNavigator(screen: const StoreLocatorScreen()),
            );
          }
          if (has('about')) {
            return ListTile(
              leading: nativeLeading(item, Icons.info_outline_rounded),
              title: Text(item?.title ?? 'About Us', style: textStyle),
              onTap: () => pushNavigator(screen: const AboutScreen()),
            );
          }
          if (type == 'web') {
            return GeneralWebWidget(
              item: item,
              useTile: true,
              iconColor: iconColor,
              textStyle: textStyle,
              onNavigator: onNavigator,
            );
          }
          if (type == 'post') {
            return GeneralPostWidget(
              item: item,
              useTile: true,
              iconColor: iconColor,
              textStyle: textStyle,
              onNavigator: onNavigator,
            );
          }
          if (type == 'title') {
            return GeneralTitleWidget(item: item);
          }
          if (type == 'button') {
            return GeneralButtonWidget(item: item, onNavigator: onNavigator);
          }
          if (type == 'product') {
            return GeneralProductWidget(
              item: item,
              useTile: true,
              iconColor: iconColor,
              textStyle: textStyle,
              onNavigator: onNavigator,
            );
          }
          if (type == 'category') {
            // Children are handled above, for every type at once — a category
            // with none stays a flat tile.
            return GeneralCategoryWidget(
              item: item,
              useTile: true,
              iconColor: iconColor,
              textStyle: textStyle,
              onNavigator: onNavigator,
            );
          }
          if (type == 'banner') {
            return GeneralBannerWidget(item: item, onNavigator: onNavigator);
          }
          if (type == 'blogCategory') {
            return GeneralBlogCategoryWidget(
              item: item,
              useTile: true,
              iconColor: iconColor,
              textStyle: textStyle,
              onNavigator: onNavigator,
            );
          }
          if (type == 'blog') {
            return GeneralBlogWidget(
              item: item,
              useTile: true,
              iconColor: iconColor,
              textStyle: textStyle,
              onNavigator: onNavigator,
            );
          }
          if (type == 'screen') {
            return GeneralScreenWidget(
              item: item,
              useTile: true,
              iconColor: iconColor,
              textStyle: textStyle,
              onNavigator: onNavigator,
            );
          }
        }

        return const SizedBox();
    }
  }

  /// What sits to the left of a drawer row's label.
  ///
  /// Three modes, set per row in the dashboard:
  ///  * `icon`  — the chosen Material glyph (the default, and what every
  ///              config written before this feature produces)
  ///  * `image` — an uploaded picture, e.g. a category thumbnail
  ///  * `none`  — nothing at all, so the label starts where the icons do and
  ///              the row still lines up with its neighbours
  ///
  /// Returns null for `none`; ListTile then omits the leading slot entirely.
  Widget? leadingFor(GeneralSettingItem item) {
    if (item.iconMode == 'none') return null;

    if (item.iconMode == 'image' && (item.menuImage?.isNotEmpty ?? false)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: FluxImage(
          imageUrl: item.menuImage!,
          width: 24,
          height: 24,
          fit: BoxFit.cover,
          // A broken URL must not take the drawer down with it: in release an
          // exception inside build() paints the whole screen blank.
          errorWidget: Icon(
            iconPicker(item.icon, item.iconFontFamily) ?? Icons.label,
            size: 20,
            color: iconColor,
          ),
        ),
      );
    }

    return Icon(
      iconPicker(item.icon, item.iconFontFamily) ?? Icons.label,
      size: 20,
      color: iconColor,
    );
  }

  /// Same Icon Mode decision as [leadingFor], for the native pages below
  /// (Contact, Policy, My Coupons, Shop the Look, Branches, About). Their
  /// glyph is fixed by the page itself rather than read from `item.icon`, but
  /// Text-only / Image still has to be able to turn it off or replace it —
  /// otherwise picking "Text only" for one of these rows left the default
  /// glyph on screen since nothing here ever looked at iconMode.
  Widget? nativeLeading(GeneralSettingItem? item, IconData defaultIcon) {
    final mode = item?.iconMode ?? 'icon';
    if (mode == 'none') return null;

    final image = item?.menuImage;
    if (mode == 'image' && (image?.isNotEmpty ?? false)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: FluxImage(
          imageUrl: image!,
          width: 20,
          height: 20,
          fit: BoxFit.cover,
          errorWidget: Icon(defaultIcon, size: 20, color: iconColor),
        ),
      );
    }

    return Icon(defaultIcon, size: 20, color: iconColor);
  }

  /// A curated drawer category that has sub-categories beneath it.
  ///
  /// Tapping the row expands or collapses it — it never navigates, so the whole
  /// row is one predictable target and label-only groups (which have no
  /// collection of their own to open) behave the same as the rest. Each child
  /// is a normal [GeneralCategoryWidget], so it navigates through exactly the
  /// same path as a flat category tile.
  Widget buildCategoryGroup(GeneralSettingItem item) {
    return Theme(
      // ExpansionTile draws a divider above and below when open; the drawer
      // separates its rows with spacing instead.
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: leadingFor(item),
        title: Text(item.title, style: textStyle),
        iconColor: iconColor,
        collapsedIconColor: iconColor,
        // Line the title up with the ListTile rows above and below it.
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final child in item.children)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GeneralCategoryWidget(
                item: child,
                useTile: true,
                iconColor: iconColor,
                textStyle: textStyle,
                onNavigator: onNavigator,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildListCategory() {
    return Selector<CategoryModel, List<Category>?>(
      shouldRebuild: (previous, next) {
        return previous != next;
      },
      selector: (context, provider) => provider.categories,
      builder: (context, categories, child) {
        var widgets = <Widget>[];

        if (categories != null) {
          final list = categories.where((item) => item.isRoot).toList();
          for (var i = 0; i < list.length; i++) {
            final currentCategory = list[i];
            final childCategories = categories
                .where((o) => o.parent == currentCategory.id)
                .toList();
            final categoryName = currentCategory.name?.toUpperCase() ?? '';

            widgets.add(
              Container(
                color: i.isOdd
                    ? null
                    : Theme.of(
                        context,
                      ).colorScheme.secondary.withValueOpacity(0.1),

                /// Check to add only parent link category
                child: childCategories.isEmpty
                    ? InkWell(
                        onTap: () => navigateToBackDrop(currentCategory),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            bottom: 12,
                            left: 16,
                            top: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(categoryName, style: textStyle),
                              ),
                              const SizedBox(width: 24),
                              currentCategory.totalProduct == null
                                  ? const Icon(Icons.chevron_right)
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        S
                                            .of(context)
                                            .nItems(
                                              currentCategory.totalProduct!,
                                            ),
                                        style: textStyle.copyWith(fontSize: 12),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      )
                    : ExpansionTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 0),
                          child: Text(
                            categoryName,
                            style: textStyle.copyWith(fontSize: 14),
                          ),
                        ),
                        iconColor: iconColor,
                        collapsedIconColor: textColor,
                        children:
                            getChildren(
                                  categories,
                                  currentCategory,
                                  childCategories,
                                )
                                as List<Widget>,
                      ),
              ),
            );
          }
        }

        return ExpansionTile(
          initiallyExpanded: true,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          tilePadding: const EdgeInsets.only(left: 16, right: 8),
          title: Text(
            S.of(context).byCategory.toUpperCase(),
            style: textStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconColor: iconColor,
          collapsedIconColor: textColor,
          children: widgets,
        );
      },
    );
  }

  List getChildren(
    List<Category> categories,
    Category currentCategory,
    List<Category> childCategories, {
    double paddingOffset = 0.0,
  }) {
    var list = <Widget>[];
    final totalProduct = currentCategory.totalProduct;
    list.add(
      ListTile(
        leading: Padding(
          padding: EdgeInsets.only(left: 20 + paddingOffset),
          child: Text(
            S.of(context).seeAll,
            style: textStyle.copyWith(fontSize: 14),
          ),
        ),
        trailing: ((totalProduct != null && totalProduct > 0))
            ? Text(
                S.of(context).nItems(totalProduct),
                style: textStyle.copyWith(fontSize: 12),
              )
            : null,
        onTap: () => navigateToBackDrop(currentCategory),
      ),
    );
    for (var i in childCategories) {
      var newChildren = categories.where((cat) => cat.parent == i.id).toList();
      final name = i.name ?? '';

      if (newChildren.isNotEmpty) {
        list.add(
          ExpansionTile(
            title: Padding(
              padding: EdgeInsets.only(left: 20.0 + paddingOffset),
              child: Text(
                name.toUpperCase(),
                style: textStyle.copyWith(fontSize: 14),
              ),
            ),
            iconColor: iconColor,
            collapsedIconColor: textColor,
            children:
                getChildren(
                      categories,
                      i,
                      newChildren,
                      paddingOffset: paddingOffset + 10,
                    )
                    as List<Widget>,
          ),
        );
      } else {
        final totalProduct = i.totalProduct;
        list.add(
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(left: 20 + paddingOffset),
              child: Text(name, style: textStyle.copyWith(fontSize: 14)),
            ),
            trailing: (totalProduct != null && totalProduct > 0)
                ? Text(
                    S.of(context).nItems(i.totalProduct!),
                    style: textStyle.copyWith(fontSize: 12),
                  )
                : null,
            onTap: () => navigateToBackDrop(i),
          ),
        );
      }
    }
    return list;
  }

  void navigateToBackDrop(Category category) {
    FluxNavigate.pushNamed(
      RouteList.backdrop,
      arguments: BackDropArguments(
        cateId: category.id,
        cateName: category.name,
      ),
      context: context,
    );
  }
}
