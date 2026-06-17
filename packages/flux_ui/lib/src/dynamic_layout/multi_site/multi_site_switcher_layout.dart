import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';

import '../../entities/entities.dart';
import '../../widgets/flux_image.dart';
import 'multi_site_mixin_action.dart';

/// Dynamic layout widget for multi-site selection
///
/// This widget renders a horizontal scrollable list of site selection items
/// with configurable styling and behavior based on MultiSiteSwitcherConfig.
///
/// Rendering Logic:
/// - If config.stores is empty: uses default rendering with site icons
/// - If config.stores is not empty: uses config-based rendering with:
///   - Custom images and selected states
///   - Folder validation against available MultiSiteConfig list
///   - Fallback to default rendering for invalid configs
class MultiSiteSwitcherLayout extends StatefulWidget {
  const MultiSiteSwitcherLayout({
    super.key,
    this.multiSiteConfig,
    this.multiSiteConfigs,
    required this.onChanged,
    required this.onError,
    this.config,
  });

  /// Currently selected multi-site configuration
  final MultiSiteConfig? multiSiteConfig;

  /// List of all available multi-site configurations to choose from
  final List<MultiSiteConfig>? multiSiteConfigs;

  /// Layout configuration that defines styling and store-specific settings
  final MultiSiteSwitcherConfig? config;

  /// Callback function called when user selects a different site configuration
  final Future<void> Function(MultiSiteConfig?) onChanged;

  /// Callback function called when an error occurs during site switching
  final Future<void> Function(String) onError;

  @override
  State<MultiSiteSwitcherLayout> createState() =>
      _MultiSiteSwitcherLayoutState();
}

class _MultiSiteSwitcherLayoutState
    extends MultiSiteMixinAction<MultiSiteSwitcherLayout> {
  /// Cache map to store available store configs for performance optimization
  final Map _hashMapAvaliableStore = {};

  @override
  void onBack() {}

  @override
  Future<void> onChanged(MultiSiteConfig? config) async {
    await widget.onChanged(config);
  }

  @override
  Future<void> onError(String error) async {
    await widget.onError(error);
  }

  @override
  MultiSiteConfig? get initConfig => widget.multiSiteConfig;

  /// Gets the layout configuration with fallback to empty config
  MultiSiteSwitcherConfig get _configLayout =>
      widget.config ?? MultiSiteSwitcherConfig(jsonConfig: {}, stores: []);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _configLayout.backgroundColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: _configLayout.spacing,
            children:
                widget.multiSiteConfigs?.map((e) {
                  final isSelected = multiSiteConfig?.name == e.name;

                  // Check if stores config is not empty and use config-based rendering
                  if (_configLayout.stores.isNotEmpty) {
                    return _buildConfigBasedItem(context, e, isSelected);
                  }

                  // Default rendering when stores config is empty
                  return _buildDefaultItem(context, e, isSelected);
                }).toList() ??
                [],
          ),
        ),
      ),
    );
  }

  /// Build item using config-based rendering
  ///
  /// This method renders store items according to MultiSiteSwitcherConfig:
  /// - Validates store config by matching folder with siteConfig.configFolder
  /// - Uses caching to optimize performance for repeated lookups
  /// - Uses custom images, colors, and styling from config
  /// - Falls back to default rendering if config is invalid or not found
  Widget _buildConfigBasedItem(
    BuildContext context,
    MultiSiteConfig siteConfig,
    bool isSelected,
  ) {
    // Find matching store config by folder with caching
    MultiSiteSwitcherStoreConfig? storeConfig;

    if (_hashMapAvaliableStore.containsKey(siteConfig.configFolder) == false) {
      storeConfig = _configLayout.stores.firstWhereOrNull(
        (store) => store.folder == siteConfig.configFolder,
      );

      _hashMapAvaliableStore.addAll({siteConfig.configFolder: storeConfig});
    } else {
      storeConfig = _hashMapAvaliableStore[siteConfig.configFolder];
    }

    // If no matching store config found, use default rendering
    if (storeConfig == null || storeConfig.isEmpty) {
      return _buildDefaultItem(context, siteConfig, isSelected);
    }

    return InkWell(
      onTap: () => _onTapSelectSite(siteConfig),
      borderRadius: BorderRadius.circular(_configLayout.borderRadius ?? 8),
      child: Container(
        decoration: BoxDecoration(
          color: _getSelectedColor(context, storeConfig, isSelected),
          borderRadius: BorderRadius.circular(_configLayout.borderRadius ?? 8),
          border: Border.all(color: Theme.of(context).dividerColor, width: 0.6),
        ),
        child: FluxImage(
          imageUrl: _getImageUrl(storeConfig, isSelected),
          width: _configLayout.widthButton,
          height: _configLayout.heightButton ?? 35.0,
          fit: _configLayout.fit,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  /// Build item using default rendering
  ///
  /// This method renders store items using the original logic when:
  /// - config.stores is empty, or
  /// - no matching store config is found for the current site
  /// Uses siteConfig.icon and theme colors for styling
  Widget _buildDefaultItem(
    BuildContext context,
    MultiSiteConfig siteConfig,
    bool isSelected,
  ) {
    return InkWell(
      onTap: () => _onTapSelectSite(siteConfig),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).dividerColor, width: 0.6),
        ),
        width: _configLayout.widthButton,
        height: _configLayout.heightButton,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            FluxImage(
              imageUrl: siteConfig.icon!,
              width: 20,
              height: 15,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(2),
            ),
            const SizedBox(width: 10),
            Text(
              siteConfig.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.w800 : null,
                color: isSelected
                    ? Theme.of(context).primaryColor.getColorBasedOnBackground
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSelectSite(MultiSiteConfig siteConfig) {
    if (!isApplying && multiSiteConfig?.name != siteConfig.name) {
      _switchSite(siteConfig);
    }
  }

  /// Get the appropriate image URL based on selection state
  ///
  /// Returns imageSelected if the item is selected and has a valid imageSelected,
  /// otherwise returns the default image URL
  String _getImageUrl(
    MultiSiteSwitcherStoreConfig storeConfig,
    bool isSelected,
  ) {
    if (isSelected && storeConfig.useStateWithImage) {
      return storeConfig.imageSelected!;
    }
    return storeConfig.image;
  }

  /// Get the appropriate color based on selection state and config
  ///
  /// Logic:
  /// - If not selected: returns cardColor
  /// - If selected and has imageSelected: returns cardColor (image handles the visual state)
  /// - If selected without imageSelected: returns colorSelected or falls back to primaryColor
  Color _getSelectedColor(
    BuildContext context,
    MultiSiteSwitcherStoreConfig storeConfig,
    bool isSelected,
  ) {
    if (!isSelected) {
      return Theme.of(context).cardColor;
    }

    // If imageSelected exists, use it for selected state (color will be handled by image)
    if (storeConfig.useStateWithImage) {
      return Theme.of(context).cardColor;
    }

    // Use colorSelected if available, otherwise fallback to primary color
    return storeConfig.colorSelected ?? Theme.of(context).primaryColor;
  }

  /// Handle site switching with a small delay for better UX
  ///
  /// This method updates the selected site and applies the change
  /// with a 100ms delay to provide smooth visual feedback
  void _switchSite(MultiSiteConfig siteConfig) {
    selectSite(siteConfig);
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      apply(context);
    });
  }
}
