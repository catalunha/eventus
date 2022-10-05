import 'dart:convert';

class Question {
  final String? text;
  final bool? response;
  Question({
    this.text,
    this.response,
  });

  Question copyWith({
    String? text,
    bool? response,
  }) {
    return Question(
      text: text ?? this.text,
      response: response ?? this.response,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (text != null) {
      result.addAll({'text': text});
    }
    if (response != null) {
      result.addAll({'response': response});
    }

    return result;
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      text: map['text'],
      response: map['response'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() => 'QuestionModel(text: $text, response: $response)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.text == text &&
        other.response == response;
  }

  @override
  int get hashCode => text.hashCode ^ response.hashCode;
}
