// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../core/localization/localization.dart';
import '../../entities/multi_site.dart';
import 'multi_site_selection.dart';

class MultiSiteSelectionScreen extends StatefulWidget {
  const MultiSiteSelectionScreen({
    super.key,
    required this.config,
    required this.multiSiteConfigs,
    required this.onChanged,
    required this.onError,
  });

  final MultiSiteConfig? config;
  final List<MultiSiteConfig>? multiSiteConfigs;
  final Future<void> Function(MultiSiteConfig?) onChanged;
  final Future<void> Function(String) onError;

  @override
  State<MultiSiteSelectionScreen> createState() =>
      _MultiSiteSelectionScreenState();
}

class _MultiSiteSelectionScreenState extends State<MultiSiteSelectionScreen> {
  late MultiSiteConfig? _multiSiteConfig = widget.config;
  bool _isApplying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: Text(F.of(context).selectStore),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: MultiSiteSelection(
                    enabled: !_isApplying,
                    selected: _multiSiteConfig,
                    onChanged: _selectSite,
                    multiSiteConfigs: widget.multiSiteConfigs,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () => _apply(context),
                child: _isApplying
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Text(F.of(context).apply),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _selectSite(MultiSiteConfig config) {
    setState(() {
      _multiSiteConfig = config;
    });
  }

  Future _apply(BuildContext context) async {
    try {
      setState(() {
        _isApplying = true;
      });

      await widget.onChanged(_multiSiteConfig);

      Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _isApplying = false;
      });

      await widget.onError(e.toString());
    }
  }
}
