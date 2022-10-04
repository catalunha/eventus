import 'dart:convert';

class QuestionModel {
  final String? text;
  final bool? response;
  QuestionModel({
    this.text,
    this.response,
  });

  QuestionModel copyWith({
    String? text,
    bool? response,
  }) {
    return QuestionModel(
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

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      text: map['text'],
      response: map['response'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() => 'QuestionModel(text: $text, response: $response)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.text == text &&
        other.response == response;
  }

  @override
  int get hashCode => text.hashCode ^ response.hashCode;
}
