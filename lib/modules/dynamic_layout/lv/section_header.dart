import 'package:flutter/material.dart';
// `F` (the localisation accessor the stock HeaderView used for "See All").
import 'package:flux_ui/flux_ui.dart';

/// Le Voile — the heading above a home-page product section.
///
/// Replaces the stock `HeaderView` (packages/flux_ui) for product blocks: the
/// title and its small second line are CENTRED, and "See All" floats at the top
/// right rather than sitting on the same baseline as the title.
///
/// Built as a Stack rather than a Row so the centred title is centred on the
/// SCREEN, not on the space left over beside the "See All" link — with a Row,
/// a long action label visibly pushes the heading off-centre.
///
/// Fed from the raw block JSON (`name`, `subtitle`), so no change to the stock
/// ProductConfig was needed.
class LvSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  /// Null hides the action entirely — used for the "recently viewed" block,
  /// which has no collection to open.
  final VoidCallback? onSeeAll;

  /// Null falls back to the translated string, as the stock HeaderView did.
  /// Hard-coding "See All" here put English on every section for Arabic users.
  final String? seeAllLabel;

  const LvSectionHeader({
    required this.title,
    this.subtitle = '',
    this.onSeeAll,
    this.seeAllLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasTitle = title.trim().isNotEmpty;
    final hasSubtitle = subtitle.trim().isNotEmpty;

    if (!hasTitle && !hasSubtitle) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
      child: Stack(
        children: [
          // The centred block. Padded on both sides by the width the action
          // link needs, so a long title wraps instead of running under it.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (hasTitle)
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2F2A2E),
                    ),
                  ),
                if (hasSubtitle) ...[
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      color: theme.primaryColor.withValues(alpha: 0.65),
                    ),
                  ),
                ],
              ],
            ),
          ),

          if (onSeeAll != null)
            PositionedDirectional(
              // `end` rather than `right`: the app is force-RTL, and the design
              // wants this on the side the reader finishes on either way.
              end: 0,
              top: 0,
              child: GestureDetector(
                onTap: onSeeAll,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  // Directional, so the 8pt gutter stays on the inner side in
                  // Arabic instead of jumping to the screen edge.
                  padding: const EdgeInsetsDirectional.only(start: 8, bottom: 8),
                  child: Text(
                    seeAllLabel ?? F.of(context).seeAll,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
