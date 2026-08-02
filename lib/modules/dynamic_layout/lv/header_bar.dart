import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../common/tools/navigate_tools.dart';
import '../../../models/app_model.dart';
import '../../../models/user_model.dart';
import '../../../routes/flux_navigate.dart';

/// Le Voile — the home-page header: hamburger on the left, the wordmark large
/// in the middle, an account icon on the right, and a greeting under it once
/// the customer is signed in.
///
/// Replaces the stock FluxStore `logo` block ON THE HOME PAGE ONLY. It is a
/// HorizonLayout block, so no other screen's app bar is touched — that was a
/// deliberate scoping decision, see ConfigBuilder.
///
/// Config shape (built by ConfigBuilder):
/// {
///   "layout": "lvHeader",
///   "logo": "https://…"        // empty → the logo bundled with the app
///   "logoSize": 150,
///   "showMenu": true,
///   "showAccount": true,
///   "greeting": "Hi {name}"    // empty → never greet
/// }
class LvHeaderBar extends StatelessWidget {
  final Map config;
  const LvHeaderBar({required this.config, super.key});

  String get _logo => config['logo']?.toString().trim() ?? '';
  bool get _showMenu => config['showMenu'] != false;
  bool get _showAccount => config['showAccount'] != false;
  String get _greetingTemplate => config['greeting']?.toString().trim() ?? '';

  /// Parsed rather than cast — the dashboard can send this as a string ("150")
  /// and a hard cast would take the whole home page down with a red screen.
  double get _logoSize {
    final raw = config['logoSize'];
    final v = raw is num ? raw.toDouble() : double.tryParse('$raw') ?? 150.0;
    return v.clamp(80.0, 300.0);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    // listen: true — the greeting has to appear the moment the customer signs
    // in, without waiting for something unrelated to rebuild this subtree.
    final userModel = Provider.of<UserModel>(context);
    final name = _greetingTemplate.isEmpty ? null : _firstName(userModel);
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
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 2),
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
                  width: _logoSize,
                  child: logoUrl.isNotEmpty
                      ? FluxImage(imageUrl: logoUrl, fit: BoxFit.contain)
                      : Text(
                          'Le Voile',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26, color: primary),
                        ),
                ),
              ),
            ),

            // Fixed width, EQUAL to the menu side, so the logo sits in the true
            // centre of the bar rather than being pushed off by however long the
            // customer's name happens to be.
            SizedBox(
              width: _sideWidth,
              child: _showAccount
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                    )
                  : const SizedBox.shrink(),
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
