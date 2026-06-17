import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';

const _itemSize = 22.0;

class CountDownTimer extends StatefulWidget {
  final Duration countdownDuration;
  final VoidCallback? onEnd;

  final Widget Function(
    BuildContext context,
    Widget countdownWidget,
    bool isEnd,
  )?
  builder;

  const CountDownTimer(
    this.countdownDuration, {
    super.key,
    this.onEnd,
    this.builder,
  });

  @override
  StateCountDownTimer createState() => StateCountDownTimer();
}

class StateCountDownTimer extends State<CountDownTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.countdownDuration,
      vsync: this,
    );
    animation = Tween<double>(
      begin: widget.countdownDuration.inMilliseconds.toDouble(),
      end: 0,
    ).animate(controller);
    controller.addStatusListener(_statusListener);
    controller.forward();
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onEnd?.call();
    }
  }

  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countdownDuration != widget.countdownDuration) {
      controller.duration = widget.countdownDuration;
      animation = Tween<double>(
        begin: widget.countdownDuration.inMilliseconds.toDouble(),
        end: 0,
      ).animate(controller);
      controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    controller.removeStatusListener(_statusListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          final value = Duration(milliseconds: animation.value.toInt());
          if (value.inMilliseconds <= 0) {
            const child = SizedBox();
            return widget.builder?.call(context, child, true) ?? child;
          }
          final seconds = value.inSeconds % 60;
          final minutes = value.inMinutes % 60;
          final hours = value.inHours % 24;
          final days = value.inDays;

          final listView = days > 0
              ? [days, ':', hours, ':', minutes, ':', seconds]
              : [hours, ':', minutes, ':', seconds];

          final child = Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: listView.map((item) {
              return item == ':'
                  ? _buildSeparator(context, item)
                  : _buildTimeContainer(context, item);
            }).toList(),
          );

          return widget.builder?.call(context, child, false) ?? child;
        },
      ),
    );
  }

  Widget _buildSeparator(BuildContext context, dynamic item) {
    return Container(
      alignment: Alignment.center,
      height: _itemSize,
      child: Text(
        '$item',
        style: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _buildTimeContainer(BuildContext context, dynamic item) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
      constraints: const BoxConstraints(
        minWidth: _itemSize,
        minHeight: _itemSize,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withValueOpacity(0.7),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        '$item'.padLeft(2, '0'),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
