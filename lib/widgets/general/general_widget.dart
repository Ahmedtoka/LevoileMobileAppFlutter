import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/icons/icon_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/config/models/general_setting_item.dart';
import '../../common/constants.dart';
import '../../common/tools/navigate_tools.dart';
import '../../models/entities/product.dart';
import '../../routes/flux_navigate.dart';
import '../../screens/settings/widgets/setting_item/setting_item_widget.dart';

abstract class GeneralWidget extends StatelessWidget {
  final bool useTile;
  final Color? iconColor;
  final TextStyle? textStyle;
  final GeneralSettingItem? item;
  final SettingItemStyle? cardStyle;
  final void Function()? onNavigator;

  const GeneralWidget({
    super.key,
    required this.item,
    this.iconColor,
    this.textStyle,
    this.useTile = false,
    this.onNavigator,
    this.cardStyle,
  });

  void onTapNavigateOptions({
    required BuildContext context,
    required Map config,
    List<Product>? products,
  }) {
    onNavigator?.call();
    NavigateTools.onTapNavigateOptions(
      config: config,
      context: context,
      products: products,
    );
  }

  void onPushScreen(Widget screen, {required BuildContext context}) {
    onNavigator?.call();
    FluxNavigate.push(
      MaterialPageRoute(builder: (context) => screen),
      context: context,
    );
  }

  void onLaunch(String? webUrl) {
    Tools.launchURL(webUrl, mode: LaunchMode.externalApplication);
  }

  void onTap(BuildContext context) {}

  /// What sits to the left of the row: the chosen glyph, an uploaded picture,
  /// or nothing — per the dashboard's per-row Icon Mode setting. A config
  /// written before that setting existed has no `iconMode`, which defaults to
  /// 'icon' so it keeps showing the glyph exactly as before.
  Widget? leadingWidget(IconData icon) {
    final mode = item?.iconMode ?? 'icon';
    if (mode == 'none') return null;

    final image = item?.menuImage;
    if (mode == 'image' && (image?.isNotEmpty ?? false)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: FluxImage(
          imageUrl: image!,
          width: 24,
          height: 24,
          fit: BoxFit.cover,
          // A broken URL must not take the drawer down with it.
          errorWidget: Icon(icon, color: iconColor),
        ),
      );
    }

    return Icon(icon, color: iconColor);
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.error;
    String title;
    Widget trailing;
    title = item?.title ?? S.of(context).dataEmpty;
    trailing = const Icon(Icons.arrow_forward_ios, size: 18, color: kGrey600);
    if (item != null) {
      icon = iconPicker(item!.icon, item!.iconFontFamily) ?? Icons.error;
    }
    if (useTile) {
      return ListTile(
        leading: leadingWidget(icon),
        title: Text(title, style: textStyle),
        onTap: () => onTap(context),
      );
    }

    return SettingItemWidget(
      onTap: () => onTap(context),
      icon: icon,
      title: title,
      trailing: trailing,
      useTile: useTile,
      iconColorTile: iconColor,
      textStyleTile: textStyle,
      cardStyle: cardStyle,
    );
  }
}
