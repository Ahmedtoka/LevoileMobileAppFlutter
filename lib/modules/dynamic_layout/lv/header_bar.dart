import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../common/tools/navigate_tools.dart';
import '../../../models/app_model.dart';
import '../../../models/entities/back_drop_arguments.dart';
import '../../../models/user_model.dart';
import '../../../routes/flux_navigate.dart';

/// Le Voile — the home-page header: hamburger on the left, the wordmark large
/// in the middle, and one action button on the right.
///
/// Replaces the stock FluxStore `logo` block ON THE HOME PAGE ONLY. It is a
/// HorizonLayout block, so no other screen's app bar is touched — that was a
/// deliberate scoping decision, see ConfigBuilder.
///
/// Config shape (built by ConfigBuilder):
/// {
///   "layout": "lvHeader",
///   "logo": "https://…"          // empty → the logo bundled with the app
///   "logoSize": 46,              // HEIGHT, not width
///   "showMenu": true,
///   "rightAction": "search",     // search | account | none
///   "greeting": "Hi {name}"      // empty → never greet
/// }
class LvHeaderBar extends StatelessWidget {
  final Map config;
  const LvHeaderBar({required this.config, super.key});

  String get _logo => config['logo']?.toString().trim() ?? '';
  bool get _showMenu => config['showMenu'] != false;
  String get _greetingTemplate => config['greeting']?.toString().trim() ?? '';

  /// What sits on the right of the wordmark: `search`, `account` or `none`.
  ///
  /// One slot, one choice — search and the account icon are alternatives, not
  /// toggles. Anything unrecognised falls back to search rather than leaving
  /// the corner empty.
  String get _rightAction {
    final value = config['rightAction']?.toString().trim() ?? '';
    return const ['search', 'account', 'none'].contains(value)
        ? value
        : 'search';
  }

  /// Logo HEIGHT, not width.
  ///
  /// It used to set the width with the height left free, so a logo file that is
  /// roughly square — or one exported with transparent margins — rendered as
  /// tall as it was wide and left a huge blank band above and below the
  /// wordmark. Height is the dimension a header bar actually cares about; the
  /// width then follows from the artwork's own aspect ratio.
  ///
  /// Parsed rather than cast — the dashboard can send this as a string ("46")
  /// and a hard cast would take the whole home page down with a red screen.
  double get _logoSize {
    final raw = config['logoSize'];
    final v = raw is num ? raw.toDouble() : double.tryParse('$raw') ?? 46.0;
    return v.clamp(24.0, 96.0);
  }

  /// Width of the two fixed side columns.
  ///
  /// Wide enough for a real first name under the icon: at 48 the greeting had
  /// room for "Hi Sara" and ellipsised anything longer, which is most names.
  /// Both sides use it so the logo stays centred on the bar, not on the space
  /// left over.
  static const double _sideWidth = 66;

  /// The customer's own first name, or null when signed out / nameless.
  ///
  /// A greeting that reads "Hi ." or "Hi null" is worse than no greeting, so
  /// anything that is not a real, non-empty name returns null.
  String? _firstName(UserModel model) {
    if (!model.loggedIn) return null;

    final user = model.user;
    if (user == null) return null;

    final first = user.firstName?.trim() ?? '';
    if (first.isNotEmpty) return first;

    // Fall back to the leading word of the full name.
    final full = user.name?.trim() ?? '';
    if (full.isEmpty) return null;

    return full.split(RegExp(r'\s+')).first;
  }

  void _openAccount(BuildContext context, bool loggedIn) {
    FluxNavigate.pushNamed(
      loggedIn ? RouteList.profile : RouteList.login,
      context: context,
    );
  }

  void _openSearch(BuildContext context) {
    // Same route and argument shape the stock logo block used, so the search
    // screen gets the block config it expects.
    FluxNavigate.pushNamed(
      RouteList.homeSearch,
      arguments: BackDropArguments(config: Map<String, dynamic>.from(config)),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    // listen: true — the greeting has to appear the moment the customer signs
    // in, without waiting for something unrelated to rebuild this subtree.
    final userModel = Provider.of<UserModel>(context);
    // The server already blanks the greeting unless the slot shows the account
    // button, but check here too: a device still serving its last-good
    // `lv_cached_config_*` from before `rightAction` existed would otherwise
    // print "Hi Sara" under a magnifying glass until the config refreshed.
    final canGreet = _rightAction == 'account' && _greetingTemplate.isNotEmpty;
    final name = canGreet ? _firstName(userModel) : null;
    final greeting = name == null
        ? ''
        : _greetingTemplate.replaceAll('{name}', name);

    // Fall back to the logo bundled with the app so the header is never blank
    // before the admin has uploaded one. ThemeConfig.logo is non-nullable — it
    // already falls back to the kLogo asset — and FluxImage takes an asset path
    // as happily as a URL, which is how the stock LogoWidget renders it too.
    final bundledLogo = Provider.of<AppModel>(context, listen: false)
        .themeConfig
        .logo;
    final logoUrl = _logo.isNotEmpty ? _logo : bundledLogo;

    // NOT wrapped in a forced Directionality. MaterialApp installs its own
    // Directionality from the active locale, below the one app.dart sets, so
    // the ambient direction here is LTR in English and RTL in Arabic. Forcing
    // LTR would be a no-op in English and would pin the menu to the left in
    // Arabic while every other screen mirrored — the row is built from
    // direction-aware widgets instead, so it mirrors with the rest of the app.
    return SafeArea(
      bottom: false,
      child: Padding(
        // Tight: the ticker sits directly above and the hero directly below,
        // and both bring their own breathing room. Anything more here reads as
        // a gap rather than as spacing.
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: Row(
          children: [
            SizedBox(
              width: _sideWidth,
              child: _showMenu
                  ? _CircleButton(
                      icon: Icons.menu_rounded,
                      color: primary,
                      onTap: () => NavigateTools.onTapOpenDrawerMenu(context),
                    )
                  : const SizedBox.shrink(),
            ),

            Expanded(
              child: Center(
                child: SizedBox(
                  // Height tight, width loose: the image keeps its own aspect
                  // ratio and can never be taller than the bar.
                  height: _logoSize,
                  child: logoUrl.isNotEmpty
                      ? FluxImage(imageUrl: logoUrl, fit: BoxFit.contain)
                      : FittedBox(
                          child: Text(
                            'Le Voile',
                            style: TextStyle(fontSize: 26, color: primary),
                          ),
                        ),
                ),
              ),
            ),

            // Fixed width, EQUAL to the menu side, so the logo sits in the true
            // centre of the bar rather than being pushed off by however long the
            // customer's name happens to be.
            SizedBox(
              width: _sideWidth,
              child: _rightAction == 'none'
                  ? const SizedBox.shrink()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_rightAction == 'search')
                          _CircleButton(
                            icon: Icons.search_rounded,
                            color: primary,
                            onTap: () => _openSearch(context),
                          )
                        else
                          _CircleButton(
                            icon: Icons.person_outline_rounded,
                            color: primary,
                            onTap: () =>
                                _openAccount(context, userModel.loggedIn),
                          ),
                        if (greeting.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              greeting,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: primary,
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The soft round button the menu and account icons sit in.
class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 38,
        height: 38,
        decoration: const BoxDecoration(
          color: Color(0xFFF7E9E4),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 19, color: color),
      ),
    );
  }
}
