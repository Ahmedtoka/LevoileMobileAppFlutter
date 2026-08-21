import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../common/tools/navigate_tools.dart';

/// Le Voile — the full-bleed hero photo at the top of the home page: a dark
/// gradient over the image, an eyebrow line, a headline, a CTA button, and an
/// optional round "sticker" badge tilted in the corner.
///
/// Driven entirely by the dashboard (Home Hero screen).
///
/// Config shape (built by ConfigBuilder):
/// {
///   "layout": "lvHero",
///   "image": "https://…",
///   "eyebrow": "New Collection",
///   "title": "Modest fashion,\nmade for you",
///   "cta": "Shop New Arrivals",
///   "height": 390,
///   "link": {"category": "123"} | {"product": "…"} | {"url_launch": "https://…"},
///   "badge": {"line1": "First Order", "line2": "10%", "line3": "Off"} | null
/// }
class LvHeroBanner extends StatelessWidget {
  final Map config;
  const LvHeroBanner({required this.config, super.key});

  String get _image => config['image']?.toString() ?? '';
  String get _eyebrow => config['eyebrow']?.toString().trim() ?? '';
  String get _title => config['title']?.toString().trim() ?? '';
  String get _cta => config['cta']?.toString().trim() ?? '';
  Map? get _badge => config['badge'] is Map ? config['badge'] as Map : null;

  /// Parsed rather than cast: the dashboard can send this as a string ("390")
  /// and a hard cast would take the whole home page down with a red screen.
  double get _height {
    final raw = config['height'];
    final h = raw is num
        ? raw.toDouble()
        : double.tryParse('$raw') ?? 390.0;
    // double.tryParse accepts the literal strings "NaN" and "Infinity", and
    // NaN survives clamp() — a NaN height throws in layout, which release
    // renders as a blank frozen screen. Same guard as LvProductBadges.
    if (!h.isFinite) return 390.0;
    return h.clamp(160.0, 700.0);
  }

  Map get _link => config['link'] is Map ? config['link'] as Map : const {};

  void _onTap(BuildContext context) {
    if (_link.isEmpty) return;
    NavigateTools.onTapNavigateOptions(
      context: context,
      config: Map<String, dynamic>.from(_link),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_image.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final badge = _badge;

    return Padding(
      // The badge is tilted and hangs above the photo, so the stack needs room
      // at the top or it gets clipped — and how much room depends on the size
      // the admin chose.
      padding: EdgeInsets.only(
        // Only as much as the badge actually hangs over the photo's top edge
        // (it is offset by -8), not a proportion of the whole circle — 0.2 of a
        // 76pt badge reserved 15pt where 10 is enough, and that showed up as a
        // gap under the header.
        top: badge != null ? 10 : 0,
        bottom: 4,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: SizedBox(
                height: _height,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FluxImage(
                      imageUrl: _image,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    // Dark wash so white text stays readable whatever the photo.
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xB33A2A28), Color(0x263A2A28)],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (_eyebrow.isNotEmpty)
                              Text(
                                _eyebrow,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 11,
                                  letterSpacing: 3,
                                  color: Color(0xFFF2C8E8),
                                ),
                              ),
                            if (_eyebrow.isNotEmpty) const SizedBox(height: 10),
                            if (_title.isNotEmpty)
                              // Capped: the headline comes from the dashboard,
                              // newlines and all, while the hero box is a fixed
                              // height that clamps as low as 160. A four-line
                              // title overflowed the Column and got silently
                              // clipped off the TOP in release.
                              Flexible(
                                child: Text(
                                  _title,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    height: 1.25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            if (_cta.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => _onTap(context),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 26,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    _cta,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFBF6F1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (badge != null)
            PositionedDirectional(
              top: -8,
              end: 22,
              child: _StickerBadge(badge: badge, color: theme.primaryColor),
            ),
        ],
      ),
    );
  }
}

/// The tilted round sticker ("First Order / 10% / Off") pinned to the hero.
class _StickerBadge extends StatelessWidget {
  final Map badge;
  final Color color;
  const _StickerBadge({required this.badge, required this.color});

  String _line(String k) => badge[k]?.toString().trim() ?? '';

  /// Diameter, set from the dashboard. Parsed rather than cast so a string
  /// ("76") does not take the home page down, and clamped to the same range the
  /// server clamps to, so a hand-edited setting cannot cover the headline.
  double get _size {
    final raw = badge['size'];
    final v = raw is num ? raw.toDouble() : double.tryParse('$raw') ?? 76.0;
    if (!v.isFinite) return 76.0;
    return v.clamp(52.0, 130.0);
  }

  @override
  Widget build(BuildContext context) {
    final l1 = _line('line1');
    final l2 = _line('line2');
    final l3 = _line('line3');
    if (l1.isEmpty && l2.isEmpty && l3.isEmpty) return const SizedBox.shrink();

    // The three type sizes scale with the circle. Hard-coded sizes looked
    // right only at the default diameter: at 130 the text floated in space and
    // at 52 it overflowed the circle.
    final scale = _size / 76.0;

    return Transform.rotate(
      angle: -11 * math.pi / 180,
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          color: const Color(0xFFFBF6F1),
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Color(0x473A2A28),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        // Inset so the lines never touch the ring, whatever the diameter.
        padding: EdgeInsets.symmetric(horizontal: 6 * scale),
        // The circle is a FIXED diameter and the three type sizes are already
        // scaled from it, so letting the device text scaler apply as well
        // overflows the circle at accessibility sizes.
        child: MediaQuery.withNoTextScaling(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (l1.isNotEmpty)
                Text(
                  l1.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 7 * scale,
                    letterSpacing: 1 * scale,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              if (l2.isNotEmpty)
                Text(
                  l2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 19 * scale,
                    height: 1,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              if (l3.isNotEmpty)
                Text(
                  l3.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 8 * scale,
                    letterSpacing: .5 * scale,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF3A2A28),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
