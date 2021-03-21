import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {

  Person({
    this.displayName,
    this.gender,
    this.dob,
    this.personality,
    this.token
  });

  final String? displayName;
  final int? gender;
  final DateTime? dob;
  final String? personality;
  final String? token;


  String toString() {
    // TODO: implement toString
    return jsonDecode(jsonEncode(this)).toString();
  }


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
