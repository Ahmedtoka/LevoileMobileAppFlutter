import 'package:flutter/material.dart';

import '../../core/helpers/helpers.dart';

class FluxAvatarByNameWidget extends StatelessWidget {
  const FluxAvatarByNameWidget({
    super.key,
    this.name,
    this.size,
    this.textStyle,
  });

  final String? name;
  final double? size;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final nameAvatar = name;
    if (nameAvatar == null || nameAvatar.isEmpty) {
      return SizedBox(
        width: size,
        height: size,
        child: const CircleAvatar(child: Icon(Icons.person)),
      );
    }

    // Get color based on user's name or identifier
    final avatarColor = FluxUiHelper.getColorFromName(nameAvatar);

    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        radius: size,
        backgroundColor: avatarColor,
        child: Text(
          nameAvatar[0],
          style: (textStyle ?? const TextStyle(fontSize: 55)).copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
