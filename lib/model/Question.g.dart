// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    text: json['text'] as String,
    name: json['name'] as String?,
    options: (json['options'] as List<dynamic>)
        .map((e) => Option.fromJson(e as Map<String, dynamic>))
        .toList(),
    allQuestions: (json['allQuestions'] as List<dynamic>)
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'text': instance.text,
      'name': instance.name,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'allQuestions': instance.allQuestions.map((e) => e.toJson()).toList(),
    };
