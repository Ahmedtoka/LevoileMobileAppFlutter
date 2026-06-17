import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';

import 'entities/animated_config_child.dart';
import 'entities/animated_stack_container_child.dart';
import 'entities/animated_ui_item.dart';
import 'exts/animated_child_ext.dart';
import 'exts/animated_property_ext.dart';
import 'exts/list_animated_ui_item_ext.dart';

class AnimatedStackContainer extends StatelessWidget {
  const AnimatedStackContainer({
    super.key,
    required this.animatedConfig,
    this.controller,
    this.builderCustom,
    this.onTapHandler,
    this.contentBuilder,
  });

  final AnimatedStackContainerData animatedConfig;
  final AnimatedStackContainerController? controller;
  final Widget Function(BuildContext context, Map<String, dynamic> config)?
  builderCustom;
  final FutureOr<void> Function(
    BuildContext context,
    Map<String, dynamic>? config,
  )?
  onTapHandler;
  final Widget Function(
    Widget content,
    (AnimatedConfigChild, int) parent,
    (AnimatedConfigChild, int?) child,
  )?
  contentBuilder;

  @override
  Widget build(BuildContext context) {
    final ctrl = controller ?? AnimatedStackContainerController();
    var config = animatedConfig;
    var isSmallScreen = false;
    var isLargeScreen = false;

    final sizeScreen = MediaQuery.sizeOf(context);
    isSmallScreen = sizeScreen.width < (config.smallScreenMaxWidth ?? 380.0);
    isLargeScreen = sizeScreen.width >= (config.largeScreenMinWidth ?? 1000);

    Widget bodyWidget = _AnimatedStackContainer(
      width: animatedConfig.width,
      height: animatedConfig.height,
      controller: ctrl,
      fitBody: animatedConfig.fitBody,
      clipBorderRadius: BorderRadius.circular(
        animatedConfig.clipBorderRadius ?? 0.0,
      ),
      delayStart: Duration(milliseconds: animatedConfig.delayStart ?? 0),
      autoPlay: animatedConfig.autoPlay,
      margin: EdgeInsetsDirectional.only(
        start: animatedConfig.margin?.start ?? 0.0,
        top: animatedConfig.margin?.top ?? 0.0,
        end: animatedConfig.margin?.end ?? 0.0,
        bottom: animatedConfig.margin?.bottom ?? 0.0,
      ),
      padding: EdgeInsetsDirectional.only(
        start: animatedConfig.padding?.start ?? 0.0,
        top: animatedConfig.padding?.top ?? 0.0,
        end: animatedConfig.padding?.end ?? 0.0,
        bottom: animatedConfig.padding?.bottom ?? 0.0,
      ),
      background: animatedConfig.background?.build(
        context,
        isSmallScreen: isSmallScreen,
        isLargeScreen: isLargeScreen,
      ),
      decoration: animatedConfig.decoration != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(
                animatedConfig.decoration?.borderRadius ?? 0.0,
              ),
              boxShadow: animatedConfig.decoration?.boxShadows != null
                  ? [
                      BoxShadow(
                        color:
                            (animatedConfig.decoration?.boxShadows?.color ??
                                    const Color(0xFF000000))
                                .withValueOpacity(
                                  animatedConfig
                                          .decoration
                                          ?.boxShadows
                                          ?.opacity ??
                                      1.0,
                                ),
                        offset: Offset(
                          animatedConfig.decoration?.boxShadows?.offset.dx ??
                              0.0,
                          animatedConfig.decoration?.boxShadows?.offset.dy ??
                              0.0,
                        ),
                        blurRadius:
                            animatedConfig.decoration?.boxShadows?.blurRadius ??
                            0.0,
                        spreadRadius:
                            animatedConfig
                                .decoration
                                ?.boxShadows
                                ?.spreadRadius ??
                            0.0,
                      ),
                    ]
                  : null,
            )
          : null,
      children: List.generate(animatedConfig.children.length, (index) {
        final item = animatedConfig.children[index];
        final configChild = item.getMainConfig(isSmallScreen, isLargeScreen);
        final builder = contentBuilder;

        return AnimatedStackContainerChild(
          child: configChild.build(
            context,
            isSmallScreen: isSmallScreen,
            isLargeScreen: isLargeScreen,
            mainConfig: isSmallScreen || isLargeScreen ? item : null,
            builderCustom: builderCustom,
            builder: builder != null
                ? (content, data) {
                    return builder(content, (item, index), data);
                  }
                : null,
            onTapHandler: onTapHandler != null
                ? (context, config) {
                    if (config?['type'] == 'toogle_animation') {
                      ctrl.toogle();
                    } else {
                      onTapHandler!(context, config);
                    }
                  }
                : null,
          ),
          scripts: configChild.scripts,
        );
      }),
    );

    if (animatedConfig.actionConfig != null) {
      bodyWidget = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTapHandler!(context, animatedConfig.actionConfig),
        child: bodyWidget,
      );
    }

    return bodyWidget;
  }
}

/// _AnimatedStackContainer is a widget that animates a stack of children.
/// It provides a way to animate the position, opacity, alignment, size, and
/// position of the children in the stack.
///
/// The widget uses a `ChangeNotifier` to control the animation and a
/// `ListenableBuilder` to rebuild the widget when the animation changes.
///
/// The widget provides a way to control the animation using a `controller`
/// and a way to start the animation automatically using the `autoPlay` flag.
class _AnimatedStackContainer extends StatefulWidget {
  const _AnimatedStackContainer({
    required this.children,
    this.decoration,
    this.background,
    this.clipBorderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.delayStart = Duration.zero,
    this.controller,
    this.autoPlay = true,
    this.fitBody = StackFit.loose,
  });

  /// The controller of the animation.
  final AnimatedStackContainerController? controller;

  /// The children of the stack.
  final List<AnimatedStackContainerChild> children;

  /// The clip border radius of the children.
  final BorderRadius? clipBorderRadius;

  /// The decoration of the children.
  final Decoration? decoration;

  /// The background of the children.
  final Widget? background;

  /// The delay start of the animation.
  final Duration delayStart;

  /// The padding of the children.
  final EdgeInsetsGeometry? padding;

  /// The margin of the children.
  final EdgeInsetsGeometry? margin;

  /// The width of the children.
  final double? width;

  /// The height of the children.
  final double? height;

  /// The auto play of the animation.
  final bool autoPlay;

  /// The fit body of the stack.
  final StackFit fitBody;

  @override
  State<_AnimatedStackContainer> createState() =>
      _AnimatedStackContainerState();
}

class _AnimatedStackContainerState extends State<_AnimatedStackContainer> {
  final _parentKey = UniqueKey();
  late final _controller =
      widget.controller ?? AnimatedStackContainerController();
  final _listAnimatedUiItem = <String, List<AnimatedUiItem>>{};
  int _maxDelay = 0;

  void _listenerController() {
    final isStart = _controller._useFirst;
    for (var i = 0; i < _listAnimatedUiItem.entries.length; i++) {
      final item = _listAnimatedUiItem.entries.elementAt(i);
      for (var j = 0; j < item.value.length; j++) {
        final itemAnimated = item.value[j];

        /// get max delay
        _maxDelay = max(_maxDelay, itemAnimated.script.delay.inMilliseconds);
        var durationDelay = itemAnimated.script.delay;
        if (isStart) {
          durationDelay = Duration(
            milliseconds: _maxDelay - durationDelay.inMilliseconds,
          );
        }

        Future.delayed(durationDelay, () {
          _listAnimatedUiItem['key-$i']![j] = itemAnimated.copyWith(
            isStart: _controller._useFirst,
          );

          if (mounted) {
            setState(() {});
          }
        });
      }
    }
  }

  void _updateStateCompletedAnimation() {
    var isCompleted = true;
    for (var i = 0; i < _listAnimatedUiItem.entries.length; i++) {
      final item = _listAnimatedUiItem.entries.elementAt(i);
      for (var j = 0; j < item.value.length; j++) {
        isCompleted =
            isCompleted && _listAnimatedUiItem['key-$i']![j].isStart == false;
      }
    }

    widget.controller?.setCompletedAnimation(isCompleted);
  }

  void _convertToAnimatedUiItem() {
    for (var i = 0; i < widget.children.length; i++) {
      final items = widget.children[i].scripts;
      final hashKey = 'key-$i';
      _listAnimatedUiItem[hashKey] ??= [];
      for (var script in items ?? []) {
        _listAnimatedUiItem[hashKey]!.add(
          AnimatedUiItem(
            keyHash: hashKey,
            script: script,
            isStart: _controller.isFirst,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _convertToAnimatedUiItem();
    _controller.addListener(_listenerController);

    if (widget.autoPlay && _controller.isFirst) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(widget.delayStart, () {
          _controller.toogle();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, snapshot) {
        _updateStateCompletedAnimation();

        return Container(
          width: widget.width,
          margin: widget.margin,
          height: widget.height,
          decoration: widget.decoration,
          child: ClipRRect(
            borderRadius: widget.clipBorderRadius ?? BorderRadius.zero,
            child: Stack(
              fit: widget.fitBody,
              children: [
                if (widget.background != null)
                  Positioned.fill(child: widget.background!),
                ...List.generate(widget.children.length, (index) {
                  final item = widget.children[index];
                  final properties = _listAnimatedUiItem['key-$index'];
                  if (properties == null || properties.isEmpty) {
                    return item.child;
                  }

                  Widget child = Padding(
                    padding: widget.padding ?? EdgeInsets.zero,
                    child: item.child,
                  );
                  final listProperties = properties.sortPosition();

                  for (var itemAnimated in listProperties) {
                    child = itemAnimated.script.build(
                      context,
                      child: child,
                      key: '${index.toString()}-$_parentKey',
                      isStart: itemAnimated.isStart,
                    );
                  }

                  return child;
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// AnimatedStackContainerController is a controller for the
/// `AnimatedStackContainer` widget.
class AnimatedStackContainerController extends ChangeNotifier {
  bool _useFirst = true;
  bool _isCompletedAnimation = false;

  bool get isFirst => _useFirst;
  bool get isCompletedAnimation => _isCompletedAnimation;

  void toogle() {
    _useFirst = !_useFirst;
    notifyListeners();
  }

  void setCompletedAnimation(bool value) {
    _isCompletedAnimation = value;
  }
}
