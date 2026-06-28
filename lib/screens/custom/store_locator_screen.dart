import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A single Le Voile store.
class _Branch {
  final String name;
  final String address;
  final String phone;
  final String maps;
  const _Branch(this.name, this.address, this.phone, this.maps);
}

/// A city / area grouping a set of stores.
class _Area {
  final String city;
  final List<_Branch> branches;
  const _Area(this.city, this.branches);
}

const List<_Area> _areas = [
  _Area('Heliopolis', [
    _Branch('El Marghany', '126 El-Marghany St., Next to Shawermer',
        '01094538159', 'https://goo.gl/maps/EbSV5rzAqCvvyAD37'),
    _Branch('El Hegaz',
        '7 Ali Abd El-Razek St., Parallel to Ammar Ibn Yasser St',
        '01063498056', 'https://goo.gl/maps/RFo6gESFKDgjSN8x5'),
  ]),
  _Area('Nasr City', [
    _Branch('Abbas El Akkad',
        '35 Ezzat Salama St., End of Hussein Heikal St., Abbas El-Akkad',
        '01094170690', 'https://goo.gl/maps/uRQpbNA7naTHhCTL8'),
    _Branch('Nozha Street', '4 El Nozha St., Infront of Mobil benzene',
        '01033741083', 'https://goo.gl/maps/ke5Vm5KVU3EdYNZL8'),
    _Branch('Abbas El Akkad', '13 Abbas El-Akkad St.', '01033184102',
        'https://goo.gl/maps/7jYr5nZrJrPJ2nMP9'),
    _Branch('Gnena Mall', 'Abbas el-Akkad St., Nasr City', '01070989182',
        'https://maps.app.goo.gl/WrN3iHDgPuXSzbhe8'),
    _Branch('City Stars Mall', 'Masaken Al Mohandesin, Nasr City',
        '01070998545', 'https://maps.app.goo.gl/ye6Zpbeyfg3tiww49'),
  ]),
  _Area('5th Settlement', [
    _Branch('Galleria Mall',
        '90 St., Tagamoa Al-Khames, Galleria Mall, Beside Dunkin Donuts',
        '01050092640', 'https://goo.gl/maps/hbdMCHMB5KHYUEm47'),
    _Branch('Point 90 Mall', '1st floor, Booth F-K-27, Infront of H&M',
        '01050092670', 'https://goo.gl/maps/tLnvK5x94vECEjx28'),
    _Branch('El Rebat Mall', 'North 90, 5th Settlement, New Cairo',
        '01040026013', 'https://maps.app.goo.gl/eUkmVDgkhRYwE3GXA'),
  ]),
  _Area('El Rehab', [
    _Branch('The Yard Mall', 'Next to Gate 6, First floor, Clinic 116',
        '01070989214', 'https://maps.app.goo.gl/sH5PRan3jnPRR3Y29'),
  ]),
  _Area('Madinaty', [
    _Branch('Open Air Mall', 'Open Air Mall A, Second New Cairo',
        '01030221108', 'https://goo.gl/maps/hKZtKUxdJzK8PkRL8'),
  ]),
  _Area('El Mokkatam', [
    _Branch('Mokkatam 1', '11571 Street 9, Al Abageyah, El Khalifa',
        '01023959862', 'https://goo.gl/maps/8THdBS9xTGkZZeLx5'),
    _Branch('Mokkatam 2', '28 Street 9, Al Abageyah, El Khalifa', '01013425577',
        'https://www.google.com/maps?q=30.0140549,31.2855332'),
  ]),
  _Area('Maadi', [
    _Branch('Maadi 1', '11 Laselky St., Next to Club Aldo', '01060915685',
        'https://goo.gl/maps/kt1S4CDRBaMPbdXXA'),
    _Branch('Maadi 2',
        '4D, 4 El Nasr Street, New Maadi, Below Starbucks – Next to LG',
        '01066619656', 'https://maps.app.goo.gl/tRmMQLDYP4yZReuW8'),
  ]),
  _Area('El Mohandessin', [
    _Branch('Mohandessin Store', '41 Shehab St., Agouza, Giza', '01063716436',
        'https://goo.gl/maps/L5k7bgbxzCaWZhia8'),
  ]),
  _Area('6th of October', [
    _Branch('Mall of Egypt', 'El Wahat Rd, Next to H&M, Second Floor',
        '01033852064', 'https://goo.gl/maps/e1pVwnAyiB9ZFgho6'),
    _Branch('Mall of Arabia', 'Gate 23, Beside Virgin Megastore',
        '01030211223', 'https://goo.gl/maps/AXuaQ33epVyMct3q7'),
    _Branch('Saraya Mall',
        'Sheikh Zayed City, 1st floor, Next to Seoudi Market', '01033298717',
        'https://goo.gl/maps/xUbXFNGw8YTQpk9s5'),
  ]),
  _Area('Alexandria', [
    _Branch('El Ekbal', '4 Al Ekbal St., San Stefano', '01099116756',
        'https://goo.gl/maps/LyADBFggYLRnpVn8A'),
    _Branch('Smouha', '26 Mostafa Kamel St., Smouha, Sidi Gaber',
        '01050338942', 'https://goo.gl/maps/vi8zGPdKpDm49DJH9'),
    _Branch('Miami', '276 Gamal Abd El-naser St., Miami', '01050338947',
        'https://goo.gl/maps/n9LLaMSExXoTjWDQ7'),
    _Branch('San Stefano Mall', 'Unit G 44, ground floor', '01067725537',
        'https://maps.app.goo.gl/78LQoJFBdPc1hPns6'),
  ]),
  _Area('Mansoura', [
    _Branch('Mansoura Store', 'Al Mashaya, Al Sofleya St., El Mansoura',
        '01023079073', 'https://goo.gl/maps/6fE297hqST5SL4qL9'),
  ]),
  _Area('Zagazig', [
    _Branch('Zagazig Store', '2 Ibn Khaldoun St., Al Salam District II',
        '01030227355', 'https://goo.gl/maps/TzxaCEBhjidSTKxSA'),
  ]),
];

class StoreLocatorScreen extends StatelessWidget {
  const StoreLocatorScreen({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    // Open externally so map links route to the Maps app (not an in-app/web
    // view). canLaunchUrl is intentionally skipped — on iOS it can return a
    // false negative for https links and block the launch.
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final totalStores =
        _areas.fold<int>(0, (sum, a) => sum + a.branches.length);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Our Branches',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: Row(
              children: [
                Icon(Icons.storefront_rounded, color: primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  '$totalStores stores across Egypt',
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          for (final area in _areas) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    area.city,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            for (final b in area.branches) _branchCard(context, b, primary),
          ],
        ],
      ),
    );
  }

  Widget _branchCard(BuildContext context, _Branch b, Color primary) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 4, 14, 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            b.name,
            style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined,
                  size: 16, color: theme.colorScheme.secondary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  b.address,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  label: 'Call',
                  icon: Icons.call_rounded,
                  filled: true,
                  primary: primary,
                  onTap: () => _launch('tel:${b.phone}'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _actionButton(
                  label: 'Directions',
                  icon: Icons.directions_rounded,
                  filled: false,
                  primary: primary,
                  onTap: () => _launch(b.maps),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required IconData icon,
    required bool filled,
    required Color primary,
    required VoidCallback onTap,
  }) {
    return Material(
      color: filled ? primary : primary.withOpacity(0.08),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: filled ? Colors.white : primary),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: filled ? Colors.white : primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
