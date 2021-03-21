import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'Option.g.dart';

@JsonSerializable(explicitToJson: true)
class Option {

  Option({required this.text,
        required this.oid,
      });

  final int oid;
  final String text;



  String toString() {
    // TODO: implement toString
    return jsonDecode(jsonEncode(this)).toString();
  }


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
