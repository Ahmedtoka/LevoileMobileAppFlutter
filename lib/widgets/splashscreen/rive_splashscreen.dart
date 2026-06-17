import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';

// TODO: Upgrade to Rive 0.14.0
// Ref: https://rive.app/docs/runtimes/flutter/migration-guide#version-0-14-0
class RiveSplashScreen extends StatefulWidget {
  final VoidCallback onSuccess;
  final Function(dynamic error, dynamic stacktrace)? onError;
  final String imageUrl;
  final Color? color;
  final String animationName;
  final int duration;
  final Color backgroundColor;
  final BoxFit boxFit;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;

  const RiveSplashScreen({
    super.key,
    required this.onSuccess,
    required this.imageUrl,
    required this.animationName,
    this.onError,
    this.color,
    this.duration = 1000,
    this.backgroundColor = Colors.white,
    this.boxFit = BoxFit.contain,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
  });

  @override
  State<RiveSplashScreen> createState() => _RiveSplashScreenState();
}

class _RiveSplashScreenState extends State<RiveSplashScreen> {
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then((_) {
      _loadInit();
    });
  }

  Future<void> _loadInit() async {
    try {
      if (mounted) {
        var data;
        if (widget.imageUrl.startsWith('http')) {
          var readBytes = await http.readBytes(Uri.parse(widget.imageUrl));
          data = ByteData.sublistView(readBytes);
        } else {
          data = await rootBundle.load(widget.imageUrl);
        }
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(
          _controller = SimpleAnimation(widget.animationName),
        );

        if (mounted) {
          setState(() {
            _riveArtboard = artboard;
          });
        }

        // Fix hang issue from splash screen, need to call onSuccess without require _controller
        await Future.delayed(Duration(milliseconds: widget.duration));

        widget.onSuccess.call();
      }
    } catch (error, stacktrace) {
      widget.onError?.call(error, stacktrace);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: widget.backgroundColor,
      padding: EdgeInsets.only(
        top: widget.paddingTop,
        bottom: widget.paddingBottom,
        left: widget.paddingLeft,
        right: widget.paddingRight,
      ),
      child: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard!, fit: widget.boxFit),
      ),
    );
  }
}
