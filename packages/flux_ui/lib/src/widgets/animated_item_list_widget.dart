import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

const _timeLoad = 200;

class AnimatedItemList extends StatefulWidget {
  const AnimatedItemList({
    super.key,
    required this.child,
    required this.config,
    this.keyItem,
  });

  final String? keyItem;
  final AnimatedItemListConfig config;
  final Widget child;
  static void destroy(String? groupKey) {
    if (groupKey?.isEmpty ?? true) {
      return;
    }

    final group = _nodes[groupKey];
    if (group != null) {
      for (var element in group) {
        if (element.animatedController?.isAnimating ?? false) {
          element.animatedController?.dispose();
        }
        element.animatedController = null;
      }
      _nodes.removeWhere((key, value) => key == groupKey);
    }
  }

  @override
  State<AnimatedItemList> createState() => _AnimatedItemList();

  static final Map<String, List<_NodeAnimatedStack>> _nodes = {};
}

class _AnimatedItemList extends State<AnimatedItemList>
    with SingleTickerProviderStateMixin {
  void _printLog(String label) {
    // log('---->[${widget.config.groupKey}][${widget.keyItem}][$hashCode] $label');
  }

  // Animation controller
  late AnimationController _animatedController;

  // Opacity animation
  late Animation<double> _opacityAnimation;

  // Global key to get the position of the widget
  final _globalKey = GlobalKey();

  // Time duration of the animation
  late final _timeDuration = widget.config.duration;

  // Visibility of the widget
  bool _isVisible = false;

  // Scroll direction of the widget
  bool _isScrollUp = false;

  // Disposed of the widget
  bool _isDisposed = false;

  // Enable animation of the widget
  bool _enableAnimation = true;

  // Position of the widget
  Offset? _position;

  // Random dx of the widget
  double? _randomDx;

  // Group key of the widget
  late final String _groupKey =
      widget.config.groupKey ??
      'animated_stack_container${UniqueKey().toString()}';

  // Key item of the widget
  late final String _keyItem = widget.keyItem ?? 'itemKey${UniqueKey()}';

  // Check use manual key
  bool get isUseManualKey => widget.keyItem != null;

  /// get list nodes by group key
  List<_NodeAnimatedStack> get _nodes {
    if (AnimatedItemList._nodes[_groupKey] == null) {
      AnimatedItemList._nodes[_groupKey] = [];
    }

    return AnimatedItemList._nodes[_groupKey]!;
  }

  /// This function checks if the node already exists and adds a new node if it does not.
  bool isExistOrCreateNewNode() {
    _animatedController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _timeDuration),
    );

    _printLog('isExistOrCreateNewNode : $_indexNode');

    if (_indexNode >= 0) {
      _nodes[_indexNode] = _nodes[_indexNode].copyWith(
        animatedController: _animatedController,
        forwardAnimation: _forwardAnimation,
      );

      _printLog('isExistOrCreateNewNode : $_indexNode --> exist node');
      return true;
    }

    _printLog('isExistOrCreateNewNode : $_indexNode --> not exist node');
    _createNewNode();
    return false;
  }

  _NodeAnimatedStack _createNewNode() {
    _printLog('_createNewNode : $_indexNode ');
    final node = _NodeAnimatedStack(
      keyItem: _keyItem,
      animatedController: _animatedController,
      forwardAnimation: _forwardAnimation,
    );

    _nodes.add(node);
    _printLog('_createNewNode done: ${_nodes.length} ');
    return node;
  }

  int get _indexNode {
    return _nodes.indexWhere((element) => element.keyItem == widget.keyItem);
  }

  _NodeAnimatedStack? get _previousNode {
    if (_indexNode > 0) {
      return _nodes[_indexNode - 1];
    }

    return null;
  }

  _NodeAnimatedStack get _node {
    if (_indexNode >= 0) {
      return _nodes[_indexNode];
    }

    return _createNewNode();
  }

  _NodeAnimatedStack? get _nextNode {
    final nextIndex = _indexNode + 1;

    if (nextIndex < _nodes.length) {
      return _nodes[nextIndex];
    }

    return null;
  }

  void _checkCallForwardForNextNode() {
    final statusAnimation = _animatedController.status;
    final isCompleted = statusAnimation == AnimationStatus.completed;

    if (isCompleted) {
      // When the current node finishes running, it will sequentially
      // find the next node to run. The next node can be either the next
      // node in the list or a previous node, depending on the data found.
      if (_nextNode?.isCanForward ?? false) {
        // Run the next node in the list
        _printLog('_checkCallForwardForNextNode : $_indexNode --> next node');

        _forwardAnimation(
          index: _indexNode + 1,
          labelDebug: 'checkCallForwardForNextNode - call next node',
        );
      } else if (_previousNode != null && _previousNode!.isCanForward) {
        // Run the previous node in the list
        _printLog(
          '_checkCallForwardForNextNode : $_indexNode --> previous node',
        );

        _forwardAnimation(
          index: _indexNode - 1,
          labelDebug: 'checkCallForwardForNextNode - call previous node',
        );
      } else {
        // When the current node has finished running the animation and
        // cannot find the next node, will it continue to check if
        // there are any nodes within the render area that
        // have not been executed?
        // - If scrolling up, find the first node
        // - If scrolling down, find the last node
        var indexItemVisibleAndNotActive = -1;
        if (_isScrollUp) {
          _printLog('_checkCallForwardForNextNode : $_indexNode --> scroll up');

          indexItemVisibleAndNotActive = _nodes.indexWhere(
            (element) => element.isCanForward,
          );
        } else {
          indexItemVisibleAndNotActive = _nodes.lastIndexWhere(
            (element) => element.isCanForward,
          );
        }

        _forwardAnimation(
          index: indexItemVisibleAndNotActive,
          labelDebug:
              'checkCallForwardForNextNode - call node visible and not active',
        );
      }
    }
  }

  /// Check the node list, if no active node is found, then start processing.
  void _handleNotFoundNode() {
    final isAnyActive = _nodes.any((element) => element.isActive);

    // Not found active node
    if (isAnyActive == false) {
      // Scroll up, find the last visible node
      if (_isScrollUp) {
        final lastIndexVisible = _nodes.lastIndexWhere(
          (element) => element.isVisible,
        );
        _forwardAnimation(
          index: lastIndexVisible,
          labelDebug: 'handleNotFoundNode - scroll up',
        );
      } else {
        // Scroll down, find the first visible node
        final indexFirstVisible = _nodes.indexWhere(
          (element) => element.isVisible,
        );
        _forwardAnimation(
          index: indexFirstVisible,
          labelDebug: 'handleNotFoundNode - scroll down',
        );
      }
    }
  }

  void _forwardAnimation({int? index, String? labelDebug}) {
    if (labelDebug?.isNotEmpty ?? false) {
      // ignore: avoid_print
      print('_forwardAnimation: $labelDebug');
    }
    final indexCurrent = index ?? _indexNode;

    if (_isDisposed || indexCurrent == -1 || _enableAnimation == false) {
      return;
    }
    if (labelDebug?.isNotEmpty ?? false) {
      // ignore: avoid_print
      print(
        '_forwardAnimation: active node [${_nodes[indexCurrent].animatedController != null}]',
      );
    }
    _nodes[indexCurrent] = _nodes[indexCurrent].copyWith(isActive: true);
    _nodes[indexCurrent].animatedController?.forward();
  }

  /// Update position to check scroll direction
  void _updateScrollUp() {
    if (_isDisposed == false) {
      final box = context.findRenderObject() as RenderBox;
      final pos = box.globalToLocal(Offset.zero);
      final position = Offset(-pos.dx, -pos.dy);
      if (_position != null) {
        // If the position is greater than the previous position,
        // it means the list is scrolling up
        _isScrollUp = _position!.dy > position.dy;
      }
      _position = position;
    }
  }

  @override
  void initState() {
    super.initState();

    // If not exist node, create new node
    final isExist = isExistOrCreateNewNode();

    // If not exist node or onlyUseAnimatedFirstLoaded is false, disable animation
    _enableAnimation =
        isExist == false || widget.config.onlyUseAnimatedFirstLoaded == false;

    // If animation is disabled, set begin to 0
    _opacityAnimation = Tween<double>(
      begin: _enableAnimation ? 1 : 0,
      end: 0,
    ).animate(_animatedController);

    // Process to start the first node.
    if (_nodes.isNotEmpty && _nodes.first.isActive == false) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _forwardAnimation(labelDebug: 'initState');
      });
    }

    // Listen to the animation state to handle further.
    _animatedController.addStatusListener((status) {
      _checkCallForwardForNextNode();
    });
  }

  @override
  void dispose() {
    _printLog('dispose');
    _isDisposed = true;
    _animatedController.dispose();
    if (widget.config.groupKey == null) {
      AnimatedItemList.destroy(_groupKey);
    }

    _nodes[_indexNode] = _nodes[_indexNode].copyWith(
      animatedController: null,
      forwardAnimation: null,
      isActive: false,
      isVisible: false,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final useAnimatedSlide = widget.config.animatedOptions
        .map((e) => e.type)
        .toList()
        .contains(AniamtedOptionStyle.slide);

    return VisibilityDetector(
      key: Key(_keyItem),
      onVisibilityChanged: (visibilityInfo) {
        // Update scroll direction
        _updateScrollUp();

        // Update visibility
        _isVisible = visibilityInfo.visibleFraction > 0;

        // If the current node is in a Visible state and isActive = false,
        // then check the 2 nodes before and after. If either of these 2 nodes
        // has isCompletedForward = true, then proceed to run the current node.
        if (_isVisible && _node.isActive == false) {
          final previousNodeCompletedForward =
              _previousNode?.isCompletedForward ?? false;
          final nextNodeCompletedForward =
              _nextNode?.isCompletedForward ?? false;

          // If either of these 2 nodes has isCompletedForward = true,
          if (previousNodeCompletedForward || nextNodeCompletedForward) {
            _forwardAnimation(
              labelDebug:
                  'onVisibilityChanged - next or previous node completed',
            );
          } else {
            // If not, then find the first node that is not active and run it.
            _handleNotFoundNode();
          }
        }

        if (_indexNode >= 0) {
          // Update the node to the list to set isVisible
          _nodes[_indexNode] = _nodes[_indexNode].copyWith(
            isVisible: _isVisible,
          );
        }
      },
      child: AnimatedBuilder(
        key: _globalKey,
        animation: _animatedController,
        builder: (context, child) {
          var body = widget.child;

          if (_enableAnimation) {
            for (var element in widget.config.animatedOptions) {
              switch (element.type) {
                case AniamtedOptionStyle.fadeIn:
                  final timeDuration = element.duration ?? _timeDuration;
                  _printLog('AnimatedOpacity: ${1 - _opacityAnimation.value}');
                  body = AnimatedOpacity(
                    opacity: 1 - _opacityAnimation.value,
                    duration: Duration(milliseconds: timeDuration),
                    child: body,
                  );
                  break;

                case AniamtedOptionStyle.slide:
                  // If use animated slide and element current is not slide, then skip
                  if (useAnimatedSlide && element.isSlide == false) {
                    break;
                  }

                  body = SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: const Offset(0, 0),
                    ).animate(_animatedController),
                    child: body,
                  );

                  break;
                case AniamtedOptionStyle.slideRandom:
                  // If use animated slide, then skip
                  if (useAnimatedSlide) {
                    break;
                  }

                  // Get random dx
                  _randomDx ??= math.Random().nextBool() ? 1.0 : -1.0;

                  body = SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(_randomDx!, 0),
                      end: const Offset(0, 0),
                    ).animate(_animatedController),
                    child: body,
                  );

                  break;
                case AniamtedOptionStyle.slideVertical:
                  if (useAnimatedSlide && element.isSlideVertical == false) {
                    break;
                  }

                  final dx = _indexNode % 2 == 0 ? -1.0 : 1.0;

                  body = SlideTransition(
                    position:
                        Tween<Offset>(
                          begin: Offset(dx, 0),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: _animatedController,
                            curve: Curves.elasticInOut,
                          ),
                        ),
                    child: body,
                  );

                  break;
              }
            }
          }

          return Container(decoration: const BoxDecoration(), child: body);
        },
      ),
    );
  }
}

class _NodeAnimatedStack {
  final String keyItem;
  AnimationController? animatedController;
  int? duration;
  bool isVisible = false;
  bool isActive = false;
  void Function({int? index})? forwardAnimation;

  _NodeAnimatedStack({
    required this.keyItem,
    this.animatedController,
    this.duration,
    this.isVisible = false,
    this.isActive = false,
    this.forwardAnimation,
  });

  _NodeAnimatedStack copyWith({
    String? keyItem,
    AnimationController? animatedController,
    int? duration,
    bool? isVisible,
    bool? isActive,
    void Function({int? index})? forwardAnimation,
  }) {
    return _NodeAnimatedStack(
      keyItem: keyItem ?? this.keyItem,
      animatedController: animatedController ?? this.animatedController,
      duration: duration ?? this.duration,
      forwardAnimation: forwardAnimation ?? this.forwardAnimation,
      isVisible: isVisible ?? this.isVisible,
      isActive: isActive ?? this.isActive,
    );
  }

  bool get isCanForward {
    return isVisible && isActive == false;
  }

  bool get isCompletedForward {
    return animatedController?.status == AnimationStatus.completed;
  }
}

class AnimatedItemListConfig {
  final String? groupKey;
  final bool onlyUseAnimatedFirstLoaded;
  final int duration;
  late final List<AnimatedOption> _animatedOptions;

  List<AnimatedOption> get animatedOptions => _animatedOptions;

  AnimatedItemListConfig({
    this.groupKey,
    List<AnimatedOption>? animatedOptions,
    this.onlyUseAnimatedFirstLoaded = true,
    this.duration = _timeLoad,
  }) {
    _animatedOptions = animatedOptions ?? AnimatedOption.defaults;
  }

  static AnimatedItemListConfig? tryParse(dynamic json, {String? groupKey}) {
    if (json is Map) {
      List<AnimatedOption>? animatedOptions;
      if (json['animatedOptions'] == null) {
        animatedOptions = AnimatedOption.defaults;
      } else {
        try {
          animatedOptions = json['animatedOptions']
              .map((e) => AnimatedOption.fromJson(e))
              .toList();
        } catch (e) {
          animatedOptions = AnimatedOption.defaults;
        }
      }

      return AnimatedItemListConfig(
        animatedOptions: animatedOptions,
        groupKey: groupKey,
        duration:
            num.tryParse(json['duration'].toString())?.toInt() ?? _timeLoad,
        onlyUseAnimatedFirstLoaded:
            bool.tryParse(json['onlyUseAnimatedFirstLoaded'].toString()) ??
            true,
      );
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'groupKey': groupKey,
      'onlyUseAnimatedFirstLoaded': onlyUseAnimatedFirstLoaded,
      'duration': duration,
      'animatedOptions': animatedOptions.map((e) => e.toJson()).toList(),
    };
  }

  AnimatedItemListConfig copyWith({
    String? groupKey,
    bool? onlyUseAnimatedFirstLoaded,
    int? duration,
    List<AnimatedOption>? animatedOptions,
  }) {
    return AnimatedItemListConfig(
      groupKey: groupKey ?? this.groupKey,
      onlyUseAnimatedFirstLoaded:
          onlyUseAnimatedFirstLoaded ?? this.onlyUseAnimatedFirstLoaded,
      duration: duration ?? this.duration,
      animatedOptions: animatedOptions ?? _animatedOptions,
    );
  }
}

class AnimatedOption {
  final AniamtedOptionStyle type;
  final int? duration;

  const AnimatedOption({required this.type, this.duration});

  bool get isSlide => type.isSlide;
  bool get isSlideRandom => type.isSlideRandom;
  bool get isSlideVertical => type.isSlideVertical;
  bool get isFadeIn => type.isFadeIn;

  Map<String, dynamic> toJson() {
    return {'type': type.name, 'duration': duration};
  }

  static AnimatedOption fromJson(Map<String, dynamic> json) {
    return AnimatedOption(
      type: AniamtedOptionStyle.fromString(json['type']),
      duration: num.tryParse(json['duration'].toString())?.toInt(),
    );
  }

  factory AnimatedOption.fadeIn({int? duration}) {
    return AnimatedOption(type: AniamtedOptionStyle.fadeIn, duration: duration);
  }

  factory AnimatedOption.slide() {
    return const AnimatedOption(type: AniamtedOptionStyle.slide);
  }

  factory AnimatedOption.slideRandom() {
    return const AnimatedOption(type: AniamtedOptionStyle.slideRandom);
  }

  factory AnimatedOption.slideVertical() {
    return const AnimatedOption(type: AniamtedOptionStyle.slideVertical);
  }

  static List<AnimatedOption> get defaults {
    return [AnimatedOption.fadeIn(), AnimatedOption.slide()];
  }
}

enum AniamtedOptionStyle {
  fadeIn,
  slide,
  slideRandom,
  slideVertical;

  bool get isSlide => this == AniamtedOptionStyle.slide;
  bool get isSlideRandom => this == AniamtedOptionStyle.slideRandom;
  bool get isSlideVertical => this == AniamtedOptionStyle.slideVertical;
  bool get isFadeIn => this == AniamtedOptionStyle.fadeIn;

  factory AniamtedOptionStyle.fromString(dynamic name) {
    try {
      return AniamtedOptionStyle.values.byName('$name');
    } catch (e) {
      return AniamtedOptionStyle.fadeIn;
    }
  }
}
