// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['page']);
  return AppState(
    page: json['page'] as int,
  )..questions = (json['questions'] as List<dynamic>)
      .map((e) => Question.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'page': instance.page,
      'questions': instance.questions,
    };
