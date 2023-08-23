import 'dart:convert';
import 'package:dart_patterns/dart_patterns.dart';

class Document {
  Document() : _json = jsonDecode(documentJson);

  final Map<String, Object?> _json;

  (String, {DateTime modified}) get metadata {
    //the if-case statement only executes if the case pattern matches the data in _json
    if (_json
        case {
          'metadata': {
            'title': String title,
            'modified': String localModified,
          }
        }) {
      return (title, modified: DateTime.parse(localModified));
    } else {
      throw const FormatException('Unexpected JSON');
    }

    //this previous code is equivalent to
    if (_json.containsKey('metadata')) {
      final metadataJson = _json['metadata'];

      if (metadataJson is Map) {
        final title = metadataJson['title'];
        final localModified =
            DateTime.parse(metadataJson['modified'] as String);

        return (title, modified: localModified);
      }
    }
  }

  List<Block> getBlocks() {
    if (_json case {'blocks': List blocksJson}) {
      return [for (final blockJson in blocksJson) Block.fromJson(blockJson)];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

const documentJson = '''
{
   "metadata": {
   "title": "My Document",
   "modified": "2023-05-10"
  },
  "blocks": [
    {
       "type": "h1",
       "text": "Chapter 1"
    },
    {
       "type": "p",
       "text": "Lorem ipsum dolor sit amet, consectetur asipiscing elit."
    },
    {
       "type": "checkbox",
       "checked": true,
       "text": "Learn Dart 3"
    }
  ]
}
''';
