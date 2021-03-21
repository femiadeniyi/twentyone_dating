// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    displayName: json['displayName'] as String?,
    gender: json['gender'] as int?,
    dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    personality: json['personality'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'personality': instance.personality,
      'token': instance.token,
    };
