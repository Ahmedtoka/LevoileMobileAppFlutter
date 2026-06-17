import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Le Voile — native "Contact Us" page.
///
/// Elegant brand-styled screen with quick WhatsApp / Email / Call actions and
/// a short message box that opens WhatsApp with the text pre-filled.
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  // ---- Le Voile contact details ----
  static const String _whatsappNumber = '01050092630';
  static const String _whatsappIntl = '201050092630'; // wa.me format (EG +20)
  static const String _email = 'Customersupport@levoilestores.com';

  final TextEditingController _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _sendWhatsApp() {
    final text = _messageCtrl.text.trim();
    final encoded = Uri.encodeComponent(
      text.isEmpty ? 'Hello Le Voile, I have an inquiry.' : text,
    );
    _launch('https://wa.me/$_whatsappIntl?text=$encoded');
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
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 18),
            child: Center(
              child: Image.asset(
                'assets/images/app_icon_transparent.png',
                height: 64,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'We’d love to hear from you',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: primary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'For any inquiry please reach us through any of the channels below.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.5, height: 1.4, color: muted),
          ),
          const SizedBox(height: 22),

          // Quick action cards
          _ContactCard(
            icon: Icons.chat_rounded,
            iconBg: const Color(0xFF25D366),
            title: 'WhatsApp',
            subtitle: _whatsappNumber,
            primary: primary,
            onTap: () => _launch('https://wa.me/$_whatsappIntl'),
          ),
          _ContactCard(
            icon: Icons.call_rounded,
            iconBg: primary,
            title: 'Call us',
            subtitle: _whatsappNumber,
            primary: primary,
            onTap: () => _launch('tel:$_whatsappNumber'),
          ),
          _ContactCard(
            icon: Icons.mail_rounded,
            iconBg: primary,
            title: 'Email',
            subtitle: _email,
            primary: primary,
            onTap: () => _launch('mailto:$_email'),
          ),

          const SizedBox(height: 24),

          // Message box
          Text(
            'Send us a message',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: muted.withOpacity(0.18)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
              controller: _messageCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your message here…',
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: _sendWhatsApp,
              icon: const Icon(Icons.send_rounded, size: 20),
              label: const Text(
                'Send via WhatsApp',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.primary,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBg;
  final String title;
  final String subtitle;
  final Color primary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: theme.colorScheme.secondary.withOpacity(0.12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
