import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/coupon_service.dart';

/// Le Voile — "My Coupons" page in My Account. Shows the device's welcome
/// coupon and whether it is still valid (unused) or already redeemed (used).
class MyCouponsScreen extends StatefulWidget {
  const MyCouponsScreen({super.key});

  @override
  State<MyCouponsScreen> createState() => _MyCouponsScreenState();
}

class _MyCouponsScreenState extends State<MyCouponsScreen> {
  @override
  void initState() {
    super.initState();
    // Pull the latest used/unused status from the dashboard.
    CouponService.instance.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Coupons',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder<List<LvCoupon>>(
        valueListenable: CouponService.instance.coupons,
        builder: (context, coupons, _) {
          if (coupons.isEmpty) {
            return _empty(theme);
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
            children: [
              for (final c in coupons) ...[
                _CouponCard(coupon: c, primary: primary),
                const SizedBox(height: 14),
              ],
              const SizedBox(height: 4),
              _infoRow(
                Icons.info_outline_rounded,
                'Show the coupon code at checkout or at the branch to redeem.',
                theme,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _empty(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.confirmation_number_outlined,
                size: 56, color: theme.colorScheme.secondary.withOpacity(0.4)),
            const SizedBox(height: 14),
            Text(
              'No coupons yet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Your welcome coupon will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: theme.primaryColor),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              height: 1.4,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _CouponCard extends StatelessWidget {
  const _CouponCard({required this.coupon, required this.primary});
  final LvCoupon coupon;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final used = coupon.used;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: used
            ? null
            : LinearGradient(
                colors: [primary, primary.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        color: used ? const Color(0xFFF1F1F1) : null,
        boxShadow: [
          if (!used)
            BoxShadow(
              color: primary.withOpacity(0.3),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        coupon.name.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                          color: used ? Colors.grey : Colors.white70,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: used
                            ? Colors.grey.withOpacity(0.25)
                            : Colors.white.withOpacity(0.22),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        used
                            ? 'Used'
                            : (coupon.isWelcome ? 'First-time use' : 'For you'),
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: used ? Colors.grey[700] : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  '${coupon.discount}% OFF',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: used ? Colors.grey[500] : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      coupon.redeemLocation == 'online'
                          ? Icons.shopping_bag_outlined
                          : Icons.storefront_outlined,
                      size: 14,
                      color: used ? Colors.grey : Colors.white70,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      coupon.redeemLabel,
                      style: TextStyle(
                        fontSize: 12,
                        color: used ? Colors.grey : Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Dashed divider look
          Container(height: 1, color: Colors.white24),
          // Code area
          Container(
            width: double.infinity,
            color: used
                ? Colors.white.withOpacity(0.6)
                : Colors.white.withOpacity(0.15),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coupon.code,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    decoration: used ? TextDecoration.lineThrough : null,
                    color: used ? Colors.grey : Colors.white,
                  ),
                ),
                if (!used) ...[
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: coupon.code));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Coupon code copied'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Icon(Icons.copy_rounded,
                        size: 20, color: Colors.white),
                  ),
                ],
              ],
            ),
          ),
          if (coupon.phone.isNotEmpty)
            Container(
              width: double.infinity,
              color: used
                  ? Colors.white.withOpacity(0.6)
                  : Colors.white.withOpacity(0.10),
              padding: const EdgeInsets.only(bottom: 12, top: 2),
              child: Text(
                'Linked to ${coupon.phone}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: used ? Colors.grey : Colors.white70,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
