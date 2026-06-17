import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/app_update_service.dart';

/// Le Voile force-update popup.
///
/// Flow: message → "Update" → download progress bar → "Install & Restart"
/// (opens the Android package installer). Blocking when [AppUpdateInfo.forceUpdate].
class ForceUpdateDialog extends StatefulWidget {
  const ForceUpdateDialog({super.key, required this.info});

  final AppUpdateInfo info;

  static bool _isOpen = false;

  static Future<void> show(BuildContext context, AppUpdateInfo info) async {
    if (_isOpen) return;
    _isOpen = true;
    try {
      await showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (_) => ForceUpdateDialog(info: info),
      );
    } finally {
      _isOpen = false;
    }
  }

  @override
  State<ForceUpdateDialog> createState() => _ForceUpdateDialogState();
}

enum _Stage { idle, downloading, ready, error }

class _ForceUpdateDialogState extends State<ForceUpdateDialog> {
  _Stage _stage = _Stage.idle;
  double _progress = 0;
  String? _apkPath;
  final CancelToken _cancel = CancelToken();

  @override
  void dispose() {
    if (!_cancel.isCancelled) _cancel.cancel();
    super.dispose();
  }

  /// Production: open the Play Store / App Store (it installs + reopens the app
  /// itself, no "install unknown apps" prompt). Testing: download the APK.
  Future<void> _onUpdate() async {
    final store = widget.info.storeUrl.trim();
    if (store.isNotEmpty) {
      final uri = Uri.tryParse(store);
      if (uri != null) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return;
      }
    }
    await _startDownload();
  }

  Future<void> _startDownload() async {
    setState(() {
      _stage = _Stage.downloading;
      _progress = 0;
    });
    try {
      final file = await AppUpdateService.instance.downloadApk(
        widget.info.apkUrl,
        (p) {
          if (mounted) setState(() => _progress = p);
        },
        cancelToken: _cancel,
      );
      if (!mounted) return;
      setState(() {
        _apkPath = file.path;
        _stage = _Stage.ready;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _stage = _Stage.error);
    }
  }

  Future<void> _install() async {
    final path = _apkPath;
    if (path == null) return;
    await OpenFilex.open(path);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final force = widget.info.forceUpdate;

    return PopScope(
      canPop: !force,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update available',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: primary,
                ),
              ),
              if (widget.info.latestVersionName.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  'Version ${widget.info.latestVersionName}',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              _buildBody(theme, primary),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(ThemeData theme, Color primary) {
    switch (_stage) {
      case _Stage.idle:
        return Column(
          children: [
            Text(
              widget.info.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 22),
            _primaryButton('Update now', primary, _onUpdate),
            if (!widget.info.forceUpdate) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Later',
                  style: TextStyle(color: theme.colorScheme.secondary),
                ),
              ),
            ],
          ],
        );

      case _Stage.downloading:
        final pct = (_progress * 100).clamp(0, 100).toStringAsFixed(0);
        return Column(
          children: [
            Text(
              'Downloading update… $pct%',
              style: TextStyle(
                fontSize: 13.5,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _progress == 0 ? null : _progress,
                minHeight: 8,
                backgroundColor: primary.withOpacity(0.12),
                valueColor: AlwaysStoppedAnimation(primary),
              ),
            ),
          ],
        );

      case _Stage.ready:
        return Column(
          children: [
            Icon(Icons.check_circle_rounded, color: primary, size: 40),
            const SizedBox(height: 10),
            Text(
              'Download complete. Tap Install, confirm the prompt, '
              'then open Le Voile again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                height: 1.5,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 20),
            _primaryButton('Install update', primary, _install),
          ],
        );

      case _Stage.error:
        return Column(
          children: [
            Text(
              'Download failed. Please check your connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                height: 1.5,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 20),
            _primaryButton('Retry', primary, _startDownload),
          ],
        );
    }
  }

  Widget _primaryButton(String label, Color primary, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
