import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Le Voile — native "Exchange & Return Policy" page.
///
/// Brand-styled, easy to scan. The most important rules (14-day window and the
/// non-returnable products) are pulled out into highlighted callouts so they
/// stand out clearly.
class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  // Products that cannot be exchanged or returned.
  static const List<String> _nonReturnable = [
    'Inner caps',
    'Turban',
    'Basic wear',
    'Pins',
    'Extensions',
    'Hijab accessories',
    'Burkini / Cover Ups',
  ];

  // ---- Le Voile contact details (same as Contact Us / My Account) ----
  static const String _whatsappNumber = '01050092630';
  static const String _whatsappIntl = '201050092630'; // wa.me format (EG +20)

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// Bottom popup offering Call us / WhatsApp — same style as My Account.
  void _showContactSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (popupContext) {
        final primary = Theme.of(context).primaryColor;
        final secondary = Theme.of(context).colorScheme.secondary;
        Widget action({
          required IconData icon,
          required Color iconColor,
          required String label,
          required VoidCallback onTap,
        }) {
          return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(popupContext).pop();
              onTap();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 24, color: iconColor),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }

        return CupertinoActionSheet(
          actions: [
            action(
              icon: Icons.chat_rounded,
              iconColor: const Color(0xFF25D366),
              label: 'WhatsApp',
              onTap: () => _launch('https://wa.me/$_whatsappIntl'),
            ),
            action(
              icon: Icons.call_rounded,
              iconColor: primary,
              label: 'Call us',
              onTap: () => _launch('tel:$_whatsappNumber'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: Navigator.of(popupContext).pop,
            isDestructiveAction: true,
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final muted = theme.colorScheme.secondary;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Exchange & Return',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          // Highlight banner: 14 days (page starts here)
          Container(
            margin: const EdgeInsets.only(top: 6, bottom: 22),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primary, primary.withOpacity(0.82)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: primary.withOpacity(0.28),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.event_available_rounded,
                      color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exchange or Refund within 14 days',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'From the date of purchase',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Delivery policy
          _SectionTitle(text: 'Delivery Policy', primary: primary),
          const SizedBox(height: 8),
          _NoticeCard(
            color: const Color(0xFFB54708),
            bg: const Color(0xFFFFF4E5),
            icon: Icons.local_shipping_rounded,
            child: Text(
              'Please note that it’s not allowed to open the package upon '
              'delivery, and partial acceptance of the order is not permitted.',
              style: TextStyle(
                fontSize: 13.5,
                height: 1.5,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Exchange & return rules
          _SectionTitle(text: 'Exchange & Return Policy', primary: primary),
          const SizedBox(height: 10),
          _Rule(primary: primary, text: 'The original receipt should be available.'),
          _Rule(
            primary: primary,
            text:
                'Delivery fees are applied on any cancellation or return orders '
                'if the order is already shipped.',
          ),
          _Rule(
            primary: primary,
            text: 'The product has to be in its original and unused status.',
            emphasis: 'original and unused',
          ),
          _Rule(
            primary: primary,
            text:
                'The refunded amount is returned using the same payment method '
                'used in the purchase (cash or visa).',
          ),
          _Rule(
            primary: primary,
            text:
                'For items purchased under promotions or discounts, returns are '
                'not accepted — however, exchanges are allowed within 3 days of '
                'purchase.',
            emphasis: 'within 3 days',
          ),

          const SizedBox(height: 22),

          // Non-returnable products — strong red callout
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFDECEC),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE11D48), width: 1.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.block_rounded,
                        color: Color(0xFFE11D48), size: 22),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Cannot be exchanged or returned',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFB91C1C),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _nonReturnable
                      .map(
                        (p) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color(0xFFE11D48)
                                    .withOpacity(0.35)),
                          ),
                          child: Text(
                            p,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFB91C1C),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),
          Center(
            child: Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 12.5, color: muted),
                children: [
                  const TextSpan(text: 'For any help, '),
                  TextSpan(
                    text: 'Contact Us',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                      decorationColor: primary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _showContactSheet(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text, required this.primary});
  final String text;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 22,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard({
    required this.color,
    required this.bg,
    required this.icon,
    required this.child,
  });
  final Color color;
  final Color bg;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 10),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _Rule extends StatelessWidget {
  const _Rule({
    required this.primary,
    required this.text,
    this.emphasis,
  });
  final Color primary;
  final String text;
  final String? emphasis;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final base = TextStyle(
      fontSize: 13.8,
      height: 1.5,
      color: theme.colorScheme.onSurface,
    );

    Widget body;
    if (emphasis != null && text.contains(emphasis!)) {
      final parts = text.split(emphasis!);
      body = RichText(
        text: TextSpan(
          style: base,
          children: [
            TextSpan(text: parts[0]),
            TextSpan(
              text: emphasis,
              style: base.copyWith(
                fontWeight: FontWeight.w800,
                color: primary,
              ),
            ),
            if (parts.length > 1) TextSpan(text: parts[1]),
          ],
        ),
      );
    } else {
      body = Text(text, style: base);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(Icons.check_circle_rounded, size: 18, color: primary),
          ),
          const SizedBox(width: 10),
          Expanded(child: body),
        ],
      ),
    );
  }
}
