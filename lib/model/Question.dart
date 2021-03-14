import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'Question.g.dart';



@JsonSerializable()
class Question  {

  Question({required this.id, required this.response});


  @JsonKey(required: true)
  final int id;
  final String response;


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

}
