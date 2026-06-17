import 'package:flutter/material.dart';

import '../../entities/multi_site.dart';
import 'multi_site_item.dart';

class MultiSiteSelection extends StatelessWidget {
  const MultiSiteSelection({
    super.key,
    this.enabled,
    this.selected,
    required this.onChanged,
    required this.multiSiteConfigs,
  });
  final bool? enabled;
  final MultiSiteConfig? selected;
  final List<MultiSiteConfig>? multiSiteConfigs;
  final Function(MultiSiteConfig) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          multiSiteConfigs
              ?.map(
                (e) => MultiSiteItem(
                  multiSiteConfig: e,
                  selected: selected?.name == e.name,
                  onTap: (MultiSiteConfig config) =>
                      enabled == true ? _selectSite(config) : null,
                ),
              )
              .toList() ??
          [],
    );
  }

  void _selectSite(MultiSiteConfig config) {
    onChanged(config);
  }
}
