import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

class SeparatedOrWidget extends StatelessWidget {
  const SeparatedOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          height: 50.0,
          width: 200.0,
          child: Divider(color: Colors.grey.shade300),
        ),
        Container(
          height: 30,
          width: 40,
          color: Theme.of(context).colorScheme.surface,
        ),
        Text(
          S.of(context).or,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
        ),
      ],
    );
  }
}
