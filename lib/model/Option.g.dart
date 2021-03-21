// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) {
  return Option(
    text: json['text'] as String,
    oid: json['oid'] as int,
  );
}

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'oid': instance.oid,
      'text': instance.text,
    };
