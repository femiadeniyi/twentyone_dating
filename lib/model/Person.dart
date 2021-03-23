import 'dart:convert';
import 'dart:core';
import 'package:uuid/uuid.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  const Person({this.displayName,
    this.gender,
    this.dob,
    this.personality,
    this.token,
  });

  final String? displayName;
  final int? gender;
  final DateTime? dob;
  final String? personality;
  final String? token;


  bool isMissingToken() {
    return token == null;
  }

  Future<Person?> updatePerson(String val) async {
    if (isMissingToken()) {
      return Person(
        displayName: displayName ?? null,
        gender: gender ?? null,
        dob: dob ?? null,
        personality: personality ?? null,
        token: val,
      );
    } else {
      return null;
    }
  }

  Future<void> postPerson() async{

  }

  List<Widget> getWidget(void Function(String val) setter) {
    if (isMissingToken()) {
      return PersonQuestion.tokenQuestion(setter);
    } else {
      print("don't know what happended");
      return [];
    }
  }


  String toString() {
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

class PersonQuestion {


  static List<Widget> tokenQuestion(void Function(String val) set) {
    var uid = Uuid().v4();
    return [
      SizedBox(
        child: ColorizeAnimatedTextKit(
          totalRepeatCount: 1,
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          text: [
            "Here is your ID. Keep it safe",
          ],
          textStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 60.0,
              color: Colors.pink.shade500),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 50,
      ),
      CircularProgressIndicator(),
      SizedBox(
        height: 50,
      ),
      SizedBox(
        width: 350,
        child: TextFormField(
          initialValue: uid,
          onSaved: (val) {
            if (val != null) {
              set(val);
            }
          },
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(
          //       RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")),
          //   LengthLimitingTextInputFormatter(1),
          // ],
          style: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w200),
          validator: (value) {
            if (value!.isEmpty) {
              return '?';
            }
            return null;
          },
        ),
      ),
      SizedBox(
        height: 50,
      ),
      OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            primary: Colors.purple,
            padding: EdgeInsets.all(20),
            side: BorderSide(color: Colors.purple.shade400),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.0),
            )),
        child: ColorizeAnimatedTextKit(
          totalRepeatCount: 1,
          onTap: () => set(uid),
          colors: [
            Colors.purple,
            Colors.purple.shade400,
          ],
          text: [
            "Understood",
          ],
          textStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 32.0,
              color: Colors.purple.shade500),
          textAlign: TextAlign.center,
        ),
      ),

    ];
  }

  static List<Widget> loading(void Function(String val) set) {
    var uid = Uuid().v4();
    return [
      SizedBox(
        child: ColorizeAnimatedTextKit(
          totalRepeatCount: 1,
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          text: [
            "Here is your ID. Keep it safe",
          ],
          textStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 60.0,
              color: Colors.pink.shade500),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 50,
      ),
      CircularProgressIndicator(),
      SizedBox(
        height: 50,
      ),
      SizedBox(
        width: 350,
        child: TextFormField(
          enabled: false,
          initialValue: uid,
          onSaved: (val) {
            if (val != null) {
              set(val);
            }
          },
          decoration: InputDecoration(labelText: "Code"),
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(
          //       RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")),
          //   LengthLimitingTextInputFormatter(1),
          // ],
          style: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w200),
          validator: (value) {
            if (value!.isEmpty) {
              return '?';
            }
            return null;
          },
        ),
      ),
      SizedBox(
        height: 50,
      ),
      OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            primary: Colors.purple,
            padding: EdgeInsets.all(20),
            side: BorderSide(color: Colors.purple.shade400),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.0),
            )),
        child: ColorizeAnimatedTextKit(
          totalRepeatCount: 1,
          onTap: () => set(uid),
          colors: [
            Colors.purple,
            Colors.purple.shade400,
          ],
          text: [
            "Understood",
          ],
          textStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 32.0,
              color: Colors.purple.shade500),
          textAlign: TextAlign.center,
        ),
      ),

    ];
  }

}
