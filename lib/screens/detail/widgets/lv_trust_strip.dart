import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/app_model.dart';

/// Le Voile — the reassurance row under the buy buttons on the product page
/// (Fast Delivery · Easy Returns · Secure Payment · Cash on Delivery).
///
/// Driven entirely by the dashboard (Product Trust Strip screen), read from
/// Setting.ProductTrustItems. Renders nothing when the list is empty, so the
/// admin can switch the whole strip off without an app release.
class LvTrustStrip extends StatelessWidget {
  /// Side inset. Pass 0 from a layout that already sits inside a horizontally
  /// padded parent, otherwise the two insets stack and the columns get ~10%
  /// narrower than in the other layouts.
  final double horizontalPadding;

  const LvTrustStrip({this.horizontalPadding = 15, super.key});

  /// Icon names the dashboard is allowed to choose from. MUST stay in sync
  /// with TrustStore::ICONS in the Laravel dashboard — an unknown name falls
  /// back to the delivery van rather than drawing nothing.
  static IconData _iconFor(String name) {
    switch (name) {
      case 'returns':
        return Icons.assignment_return_rounded;
      case 'secure':
        return Icons.lock_rounded;
      case 'cash':
        return Icons.payments_rounded;
      case 'support':
        return Icons.headset_mic_rounded;
      case 'quality':
        return Icons.verified_rounded;
      case 'gift':
        return Icons.card_giftcard_rounded;
      case 'store':
        return Icons.storefront_rounded;
      case 'delivery':
      default:
        return Icons.local_shipping_rounded;
    }
  }

  List<Map> _items(BuildContext context) {
    try {
      // listen: true — AppModel is a ChangeNotifier and the config is refetched
      // on resume and on the `config_update` push, so an open product page has
      // to pick the new strip up. With listen: false it kept the stale one
      // until something unrelated happened to rebuild this subtree.
      final raw = Provider.of<AppModel>(context)
          .appConfig
          ?.settings
          .productTrustItems;
      return (raw ?? const [])
          .whereType<Map>()
          .where((e) => (e['label']?.toString().trim() ?? '').isNotEmpty)
          .toList();
    } catch (_) {
      // Config not loaded yet — show nothing rather than a half-built strip.
      return const [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items(context);
    if (items.isEmpty) return const SizedBox.shrink();

    final primary = Theme.of(context).primaryColor;

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 18, horizontalPadding, 6),
      child: Row(
        // Forced LTR so the items appear in the ORDER THE ADMIN ARRANGED them.
        // The whole app is wrapped in Directionality(rtl) (see app.dart), which
        // would otherwise mirror the row and put the first dashboard item on
        // the right — the opposite of the dashboard's own preview.
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items)
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF6E9E4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _iconFor(item['icon']?.toString() ?? 'delivery'),
                      size: 17,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['label']?.toString().trim() ?? '',
                    textAlign: TextAlign.center,
                    // Every child is Expanded, so a long label never throws a
                    // RenderFlex overflow — it just silently clips. Cap the
                    // lines and ellipsise so a squeezed column reads as
                    // shortened rather than as a broken word.
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3A2A28),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
