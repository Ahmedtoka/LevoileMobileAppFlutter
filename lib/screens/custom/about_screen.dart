import 'package:flutter/material.dart';

/// Le Voile — native "About Us" page with a chic vertical timeline.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const List<_Milestone> _milestones = [
    _Milestone(
      icon: Icons.auto_stories_rounded,
      title: 'Our Story',
      body:
          'In 2004, scarf options were poor — so Mrs. Sara Hesham decided to '
          'create the scarves she dreamed of wearing. With courage, creativity '
          'and perseverance, Mr. Said & Mrs. Sara paved the way for a new vision '
          'of what modest fashion should look like.\n\n'
          'Over the years, Le Voile expanded globally — importing from Turkey, '
          'Paris, China, India & Dubai, and exporting to the USA & UAE. Born in a '
          'small shop, the brand now has 21 branches across Egypt and a strong '
          'presence on Instagram & Facebook. As one of the top leading brands, Le '
          'Voile is distinguished by a mix of well-priced, good-quality products '
          'that fulfil both veiled & unveiled ladies.',
    ),
    _Milestone(
      icon: Icons.groups_rounded,
      title: 'Our Team',
      body:
          'To meet our customers’ growing needs and support our expansion, we '
          'have built a highly focused, customer-oriented team — now reaching 400 '
          'members — and we are continuously seeking new talents to strengthen '
          'the team.',
    ),
    _Milestone(
      icon: Icons.favorite_rounded,
      title: 'Our Mission',
      body:
          'Le Voile aims for every woman to feel her best self through our '
          'outstanding products. By reclaiming our narratives and leading with '
          'modesty, we look forward to pushing our culture forward — reaching '
          'both veiled & unveiled women across the region by continuously '
          'delivering the highest quality products with great value and '
          'high-level customer care.',
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
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Hero
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primary, primary.withOpacity(0.78)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/app_icon_transparent.png',
                  height: 50,
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Modest fashion, beautifully curated',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          // Stats
          Transform.translate(
            offset: const Offset(0, -22),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _stat('2004', 'Since', primary),
                    _divider(theme),
                    _stat('21', 'Branches', primary),
                    _divider(theme),
                    _stat('400+', 'Team', primary),
                  ],
                ),
              ),
            ),
          ),

          // Timeline
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Column(
              children: [
                for (var i = 0; i < _milestones.length; i++)
                  _TimelineTile(
                    milestone: _milestones[i],
                    primary: primary,
                    isLast: i == _milestones.length - 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String value, String label, Color primary) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _divider(ThemeData theme) => Container(
        width: 1,
        height: 34,
        color: theme.colorScheme.secondary.withOpacity(0.15),
      );
}

class _Milestone {
  final IconData icon;
  final String title;
  final String body;
  const _Milestone({
    required this.icon,
    required this.title,
    required this.body,
  });
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({
    required this.milestone,
    required this.primary,
    required this.isLast,
  });

  final _Milestone milestone;
  final Color primary;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Node + connecting line
          Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [primary, primary.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(milestone.icon, color: Colors.white, size: 22),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.5,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: primary.withOpacity(0.2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          // Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.secondary.withOpacity(0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    milestone.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    milestone.body,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.55,
                      color: theme.colorScheme.onSurface.withOpacity(0.85),
                    ),
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
