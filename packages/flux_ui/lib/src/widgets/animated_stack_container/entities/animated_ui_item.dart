import 'animated_property.dart';

class AnimatedUiItem {
  final String keyHash;
  final AnimatedScript script;
  final bool isStart;

  AnimatedUiItem({
    required this.keyHash,
    required this.script,
    this.isStart = true,
  });

  AnimatedUiItem copyWith({
    String? keyHash,
    AnimatedScript? script,
    bool? isStart,
  }) {
    return AnimatedUiItem(
      keyHash: keyHash ?? this.keyHash,
      script: script ?? this.script,
      isStart: isStart ?? this.isStart,
    );
  }
}
