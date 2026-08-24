import 'dart:async';

import 'package:flutter/material.dart';

/// Le Voile — the small message that slides up from the bottom of the screen.
///
/// ── Why this replaced the red banner ────────────────────────────────────────
///
/// Everything the app had to say used the same full-width alarm-red bar at the
/// top of the screen, with an 18px message and a Close button. "The maximum
/// quantity has been exceeded" is a nudge, not a fault — the customer picked a
/// fourth shirt and there are three. Presenting it like a system failure makes
/// a shopper think they broke something, and it covers the product they were
/// looking at until they dismiss it by hand.
///
/// So: a small card at the BOTTOM, out of the way of the content, fading in and
/// out on its own. Amber for "that can't be done", brand colour for "done".
/// Nothing in this file is red.
///
/// ── Why it is an OverlayEntry and not the `flash` package ───────────────────
///
/// The old bar came from `flash`, whose FlashBar has its own opinions about
/// position, padding, dismiss gestures and animation curves. Owning the widget
/// outright means the look is exactly what is written here, and it removes a
/// dependency from a code path that must never throw: an exception during build
/// is rendered as a BLANK, FROZEN screen in release (see CLAUDE.md §12), and
/// the last thing that should be able to do that is the error reporter.
class LvToast {
  LvToast._();

  /// The toast currently on screen, if any.
  ///
  /// One at a time, deliberately. Three failed taps used to queue three
  /// banners; here the newest replaces the oldest, which is what the customer
  /// is actually reacting to.
  static OverlayEntry? _entry;
  static Timer? _timer;

  /// Completed when the current toast goes, HOWEVER it goes.
  ///
  /// 🔴 Callers `await` this and then navigate — add_address_screen pops the
  /// form, address_management refreshes the list. Completing it only on the
  /// timer meant that tapping the toast, or any second toast arriving inside
  /// three seconds, left those screens stuck for ever.
  static Completer<void>? _completer;

  /// Bumped on every show so a late dismissal cannot remove a newer toast.
  static int _generation = 0;

  static void dismiss() {
    _timer?.cancel();
    _timer = null;

    // remove() is safe on an unmounted overlay, but not on an entry that was
    // never inserted — that path nulls _entry itself, below.
    try {
      _entry?.remove();
    } catch (_) {
      // Nothing to do: the overlay is already gone.
    }
    _entry = null;

    // 🔴 The card's ValueNotifier is deliberately never disposed and not held
    // in a field. OverlayEntry.remove() tears the widget down on the NEXT
    // frame, so its State.dispose() — which calls removeListener — runs after
    // this point; disposing here would trip ChangeNotifier's "used after being
    // disposed" assertion. A notifier nobody listens to is collectable anyway.
    if (_completer?.isCompleted == false) {
      _completer!.complete();
    }
    _completer = null;
  }

  /// Shows [message] and completes when it has gone.
  ///
  /// Never throws: it is called from catch blocks, and an exception here would
  /// replace a small "try again" with a crash.
  static Future<void> show(
    BuildContext context, {
    required String message,
    String? title,
    IconData? icon,
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) async {
    if (message.trim().isEmpty) return;

    OverlayState? overlay;
    try {
      overlay = Overlay.maybeOf(context, rootOverlay: true);
    } catch (_) {
      overlay = null;
    }
    // No overlay yet (very early in startup, or a disposed context). Saying
    // nothing is strictly better than throwing.
    if (overlay == null) return;

    dismiss();

    final generation = ++_generation;
    final completer = Completer<void>();
    final done = ValueNotifier<bool>(false);
    _completer = completer;

    _entry = OverlayEntry(
      builder: (context) => _LvToastCard(
        message: message,
        title: title,
        icon: icon,
        isError: isError,
        hide: done,
        onTap: () {
          onTap?.call();
          if (generation == _generation) dismiss();
        },
      ),
    );

    // 🔴 insert() calls markNeedsBuild, which throws if we are called from
    // inside a build or layout pass — and messages come from catch blocks in
    // exactly those places. Leaving a non-null _entry that was never inserted
    // is worse than the throw: the NEXT dismiss() would hit OverlayEntry's own
    // `_overlay!` and take the whole app down for the rest of the session, as
    // a blank frozen screen (CLAUDE.md §12).
    try {
      overlay.insert(_entry!);
    } catch (_) {
      _entry = null;
      _completer = null;
      // Safe here, and only here: the entry was never inserted, so no widget
      // was ever built against this notifier.
      done.dispose();

      return;
    }

    // Start the fade-out slightly before removal so the card is gone rather
    // than snatched away mid-frame.
    const fadeOut = Duration(milliseconds: 220);
    _timer = Timer(duration, () {
      if (generation != _generation) return;
      done.value = true;
      Timer(fadeOut, () {
        // dismiss() completes the future, so nothing to do here but call it.
        if (generation == _generation) dismiss();
        if (!completer.isCompleted) completer.complete();
      });
    });

    return completer.future;
  }
}

class _LvToastCard extends StatefulWidget {
  const _LvToastCard({
    required this.message,
    required this.isError,
    required this.hide,
    this.title,
    this.icon,
    this.onTap,
  });

  final String message;
  final String? title;
  final IconData? icon;
  final bool isError;
  final ValueNotifier<bool> hide;
  final VoidCallback? onTap;

  @override
  State<_LvToastCard> createState() => _LvToastCardState();
}

class _LvToastCardState extends State<_LvToastCard> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // One frame later, so the widget has an "invisible" state to animate FROM.
    // Setting it in initState would paint the final state immediately and the
    // fade would never be seen.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _visible = true);
    });
    widget.hide.addListener(_onHide);
  }

  void _onHide() {
    if (mounted && widget.hide.value) setState(() => _visible = false);
  }

  @override
  void dispose() {
    // The toast's static reference may already be gone; removing a listener
    // from a notifier nobody else holds is harmless, but do it defensively —
    // this runs during a frame, where a throw is a blank screen (§12).
    try {
      widget.hide.removeListener(_onHide);
    } catch (_) {
      // Already disposed; nothing to detach from.
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;

    // 🔴 Amber, never red. This is "that can't be done", not "something broke".
    final accent = widget.isError
        ? const Color(0xFFE08A1E)
        : theme.primaryColor;

    final surface = dark ? const Color(0xFF2A2A2E) : Colors.white;
    final text = dark ? Colors.white : const Color(0xFF2B2B30);

    return Positioned(
      left: 16,
      right: 16,
      // Clear of the floating tab-bar button and the home indicator.
      bottom: MediaQuery.of(context).padding.bottom + 96,
      child: IgnorePointer(
        ignoring: !_visible,
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: Duration(milliseconds: _visible ? 220 : 200),
          curve: Curves.easeOut,
          child: AnimatedSlide(
            offset: _visible ? Offset.zero : const Offset(0, 0.25),
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: dark ? Colors.white10 : const Color(0x14000000),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: dark ? 0.4 : 0.10),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.icon ??
                              (widget.isError
                                  ? Icons.info_outline_rounded
                                  : Icons.check_rounded),
                          size: 16,
                          color: accent,
                        ),
                      ),
                      const SizedBox(width: 11),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.title?.isNotEmpty ?? false)
                              Text(
                                widget.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: text,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3,
                                ),
                              ),
                            Text(
                              widget.message,
                              // Three lines: a relayed Shopify checkout error
                              // in Arabic runs past two, and truncating the
                              // reason is worse than a slightly taller card.
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: text.withValues(alpha: 0.86),
                                fontSize: 13,
                                height: 1.35,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
