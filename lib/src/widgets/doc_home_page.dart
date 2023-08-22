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
    //shorthand for when the name of the pattern is the same as in the record
    final (title, :modified) = document.metadata;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
