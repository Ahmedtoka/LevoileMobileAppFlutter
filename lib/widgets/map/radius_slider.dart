import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:inspireui/extensions/color_extension.dart';

class RadiusSlider extends StatefulWidget {
  final Function(double)? onCallBack;
  final Future<void> Function()? moveToCurrentPos;
  final double? minRadius;
  final double? maxRadius;
  final double? currentVal;
  final Decoration? decoration;
  final bool showRadiusSlider;

  const RadiusSlider({
    super.key,
    this.onCallBack,
    this.minRadius,
    this.maxRadius,
    this.currentVal,
    this.moveToCurrentPos,
    this.decoration,
    this.showRadiusSlider = true,
  });

  @override
  State<RadiusSlider> createState() => _RadiusSliderState();
}

class _RadiusSliderState extends State<RadiusSlider> {
  double? currentVal;
  bool _isLoading = false;

  @override
  void initState() {
    currentVal = widget.currentVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsetsDirectional.only(end: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration:
          widget.decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).cardColor,
          ),
      child: Row(
        children: [
          if (widget.showRadiusSlider) ...[
            Flexible(
              child: Slider(
                max: widget.maxRadius!,
                min: widget.minRadius!,
                onChanged: (double value) {
                  currentVal = value;
                  widget.onCallBack!(value);
                },
                value: currentVal!,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.withValueOpacity(0.6),
              ),
              child: Text(
                S.of(context).distance(currentVal!.toStringAsFixed(2)),
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
            ),
          ],
          if (widget.moveToCurrentPos != null) ...[
            const SizedBox(width: 10),
            InkWell(
              onTap: _isLoading
                  ? null
                  : () async {
                      setState(() => _isLoading = true);
                      await widget.moveToCurrentPos?.call();
                      setState(() => _isLoading = false);
                    },
              child: _isLoading
                  ? const SizedBox(
                      width: 36.0,
                      height: 36.0,
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      ),
                    )
                  : const Icon(
                      Icons.my_location_outlined,
                      color: Colors.grey,
                      size: 36.0,
                    ),
            ),
          ],
        ],
      ),
    );
  }
}
