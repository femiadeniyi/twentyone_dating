import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Question.dart';




class QuestionStateless extends StatelessWidget {

  QuestionStateless({
    required this.question,
  });

  final Question question;

  void _saveAnswer(BuildContext context, String response){
    // var appState = context.read<AppState>();
    // appState.addQuestionResponse(Question(id: appState.page, response:response));
    // appState.setPage(3);



    Navigator.of(context).pushReplacement(

      MaterialPageRoute(builder:
      (_) => QuestionStateless(question: question.next(), )
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                  totalRepeatCount:1,
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  text: [
                    question.question,
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
                  totalRepeatCount:1,
                  onTap: () => _saveAnswer(context,"1"),
                  colors: [
                    Colors.purple,
                    Colors.purple.shade400,
                  ],
                  text: [
                    question.responses.elementAt(0),
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
                    primary: Colors.purple,
                    padding: EdgeInsets.all(20),
                    side: BorderSide(color: Colors.purple.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    )),
                child: ColorizeAnimatedTextKit(
                  totalRepeatCount:1,
                  onTap: () => _saveAnswer(context,"0"),
                  colors: [
                    Colors.purple,
                    Colors.purple.shade400,
                  ],
                  text: [
                    question.responses.elementAt(1),
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
                    primary: Colors.purple,
                    padding: EdgeInsets.all(20),
                    side: BorderSide(color: Colors.purple.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    )),
                child: ColorizeAnimatedTextKit(
                  totalRepeatCount:1,
                  onTap: () => _saveAnswer(context,"-1"),
                  colors: [
                    Colors.purple,
                    Colors.purple.shade400,
                  ],
                  text: [
                    question.responses.elementAt(2),
                  ],
                  textStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w200,
                      fontSize: 32.0,
                      color: Colors.purple.shade500),
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


