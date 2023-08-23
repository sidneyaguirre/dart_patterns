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
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: switch (block) {
          HeaderBlock(:final text) => Text(
              text,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ParagraphBlock(:final text) => Text(text),
          CheckboxBlock(:final isChecked, :final text) => Row(
              children: [
                Checkbox(value: isChecked, onChanged: (_) {}),
                Text(text),
              ],
            )
        });
  }
}
