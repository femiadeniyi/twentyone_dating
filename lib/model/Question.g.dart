// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return Question(
    id: json['id'] as int,
    response: json['response'] as String,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'response': instance.response,
    };
