import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twentyone_dating/model/AppState.dart';
import 'package:twentyone_dating/model/Question.dart';
import 'package:provider/provider.dart';

class Q1 extends StatefulWidget {
  @override
  _Q1State createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  final _formKey = GlobalKey<FormState>();
  late String ei, si, tf, jp;
  bool? _done;

  void _saveAnswer(String response) {
    if (_done == null) {
      print("hello");
      _done = true;
      var appState = context.read<AppState>();
      appState
          .addQuestionResponse(Question(id: appState.page, response: response));
      appState.setPage(appState.page + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("$ei $si");
        },
        tooltip: 'Increment',
        child: FaIcon(FontAwesomeIcons.female),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: ColorizeAnimatedTextKit(
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  text: [
                    "Would you date?",
                  ],
                  textStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w200,
                      fontSize: 80.0,
                      color: Colors.pink.shade500),
                  textAlign: TextAlign.center,
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
                  onTap: () => _saveAnswer("-1"),
                  colors: [
                    Colors.purple,
                    Colors.purple.shade400,
                  ],
                  text: [
                    "Wife of a Gunman / Gunman",
                  ],
                  textStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w200,
                      fontSize: 32.0,
                      color: Colors.purple.shade500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.all(20),
                    side: BorderSide(color: Colors.red.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    )),
                child: ColorizeAnimatedTextKit(
                  onTap: () => _saveAnswer("0"),
                  colors: [
                    Colors.red,
                    Colors.red.shade400,
                  ],
                  text: [
                    "Wife of a Governor / Governor",
                  ],
                  textStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w200,
                      fontSize: 32.0,
                      color: Colors.red.shade500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Colors.yellow,
                    padding: EdgeInsets.all(20),
                    side: BorderSide(color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    )),
                onPressed: () {},
                child: ColorizeAnimatedTextKit(
                  onTap: () => _saveAnswer("1"),
                  colors: [Colors.yellow, Colors.orange],
                  text: [
                    "Wife of a Preacher / Preacher",
                  ],
                  textStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w200,
                      fontSize: 32.0,
                      color: Colors.yellow),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
