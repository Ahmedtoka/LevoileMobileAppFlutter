import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/constants.dart';
import '../../models/index.dart' show BackDropArguments;
import '../../routes/flux_navigate.dart';
import '../../services/popup_service.dart';

/// Renders a dashboard-controlled announcement popup (text or image) with an
/// optional call-to-action button.
class AnnouncementPopup {
  static bool _open = false;

  static Future<void> show(
    BuildContext context,
    LvPopupItem popup, {
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) async {
    if (_open) return;
    _open = true;
    try {
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true,
        builder: (_) => _AnnouncementDialog(
          popup: popup,
          onAction: onAction,
          onDismiss: onDismiss,
        ),
      );
    } finally {
      _open = false;
    }
  }
}

class _AnnouncementDialog extends StatelessWidget {
  const _AnnouncementDialog({
    required this.popup,
    this.onAction,
    this.onDismiss,
  });

  final LvPopupItem popup;
  final VoidCallback? onAction;
  final VoidCallback? onDismiss;

  Color _color(String hex, Color fallback) {
    var h = hex.replaceAll('#', '').trim();
    if (h.length == 6) h = 'FF$h';
    final v = int.tryParse(h, radix: 16);
    return v == null ? fallback : Color(v);
  }

  String _gid(String v) =>
      v.startsWith('gid://') ? v : 'gid://shopify/Collection/$v';

  Future<void> _runAction(BuildContext context) async {
    onAction?.call();
    final target = popup.buttonTarget.trim();
    // Keep a navigator context that survives the dialog closing.
    final rootContext = Navigator.of(context, rootNavigator: true).context;
    Navigator.of(context).pop();

    switch (popup.buttonAction) {
      case 'url':
        if (target.isNotEmpty) {
          final uri = Uri.tryParse(target);
          if (uri != null) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        }
        break;
      case 'collection':
        if (target.isNotEmpty) {
          FluxNavigate.pushNamed(
            RouteList.backdrop,
            arguments: BackDropArguments(
              cateId: _gid(target),
              cateName: popup.heading.isNotEmpty ? popup.heading : 'Collection',
            ),
            context: rootContext,
          );
        }
        break;
      case 'product':
        // Web/product link — open externally when it's a URL.
        if (target.startsWith('http')) {
          final uri = Uri.tryParse(target);
          if (uri != null) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        }
        break;
      default:
        break;
    }
  }

  void _dismiss(BuildContext context) {
    onDismiss?.call();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isImage = popup.type == 'image' && popup.image.isNotEmpty;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 26),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          isImage ? _buildImage(context) : _buildText(context),
          // Close button
          PositionedDirectional(
            top: -6,
            end: -6,
            child: GestureDetector(
              onTap: () => _dismiss(context),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 6),
                  ],
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.close, size: 18, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    final bg = _color(popup.bgColor, Theme.of(context).primaryColor);
    final fg = _color(popup.textColor, Colors.white);
    final hasButton = popup.buttonText.trim().isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (popup.heading.isNotEmpty)
            Text(
              popup.heading,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: fg,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
          if (popup.body.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              popup.body,
              textAlign: TextAlign.center,
              style: TextStyle(color: fg.withOpacity(0.92), fontSize: 14.5, height: 1.5),
            ),
          ],
          if (hasButton) ...[
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => _runAction(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: bg,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  popup.buttonText,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final hasButton = popup.buttonText.trim().isNotEmpty;
    final tappable = popup.buttonAction != 'none';

    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: tappable ? () => _runAction(context) : null,
              // Use a finite width — FluxImage crashes on double.infinity
              // (computes a cache width via toInt() on Infinity).
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : MediaQuery.of(context).size.width;
                  return FluxImage(
                    imageUrl: popup.image,
                    fit: BoxFit.fitWidth,
                    width: w,
                  );
                },
              ),
            ),
            if (popup.heading.isNotEmpty || popup.body.isNotEmpty || hasButton)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (popup.heading.isNotEmpty)
                      Text(
                        popup.heading,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    if (popup.body.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        popup.body,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.5,
                          height: 1.5,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                    if (hasButton) ...[
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => _runAction(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            popup.buttonText,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
