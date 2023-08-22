import 'package:flutter/material.dart';
import 'package:dart_patterns/dart_patterns.dart';

class DocHomeScreen extends StatelessWidget {
  const DocHomeScreen({
    required this.document,
    super.key,
  });

  final Document document;

  @override
  Widget build(BuildContext context) {
    //this pattern [(title, modified: modified)] contains 2 variables that match against the fields of the record
    //returned by [metadata]
    final (title, modified: modified) = document.metadata;
    //because they match, the variable declaration pattern destructures the expression,
    //accessng its values and binding them to new local variables of the same names and types
    //[String title] and [Datetime modified]

    var record = (named: 'v', 'y', named2: 'x', 'z');
    print(record.$1); // 'y'
    print(record.$2); // 'z'

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //To get positional fields use getter $<num> on the record
        //This returns only unnamed fields:
        title: Text(title),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last modified $modified'),
          ),
        ],
      ),
    );
  }
}
