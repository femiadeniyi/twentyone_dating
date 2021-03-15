import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twentyone_dating/model/Question.dart';


part 'AppState.g.dart';



@JsonSerializable()
class AppState extends ChangeNotifier {

  AppState();

  @JsonKey(ignore: true)
  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    var appState = _getState();

    if (appState != null){
      page = appState.page;
      questions = appState.questions;
    } else {
      page = 0;
      questions =[];
    }
  }

  AppState? _getState(){
    var str = prefs.getString('state');
    if (str == null){
      return null;
    } else {
      return AppState.fromJson(jsonDecode(str));
    }
  }

  void setPage(int p) async{
    page = p;
    await prefs.setString("state", jsonEncode(this.toJson()));
    notifyListeners();
  }

  void addQuestionResponse(Question question) async{
    questions.add(question);
    await prefs.setString("state", jsonEncode(this.toJson()));
    notifyListeners();
  }

  @JsonKey(required: true)
  late int page;
  late final List<Question> questions;

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
    return "page => $page\nquestions => $questions";
  }
}
