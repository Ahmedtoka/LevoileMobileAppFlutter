import 'package:flutter/material.dart';

import '../../entities/entities.dart';

abstract class MultiSiteMixinAction<T extends StatefulWidget> extends State<T> {
  MultiSiteConfig? get initConfig;
  Future<void> onChanged(MultiSiteConfig? config);
  Future<void> onError(String error);
  void onBack();

  late MultiSiteConfig? _multiSiteConfig = initConfig;
  bool _isApplying = false;

  bool get isApplying => _isApplying;
  MultiSiteConfig? get multiSiteConfig => _multiSiteConfig;

  void selectSite(MultiSiteConfig config) {
    setState(() {
      _multiSiteConfig = config;
    });
  }

  Future apply(BuildContext context) async {
    try {
      setState(() {
        _isApplying = true;
      });

      await onChanged(_multiSiteConfig);

      onBack();
    } catch (e) {
      setState(() {
        _isApplying = false;
      });

      await onError(e.toString());
    }
  }
}
