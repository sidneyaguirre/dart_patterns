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

    var record = (named: 'v', 'y', named2: 'x', 'z');
    print(record.$1); // 'y'
    print(record.$2); // 'z'

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //To get positional fields use getter $<num> on the record
        //This returns only unnamed fields:
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
