import 'package:flutter/material.dart';

/// [ConditionWidget] is a widget that renders a result based on a
/// provided condition.
///
/// If the condition is true, the child widget will be rendered.
/// Otherwise, the elseChild widget will be rendered.
class ConditionWidget extends StatelessWidget {
  const ConditionWidget({
    super.key,
    required this.condition,
    required this.child,
    required this.elseChild,
  });

  /// If condition is true, return child
  ///
  /// If condition is false, return elseChild
  final bool condition;

  /// The widget to be conditionally rendered
  ///
  /// If condition is true, return child
  final Widget child;

  /// The widget to be conditionally rendered
  ///
  /// If condition is false, return elseChild
  final Widget elseChild;

  @override
  Widget build(BuildContext context) {
    return condition ? child : elseChild;
  }
}

/// [ConditionBuilderWidget] is a widget that renders a result based on a
/// provided condition.
///
/// If the condition is true, the child widget will be rendered.
/// Otherwise, the elseBuilder will be rendered along with the child widget.
class ConditionBuilderWidget extends StatelessWidget {
  const ConditionBuilderWidget({
    super.key,
    required this.condition,
    required this.child,
    required this.elseBuilder,
  });

  /// If condition is true, return child
  ///
  /// If condition is false, return elseBuilder(child)
  final bool condition;

  /// The widget to be conditionally rendered
  ///
  /// If condition is true, return child
  final Widget child;

  /// Build a widget with the child as parameter
  ///
  /// If condition is false, return elseBuilder(child)
  final Widget Function(Widget) elseBuilder;

  @override
  Widget build(BuildContext context) {
    return condition ? child : elseBuilder(child);
  }
}
