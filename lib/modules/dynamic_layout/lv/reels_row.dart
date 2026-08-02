import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:url_launcher/url_launcher.dart';

/// Le Voile — the "Follow us on Instagram" strip at the bottom of the home
/// page: a horizontal row of 9:16 reel covers that open Instagram on tap.
///
/// Driven entirely by the dashboard (Instagram Reels screen). The cover image
/// has to be supplied there — Instagram does not let the app read a reel's
/// thumbnail without an authenticated Graph API call.
///
/// Config shape (built by ConfigBuilder):
/// {
///   "layout": "lvReels",
///   "heading": "@ Follow us on Instagram",
///   "cta": "Reels from @levoile",
///   "profile": "https://www.instagram.com/levoilestores/",
///   "items": [ {"url": "https://www.instagram.com/reel/…", "image": "https://…"} ]
/// }
class LvReelsRow extends StatelessWidget {
  final Map config;
  const LvReelsRow({required this.config, super.key});

  /// Only rows that actually have a link — a cover with nothing to open is
  /// not a reel, and a malformed entry must not throw inside build().
  List<Map> get _items => ((config['items'] as List?) ?? const [])
      .whereType<Map>()
      .where((e) => (e['url']?.toString().trim() ?? '').isNotEmpty)
      .toList();
  String get _heading => config['heading']?.toString().trim() ?? '';
  String get _cta => config['cta']?.toString().trim() ?? '';
  String get _profile => config['profile']?.toString().trim() ?? '';

  Future<void> _open(String url) async {
    final u = url.trim();
    if (u.isEmpty) return;
    try {
      // externalApplication so it opens the Instagram app when installed,
      // rather than a logged-out web view.
      await launchUrl(Uri.parse(u), mode: LaunchMode.externalApplication);
    } catch (_) {
      // A malformed link should never take the home page down with it.
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final primary = Theme.of(context).primaryColor;

    // The heading and the Follow button are still worth showing when the reel
    // list is empty — only the strip itself needs items.
    if (items.isEmpty && (_heading.isEmpty || _profile.isEmpty)) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 8),
      child: Column(
        children: [
          if (_heading.isNotEmpty)
            Text(
              _heading,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
                color: primary,
              ),
            ),
          if (_cta.isNotEmpty && _profile.isNotEmpty) ...[
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _open(_profile),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  _cta,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFBF6F1),
                  ),
                ),
              ),
            ),
          ],
          if (items.isNotEmpty) const SizedBox(height: 16),
          if (items.isNotEmpty)
            SizedBox(
            height: 210, // 118 wide at 9:16
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final item = items[i];
                return _ReelCard(
                  image: item['image']?.toString() ?? '',
                  onTap: () => _open(item['url']?.toString() ?? ''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ReelCard extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const _ReelCard({required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          width: 118,
          height: 210,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (image.isNotEmpty)
                FluxImage(imageUrl: image, fit: BoxFit.cover)
              else
                const ColoredBox(color: Color(0xFFF6E9E4)),
              // Bottom scrim, so the play glyph and any burnt-in caption stay
              // legible over a bright cover.
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0x8C000000), Color(0x00000000)],
                    stops: [0.0, 0.4],
                  ),
                ),
              ),
              const PositionedDirectional(
                top: 10,
                end: 10,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xE6FFFFFF),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 15,
                    color: Color(0xFF3A2A28),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
