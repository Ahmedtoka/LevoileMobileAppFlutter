import 'package:flutter/material.dart';

import 'animated_property.dart';

class AnimatedStackContainerChild {
  final Widget child;
  final List<AnimatedScript>? scripts;

  AnimatedStackContainerChild({required this.child, this.scripts});
}
