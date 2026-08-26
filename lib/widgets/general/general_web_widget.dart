import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:inspireui/icons/icon_picker.dart';
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/extensions/extensions.dart';
import '../../models/user_model.dart';
import '../../screens/settings/widgets/setting_item/setting_item_widget.dart';
import '../../services/service_config.dart';
import '../common/webview.dart';
import 'general_widget.dart';

class GeneralWebWidget extends GeneralWidget {
  const GeneralWebWidget({
    required super.item,
    super.iconColor,
    super.textStyle,
    super.useTile,
    Function()? super.onNavigator,
    super.cardStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<UserModel, bool>(
      selector: (context, model) => model.loggedIn,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, value, child) {
        var icon = Icons.error;
        String title;
        Widget trailing;
        Function() onTap = () {};
        title = item?.title ?? S.of(context).dataEmpty;
        trailing = const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: kGrey600,
        );
        var webUrl = item?.webUrl;
        if (item?.requiredLogin ?? false) {
          if (!value) return const SizedBox();

          final userModel = context.read<UserModel>().user;

          if (ServerConfig().isSupportUserRole &&
              (item?.roles.isNotEmpty == true)) {
            final userRole = userModel?.role;

            if (userRole == null ||
                !(item?.roles.contains(userRole) ?? false)) {
              return const SizedBox();
            }
          }

          final cookie = userModel?.cookie;
          webUrl = webUrl?.addWooCookieToUrl(cookie);
        }

        if (item != null) {
          icon = iconPicker(item!.icon, item!.iconFontFamily) ?? Icons.error;
          onTap = () {
            if (item?.webViewMode ?? false) {
              // ⚠️ Le Voile: a Shopify page opened here uses SHOPIFY'S WEB
              // BASKET, which is a different cart from the app's Storefront
              // one — so the tab-bar badge, My Coupons, the Thank-You snapshot
              // and Analytics all miss anything bought through it.
              //
              // A bridge that pulled those actions back into the app was
              // written and then pulled out before release: two review passes
              // found 18 defects in it, six of which emptied the customer's
              // basket without telling them. It needs its own change and a
              // real-device test, not a slot in a deadline release.
              // See CLAUDE.md, "The lookbook webview has its own cart".
              onPushScreen(
                WebView(
                  '$webUrl',
                  title: title,
                  enableBackward: item?.enableBackward ?? false,
                  enableForward: item?.enableForward ?? false,
                  enableClose: item?.enableClose ?? false,
                  script: (item?.script?.isEmptyOrNull ?? true)
                      ? kWebViewConfig.webViewScript
                      : item?.script ?? '',
                ),
                context: context,
              );
            } else {
              onLaunch(webUrl);
            }
          };
        }

        return SettingItemWidget(
          icon: icon,
          title: title,
          onTap: onTap,
          trailing: trailing,
          useTile: useTile,
          cardStyle: cardStyle,
          iconColorTile: iconColor,
          textStyleTile: textStyle,
        );
      },
    );
  }
}
