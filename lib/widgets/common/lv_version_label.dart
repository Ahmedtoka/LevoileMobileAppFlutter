import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../models/app_model.dart';

/// Le Voile — the small grey "Version 1.6.0" line at the bottom of the login
/// screen.
///
/// The NUMBER is read from the installed build (`PackageInfo`), never from the
/// dashboard. A support line that shows whatever an admin last typed is worse
/// than no version at all: the first thing anyone asks a customer is "which
/// version are you on?", and the answer has to be true. The dashboard owns only
/// the wording and whether the line appears — `Setting.LvLoginVersion`.
///
/// Renders nothing at all until PackageInfo resolves, and nothing on failure.
/// This sits on the login screen, and in release a build exception paints the
/// whole screen blank (see CLAUDE.md §12).
class LvVersionLabel extends StatelessWidget {
  const LvVersionLabel({super.key});

  /// PackageInfo hits a platform channel. Cached in a static so rebuilds (every
  /// keystroke in the email field rebuilds this subtree) don't re-cross it.
  static Future<PackageInfo>? _info;

  Map _config(BuildContext context) {
    try {
      final raw = Provider.of<AppModel>(context, listen: false)
          .appConfig
          ?.settings
          .loginVersion;
      if (raw is Map) return raw;
    } catch (_) {
      // No config yet — fall through to the defaults below.
    }
    return const {};
  }

  @override
  Widget build(BuildContext context) {
    final config = _config(context);

    // Absent key ⇒ shown. An older cached config must not make the line vanish;
    // the offline/bundled config has no LvLoginVersion at all.
    if (config['enabled'] == false) return const SizedBox.shrink();

    final label = config['label'] is String
        ? (config['label'] as String).trim()
        : 'Version';
    final showBuild = config['showBuild'] != false;

    _info ??= PackageInfo.fromPlatform();

    return FutureBuilder<PackageInfo>(
      future: _info,
      builder: (context, snapshot) {
        // Drop a rejected future rather than caching it for the whole session.
        // A one-off MissingPluginException at startup would otherwise hide the
        // line until the app is killed — the same shape as the cached-failure
        // bug that disabled the coupon claim (CLAUDE.md §9b).
        if (snapshot.hasError) {
          _info = null;
          return const SizedBox.shrink();
        }

        final pkg = snapshot.data;
        if (pkg == null) return const SizedBox.shrink();

        final build = pkg.buildNumber.trim();
        final version = showBuild && build.isNotEmpty
            ? '${pkg.version} ($build)'
            : pkg.version;

        return Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 12),
          child: Text(
            label.isEmpty ? version : '$label $version',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: 0.45),
            ),
          ),
        );
      },
    );
  }
}
