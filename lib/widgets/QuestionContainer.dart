import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twentyone_dating/model/AppState.dart';
import 'package:twentyone_dating/model/Question.dart';
import 'package:provider/provider.dart';


class QuestionContainer extends StatefulWidget {

  QuestionContainer({required this.responses, required this.question});

  final List<Widget Function(dynamic any)> responses;
  final String question;


  @override
  _QuestionContainerState createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  late String ei, si, tf, jp;
  bool? _done;

  void _saveAnswer(String response){
    if(_done == null){
      print("hello");
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
                    widget.question,
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
              widget.responses.elementAt(0)(this),
              SizedBox(
                height: 50,
              ),
              widget.responses.elementAt(1)(this),
              SizedBox(
                height: 50,
              ),
              widget.responses.elementAt(2)(this),
            ],
          ),
        ),
      ),
    );
  }
}
