import 'package:flutter/material.dart';

/// Le Voile — the scrolling announcement strip at the very top of the home
/// page ("NEW COLLECTION AVAILABLE NOW", "SHIPPING ALL OVER EGYPT"…).
///
/// Driven entirely by the dashboard (Home Ticker screen).
///
/// Config shape (built by ConfigBuilder):
/// {
///   "layout": "lvTicker",
///   "messages": ["NEW COLLECTION AVAILABLE NOW", "SHIPPING ALL OVER EGYPT"],
///   "speed": 16,            // seconds for one full loop
///   "bgColor": "#9e197e",
///   "textColor": "#FBF6F1"
/// }
class LvTickerBar extends StatefulWidget {
  final Map config;
  const LvTickerBar({required this.config, super.key});

  /// Message font size. Also drives the strip's fixed height.
  static const double fontSize = 10.5;

  /// Vertical padding inside the coloured bar, top and bottom.
  static const double barPadding = 7;

  /// The strip's TOTAL height.
  ///
  /// On the WIDGET rather than its State because the home page pins the ticker
  /// as a SliverPersistentHeader, which has to know the extent before any State
  /// exists. If this and the widget's real height ever disagree, the pinned bar
  /// either clips its text or leaves a blank band under itself.
  static const double barHeight = fontSize * 1.6 + barPadding * 2;

  @override
  State<LvTickerBar> createState() => _LvTickerBarState();
}

class _LvTickerBarState extends State<LvTickerBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  List<String> get _messages => ((widget.config['messages'] as List?) ?? const [])
      .map((e) => e.toString().trim())
      .where((e) => e.isNotEmpty)
      .toList();

  /// Seconds per loop. Clamped so a bad value can't freeze the strip or spin
  /// it into a blur — and never zero, which would divide by zero below.
  int get _speed {
    final s = int.tryParse('${widget.config['speed'] ?? 16}') ?? 16;
    return s.clamp(4, 120);
  }

  Color _color(String key, Color fallback) {
    final raw = widget.config[key]?.toString().trim() ?? '';
    if (raw.isEmpty) return fallback;
    var hex = raw.replaceFirst('#', '');
    if (hex.length == 3) {
      hex = hex.split('').map((c) => '$c$c').join();
    }
    if (hex.length == 6) hex = 'ff$hex';
    // Length check before parsing: "#abcd" would otherwise parse happily to
    // Color(0x0000abcd) — alpha 0 — and the bar would be there but invisible,
    // which reads to the admin as "the ticker disappeared".
    if (hex.length != 8) return fallback;
    final v = int.tryParse(hex, radix: 16);
    return v == null ? fallback : Color(v);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _speed),
    )..repeat();
  }

  /// How many times the message band has to repeat before it is at least as
  /// wide as the viewport. Uses a rough per-character estimate because a Row's
  /// real width is only known after layout, which is too late to decide how
  /// many children to build.
  static int _copiesToFill(double viewport, List<String> messages) {
    if (!viewport.isFinite || viewport <= 0) return 1;
    // ~6 logical px per character at 10.5sp, plus the bullet separator.
    final approx = messages.fold<double>(
      0,
      (sum, m) => sum + m.length * 6.0 + 30,
    );
    if (approx <= 0) return 1;
    return (viewport / approx).ceil().clamp(1, 8);
  }

  bool get isRtl => Directionality.of(context) == TextDirection.rtl;

  @override
  void didUpdateWidget(covariant LvTickerBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // The dashboard can change the speed and push a config_update while the
    // app is open, so rebuild the animation rather than keeping the old rate.
    final want = Duration(seconds: _speed);
    if (_controller.duration != want) {
      _controller.duration = want;
      _controller
        ..reset()
        ..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = _messages;
    if (messages.isEmpty) return const SizedBox.shrink();

    final textColor = _color('textColor', const Color(0xFFFBF6F1));
    final dotColor = textColor.withValues(alpha: 0.55);

    // 🔴 The scrolling area MUST have a definite height.
    //
    // OverflowBox sizes itself to its incoming constraints' `biggest`, not to
    // its child. This block sits in the home page's vertical list, where the
    // incoming maxHeight is infinity — so without a bound the OverflowBox
    // resolved to an infinite height, layout threw every frame, and the whole
    // home page came up blank and frozen.
    //
    // It is a CONSTANT, and the text below is pinned to TextScaler.noScaling to
    // match. A decorative one-line marquee cannot usefully grow with the
    // accessibility text size — at 2× the glyphs just get clipped by the
    // ClipRect — and the Semantics label above already gives a screen reader
    // the full message.
    const stripHeight =
        LvTickerBar.barHeight - LvTickerBar.barPadding * 2;

    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final m in messages) ...[
          Text(
            m,
            maxLines: 1,
            softWrap: false,
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontSize: LvTickerBar.fontSize,
              letterSpacing: 0.5,
              height: 1.2,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '•',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: LvTickerBar.fontSize, color: dotColor),
            ),
          ),
        ],
      ],
    );

    return Container(
      width: double.infinity,
      color: _color('bgColor', Theme.of(context).primaryColor),
      padding: const EdgeInsets.symmetric(vertical: LvTickerBar.barPadding),
      // The strip is decorative; a screen reader should read the messages once
      // rather than announce an endlessly moving marquee.
      child: Semantics(
        label: messages.join('. '),
        excludeSemantics: true,
        child: SizedBox(
          height: stripHeight,
          child: ClipRect(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // The strip must be at least as wide as the screen BEFORE it is
                // doubled, or a short message leaves a visible gap between the
                // two copies. Repeat the content until one copy fills the
                // viewport, using a rough width estimate (a Row cannot be
                // measured without a layout pass).
                final copies = _copiesToFill(constraints.maxWidth, messages);
                final band = Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(copies, (_) => row),
                );

                return OverflowBox(
                  // Width unbounded: otherwise the Row is clamped to the
                  // viewport, reports a RenderFlex overflow, and —
                  // worse — FractionalTranslation then shifts by a fraction of
                  // the CLAMPED width instead of the real content width, so the
                  // loop never lines up. The ClipRect above keeps it in the bar.
                  maxWidth: double.infinity,
                  // Height stays BOUNDED. OverflowBox resolves its own size
                  // from these constraints, and the SizedBox above is what
                  // makes maxHeight finite — see the note where stripHeight is
                  // computed.
                  minHeight: 0,
                  maxHeight: stripHeight,
                  // Alignment.centerLeft, NOT AlignmentDirectional.centerStart.
                  // The translation below is written around a left-anchored
                  // band; in Arabic `centerStart` anchors right instead, which
                  // pushed the whole band off the left edge and left the bar
                  // blank for almost the entire cycle. Anchor left in both
                  // directions and let the offset's sign do the mirroring.
                  alignment: Alignment.centerLeft,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      // The band is drawn TWICE and shifted by exactly half the
                      // pair's width, so at value == 1 the second copy sits
                      // precisely where the first started and the seam is
                      // invisible.
                      final t = _controller.value * 0.5;
                      return FractionalTranslation(
                        // RTL scrolls the other way, and has to START shifted by
                        // a full copy so the leading edge is covered rather than
                        // trailing an ever-widening blank.
                        translation: Offset(isRtl ? t - 0.5 : -t, 0),
                        child: child,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [band, band],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Pins [LvTickerBar] to the top of the home page so it stays put while the
/// customer scrolls.
///
/// The strip is a HorizonLayout block like every other, so by default it
/// scrolled away with the rest of the page. `HomeLayout` skips it in the
/// SliverList and emits this instead — see the `lvTicker` note there.
class LvTickerHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Map config;

  const LvTickerHeaderDelegate({required this.config});

  // Fixed extent: min == max means the bar never shrinks or grows on scroll.
  @override
  double get minExtent => LvTickerBar.barHeight;

  @override
  double get maxExtent => LvTickerBar.barHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Returning the same widget TYPE every time is what keeps the marquee's
    // State — and so its AnimationController — alive across rebuilds. Do not
    // add a key here.
    return LvTickerBar(config: config);
  }

  @override
  bool shouldRebuild(covariant LvTickerHeaderDelegate oldDelegate) {
    // A Map has no value equality, so there is no cheap way to tell a genuinely
    // new config from the same one rebuilt. Rebuilding is cheap (one Row of
    // Text) and the widget's State survives it, whereas skipping a real change
    // would leave a stale message on screen after a config_update push.
    return true;
  }
}
