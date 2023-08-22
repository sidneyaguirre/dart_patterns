import 'package:flutter/material.dart';
import 'package:dart_patterns/dart_patterns.dart';

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DocHomeScreen(
        document: Document(),
      ),
    );
  }
}
