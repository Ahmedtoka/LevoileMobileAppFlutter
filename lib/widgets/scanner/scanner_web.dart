// Stub implementation for web platform to avoid build errors
import 'package:flutter/material.dart';

class QRViewController {
  Future<void> resumeCamera() async {}
  Future<void> pauseCamera() async {}
  void dispose() {}
  Stream<Barcode> get scannedDataStream => const Stream.empty();
}

class Barcode {
  final String? code;
  const Barcode({this.code});
}

class QRView extends StatelessWidget {
  final Widget? overlay;
  final Function(QRViewController)? onQRViewCreated;
  final Function(QRViewController, bool)? onPermissionSet;

  const QRView({
    super.key,
    this.overlay,
    this.onQRViewCreated,
    this.onPermissionSet,
  });

  @override
  Widget build(BuildContext context) {
    // Web placeholder - shows a message that QR scanning is not available on web
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'QR code scanning is not available on web',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Please use a mobile device to scan QR codes',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class QrScannerOverlayShape {
  const QrScannerOverlayShape();
}
