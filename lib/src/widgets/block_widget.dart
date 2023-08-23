import 'package:flutter/material.dart';
import 'package:dart_patterns/dart_patterns.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({
    required this.block,
    super.key,
  });

  final Block block;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;

    /*switch (block.type) {
      case 'h1':
        textStyle = Theme.of(context).textTheme.displayMedium;
      case 'p' || 'checkbox':
        textStyle = Theme.of(context).textTheme.bodyMedium;
      case _: //wildcard pattern - equivalent to default
        textStyle = Theme.of(context).textTheme.bodySmall;
    }*/

    textStyle = switch (block.type) {
      'h1' => Theme.of(context).textTheme.displayMedium,
      'p' || 'checkbox' => Theme.of(context).textTheme.bodyMedium,
      _ => Theme.of(context).textTheme.bodySmall
    };

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Text(
        block.text,
        style: textStyle,
      ),
    );
  }
}
