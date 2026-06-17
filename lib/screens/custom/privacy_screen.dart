import 'package:flutter/material.dart';

/// Le Voile — native "Privacy Policy" page.
///
/// Professionally drafted for an online fashion store. Review and adjust any
/// wording (especially the contact details and data-retention periods) to match
/// your legal requirements.
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  static const List<_Section> _sections = [
    _Section(
      'Introduction',
      'Le Voile ("we", "us", or "our") respects your privacy and is committed '
          'to protecting your personal data. This Privacy Policy explains how we '
          'collect, use, and safeguard your information when you use our mobile '
          'application and services.',
    ),
    _Section(
      'Information We Collect',
      'We may collect the following information:\n'
          '• Personal details you provide, such as your name, phone number, '
          'email address, and shipping address.\n'
          '• Order and transaction details when you make a purchase.\n'
          '• Device and usage information, such as device type, app version, and '
          'interactions within the app.',
    ),
    _Section(
      'How We Use Your Information',
      'We use your information to:\n'
          '• Process and deliver your orders.\n'
          '• Provide customer support and respond to your inquiries.\n'
          '• Send order updates and, with your consent, promotional offers.\n'
          '• Improve our products, services, and app experience.',
    ),
    _Section(
      'Sharing Your Information',
      'We do not sell your personal data. We may share it only with trusted '
          'partners who help us operate our business — such as payment processors '
          'and shipping companies — and only to the extent necessary to fulfil '
          'your order, or where required by law.',
    ),
    _Section(
      'Payments & Security',
      'Payments are processed securely through our trusted payment providers. We '
          'do not store your full card details on our servers. We apply '
          'appropriate technical and organisational measures to protect your '
          'information against unauthorised access, loss, or misuse.',
    ),
    _Section(
      'Cookies & Tracking',
      'Our app and website may use cookies and similar technologies to remember '
          'your preferences, keep your cart, and understand how the app is used '
          'so we can improve it.',
    ),
    _Section(
      'Your Rights',
      'You may request to access, correct, or delete your personal data, and you '
          'can opt out of marketing messages at any time. To exercise these '
          'rights, contact us using the details below.',
    ),
    _Section(
      'Data Retention',
      'We keep your personal data only for as long as necessary to provide our '
          'services and meet legal, accounting, or reporting obligations.',
    ),
    _Section(
      'Children’s Privacy',
      'Our services are intended for adults. We do not knowingly collect personal '
          'data from children under the age of 18.',
    ),
    _Section(
      'Changes to This Policy',
      'We may update this Privacy Policy from time to time. Any changes will be '
          'posted within the app, and your continued use means you accept the '
          'updated policy.',
    ),
    _Section(
      'Contact Us',
      'If you have any questions about this Privacy Policy or your data, please '
          'contact us:\n'
          '• WhatsApp: 01050092630\n'
          '• Email: Customersupport@levoilestores.com',
    ),
  ];

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
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 14),
            child: Center(
              child: Image.asset(
                'assets/images/app_icon_transparent.png',
                height: 48,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            child: Text(
              'Your privacy matters to us',
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(height: 18),
          for (var i = 0; i < _sections.length; i++)
            _SectionCard(
              index: i + 1,
              section: _sections[i],
              primary: primary,
            ),
        ],
      ),
    );
  }
}

class _Section {
  final String title;
  final String body;
  const _Section(this.title, this.body);
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.index,
    required this.section,
    required this.primary,
  });

  final int index;
  final _Section section;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.secondary.withOpacity(0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$index',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            section.body,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.55,
              color: theme.colorScheme.onSurface.withOpacity(0.85),
            ),
          ),
        ],
      ),
    );
  }
}
