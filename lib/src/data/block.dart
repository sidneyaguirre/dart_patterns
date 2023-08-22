class Block {
  Block(this.text, this.type);

  final String text;
  final String type;

  factory Block.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'type': final type,
          'text': final text,
        }) {
      return Block(text, type);
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}
