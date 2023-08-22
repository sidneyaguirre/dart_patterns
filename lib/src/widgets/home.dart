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
    final metadataRecord = document.metadata;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(metadataRecord.$1),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last modified ${metadataRecord.modified}'),
          ),
        ],
      ),
    );
  }
}
