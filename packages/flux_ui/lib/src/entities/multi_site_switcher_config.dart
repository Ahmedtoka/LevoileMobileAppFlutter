import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';

import '../core/converters/box_fit_converter.dart';

/// Configuration class for multi-site layout rendering
///
/// This class defines the layout configuration for multi-site selection UI,
/// including styling properties and store-specific configurations.
///
/// Logic:
/// - If [stores] is empty, uses default rendering logic
/// - If [stores] is not empty, renders items according to config:
///   - Validates store config against available MultiSiteConfig list
///   - If folder exists in config, renders with custom styling
///   - Uses [imageSelected] when available for selected state
///   - Falls back to [colorSelected] or primary theme color if no imageSelected
class MultiSiteSwitcherConfig {
  /// Original JSON configuration data
  final Map jsonConfig;

  /// Background color for the layout container
  final HexColor? backgroundColor;

  /// List of store-specific configurations
  final List<MultiSiteSwitcherStoreConfig> stores;

  /// Border radius for store items
  final double? borderRadius;

  /// Image fit mode for store icons
  final BoxFit fit;

  /// Width of store selection buttons
  final double? widthButton;

  /// Height of store selection buttons
  final double? heightButton;

  /// Spacing between store items
  final double spacing;

  MultiSiteSwitcherConfig({
    required this.jsonConfig,
    this.backgroundColor,
    required this.stores,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.widthButton,
    this.heightButton,
    this.spacing = 10.0,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'jsonConfig': jsonConfig});
    if (backgroundColor != null) {
      result.addAll({'backgroundColor': backgroundColor!.toJson()});
    }
    result.addAll({'stores': stores.map((x) => x.toJson()).toList()});
    if (borderRadius != null) {
      result.addAll({'borderRadius': borderRadius});
    }

    result.addAll({'fit': const BoxFitConverter().toJson(fit)});
    result.addAll({'widthButton': widthButton});
    result.addAll({'heightButton': heightButton});
    result.addAll({'spacing': spacing});
    return result;
  }

  factory MultiSiteSwitcherConfig.fromJson(Map<String, dynamic> map) {
    return MultiSiteSwitcherConfig(
      jsonConfig: Map.from(map),
      backgroundColor: map['backgroundColor']?.toString().toColor(),
      stores: map['stores'] is List
          ? List<MultiSiteSwitcherStoreConfig>.from(
              map['stores']?.map(
                (x) => MultiSiteSwitcherStoreConfig.fromJson(
                  Map<String, dynamic>.from(x),
                ),
              ),
            )
          : <MultiSiteSwitcherStoreConfig>[],
      borderRadius: double.tryParse(map['borderRadius'].toString()),
      fit:
          const BoxFitConverter().fromJson(map['fit']?.toString()) ??
          BoxFit.cover,
      widthButton: double.tryParse(map['widthButton'].toString()),
      heightButton: double.tryParse(map['heightButton'].toString()),
      spacing: double.tryParse(map['spacing'].toString()) ?? 10.0,
    );
  }

  factory MultiSiteSwitcherConfig.tryParseFromJson(Map map) {
    try {
      final data = Map<String, dynamic>.from(map);
      return MultiSiteSwitcherConfig.fromJson(data);
    } catch (e, t) {
      printError('$e\n $t');

      return MultiSiteSwitcherConfig(jsonConfig: {}, stores: []);
    }
  }
}

/// Configuration for individual store in multi-site layout
///
/// This class defines the configuration for each store item in the multi-site
/// selection UI, including images and colors for different states.
///
/// The rendering logic:
/// - [folder] must match MultiSiteConfig.configFolder for validation
/// - [image] is used as the default state image
/// - [imageSelected] is used when the store is selected (if available)
/// - [colorSelected] is used as background color when selected (if no imageSelected)
/// - Falls back to theme primary color if neither imageSelected nor colorSelected
class MultiSiteSwitcherStoreConfig {
  /// Folder name that matches MultiSiteConfig.configFolder
  final String folder;

  /// Default image URL for the store
  final String image;

  /// Optional image URL used when store is selected
  final String? imageSelected;

  /// Optional background color used when store is selected (if no imageSelected)
  final HexColor? colorSelected;

  MultiSiteSwitcherStoreConfig({
    required this.folder,
    required this.image,
    this.imageSelected,
    this.colorSelected,
  });

  /// Returns true if the store config is invalid (missing folder or image)
  bool get isEmpty => folder.isEmpty || image.isEmpty;

  /// Returns true if the store has a valid imageSelected for selected state
  bool get useStateWithImage => imageSelected?.isNotEmpty ?? false;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'folder': folder});
    result.addAll({'image': image});
    if (imageSelected != null) {
      result.addAll({'imageSelected': imageSelected});
    }
    if (colorSelected != null) {
      result.addAll({'colorSelected': colorSelected!.toJson()});
    }

    return result;
  }

  factory MultiSiteSwitcherStoreConfig.fromJson(Map<String, dynamic> map) {
    return MultiSiteSwitcherStoreConfig(
      folder: map['folder'] ?? '',
      image: map['image'] ?? '',
      imageSelected: map['imageSelected'],
      colorSelected: map['colorSelected']?.toString().toColor(),
    );
  }
}
