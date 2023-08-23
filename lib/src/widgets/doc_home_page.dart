import 'package:dart_patterns/src/widgets/block_widget.dart';
import 'package:flutter/material.dart';
import 'package:dart_patterns/dart_patterns.dart';

class DocHomeScreen extends StatelessWidget {
  const DocHomeScreen({
    required this.document,
    super.key,
  });

  final Document document;

  String formatDate(DateTime dateTime) {
    final today = DateTime.now();
    final difference = dateTime.difference(today);

    return switch (difference) {
      Duration(inDays: 0) => 'today',
      Duration(inDays: 1) => 'tomorrow',
      Duration(inDays: -1) => 'yesterday',
      //guard clause -> uses the [when] keyword after a case pattern
      //guard clauses only add a condition to a pattern after is matched
      //if the guard clause is false, the entire pattern is refuted and execution proceeds to the next case
      Duration(inDays: final days) when days > 7 =>
        '${days ~/ 7} weeks from now',
      Duration(inDays: final days) when days < -7 =>
        '${days.abs() ~/ 7} weeks ago',
      Duration(inDays: final days, isNegative: true) =>
        '${days.abs()} days ago',
      Duration(inDays: final days) => '$days days from now',
    };
  }

  @override
  Widget build(BuildContext context) {
    //shorthand for when the name of the pattern is the same as in the record
    final (title, :modified) = document.metadata;
    final formattedModifiedDate = formatDate(modified);
    final blocks = document.getBlocks();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Last modified $formattedModifiedDate'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (
                context,
                index,
              ) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
