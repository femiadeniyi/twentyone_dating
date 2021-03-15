import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twentyone_dating/model/AppState.dart';
import 'package:twentyone_dating/model/Question.dart';
import 'package:provider/provider.dart';


class Q2 extends StatefulWidget {
  @override
  _Q2State createState() => _Q2State();
}

class _Q2State extends State<Q2> {
  final _formKey = GlobalKey<FormState>();
  late String ei, si, tf, jp;
  bool? _done;

  void _saveAnswer(String response){
    if(_done == null){
      _done = true;
      var appState = context.read<AppState>();
      appState.addQuestionResponse(Question(id: appState.page, response:response));
      appState.setPage(appState.page+1);
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
        child: GestureDetector(
          onVerticalDragEnd: (dragUpdateDetails) {
            print(_formKey.currentState);

            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              print("$ei $si");
              var appState = context.read<AppState>();
              var response = "$ei$si$tf$jp";

              appState.addQuestionResponse(
                  Question(id: appState.page, response: response));

              print(dragUpdateDetails);
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: ColorizeAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                    ],
                    text: [
                      "You prefer the approach to you",
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

                  style: OutlinedButton.styleFrom(
                    primary: Colors.purple,
                      padding: EdgeInsets.all(20),
                      side: BorderSide(color: Colors.purple.shade400),

                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),

                      )
                  ),
                  onPressed: () => _saveAnswer("1"),
                  child: ColorizeAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    colors: [
                      Colors.purple,
                        Colors.purple.shade400,
                    ],
                    text: [
                      "♂ Random compliment / ♀ Excuse me miss",
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

                  style: OutlinedButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.all(20),
                      side: BorderSide(color: Colors.red.shade400),

                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),

                      )
                  ),
                  onPressed: () => _saveAnswer("0"),
                  child: ColorizeAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    colors: [
                      Colors.red,
                      Colors.red.shade400,
                    ],
                    text: [
                      "♂ Excuse me 'random question' / ♀ Random question",

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

                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),

                      )
                  ),
                  onPressed: () => _saveAnswer("-1"),
                  child: ColorizeAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    colors: [
                      Colors.yellow,
                      Colors.orange

                    ],
                    text: [
                      "♂ Eye contact (stare) / ♀ Sorry",

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
      ),
    );
  }
}
