sealed class Block {
  Block(this.text, this.type);

  final String text;
  final String type;

  factory Block.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
        CheckboxBlock(
          checked,
          text,
        ),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}

class HeaderBlock extends Block {
  HeaderBlock(this.text) : super('', '');

  final String text;
}

class ParagraphBlock extends Block {
  ParagraphBlock(this.text) : super('', '');

  final String text;
}

class CheckboxBlock extends Block {
  CheckboxBlock(this.isChecked, this.text) : super('', '');

  final bool isChecked;
  final String text;
}
