// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    question: json['question'] as String,
    responses:
        (json['responses'] as List<dynamic>).map((e) => e as String).toList(),
    answers:
        (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    type: json['type'] as String,
    allQuestions: (json['allQuestions'] as List<dynamic>)
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'responses': instance.responses,
      'answers': instance.answers,
      'type': instance.type,
      'allQuestions': instance.allQuestions.map((e) => e.toJson()).toList(),
    };
