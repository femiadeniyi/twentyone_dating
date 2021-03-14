import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'AppState.g.dart';

enum LyricType {
  vox_main, vox_two, drum_1, drum_2
}

@JsonSerializable()
class AppState extends ChangeNotifier {

  AppState({this.page});

  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    if (page == null) {
      var str = prefs.getString('state');
      if (str == null){
        page = "";
      } else {
        var local =  AppState.fromJson(jsonDecode(str));
        page = local.page;
      }
    }
  }

  void setPage(String p) async{
    page = p;
    print(prefs);
    await prefs.setString("state", jsonEncode(this.toJson()));
    print("done");
    notifyListeners();
  }

  @JsonKey(required: true)
  String? page;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  @override
  String toString() {
    return "page => $page";
  }
}
