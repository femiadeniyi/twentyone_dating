import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twentyone_dating/model/Option.dart';

import '../model/Question.dart';

class SubmitQuestions extends StatelessWidget {

  SubmitQuestions({
    required this.question,
  });

  FirebaseAuth auth = FirebaseAuth.instance;

  final Question question;

  void _saveAnswer(BuildContext context, String response) {
    // var appState = context.read<AppState>();
    // appState.addQuestionResponse(Question(id: appState.page, response:response));
    // appState.setPage(3);

    var q = question.next(Option(text: "text", oid: 1));
    print(q);

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      print("done");
      return SubmitQuestions(
        question: q,
      );
    }));
  }

  _init(){

  }

  @override
  Widget build(BuildContext context) {
    print("${question.text} opop");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: FaIcon(FontAwesomeIcons.female),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      "Create an account",
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
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email"
                    ),
                    onEditingComplete: () {
                      print("done");
                    },
                    // onSaved: (v) => ei=v!,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //       RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")),
                    //   LengthLimitingTextInputFormatter(1),
                    // ],
                    style: GoogleFonts.roboto(
                        fontSize: 48, fontWeight: FontWeight.w200),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '?';
                      }
                      return null;
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

