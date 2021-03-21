import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twentyone_dating/model/Question.dart';
import 'package:twentyone_dating/widgets/QuestionStateless.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SubmitQuestions.dart';


class PersonalityType extends StatefulWidget {



  @override
  _PersonalityTypeState createState() => _PersonalityTypeState();
}

class _PersonalityTypeState extends State<PersonalityType> {
  final _formKey = GlobalKey<FormState>();
  late String ei, si, tf, jp;

  late final List<Question> _questionList;
  late final Question _question;

  _init(){
    Question.fetchQuestions().then((value){
      _questionList = value;
      _question = Question(text: value.first.text, options: value.first.options, allQuestions: _questionList);
      print("done");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("$ei $si");
        },
        tooltip: 'Increment',
        child: FaIcon(FontAwesomeIcons.question),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          onVerticalDragEnd: (dragUpdateDetails) async {
            print(_formKey.currentState);

            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              SharedPreferences prefs = await SharedPreferences.getInstance();
              var response = "$ei$si$tf$jp";
              await prefs.setString('personality', response);


              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder:
                    (_) => SubmitQuestions(question: _question)
                )
              );
            }
          },
          child: Center(
            child: Form(
              key: _formKey,
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
                        "What is your personality type?"
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Extrovert/Introvert Option
                      SizedBox(
                        width: 40,
                        child: TextFormField(
                          onEditingComplete: () => node.nextFocus(),
                          onSaved: (v) => ei=v!,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'([eE]|[iI])')),
                            LengthLimitingTextInputFormatter(1),
                          ],
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
                      SizedBox(
                        width: 25,
                      ),

                      // Sensing/Intuition Option
                      SizedBox(
                        width: 40,
                        child: TextFormField(
                          onEditingComplete: () => node.nextFocus(),
                          onSaved: (v) => si=v!,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'([sS]|[iI])')),
                            LengthLimitingTextInputFormatter(1),
                          ],
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
                      SizedBox(
                        width: 25,
                      ),

                      // Thinking/Feeling Option
                      SizedBox(
                        width: 40,
                        child: TextFormField(
                          onEditingComplete: () => node.nextFocus(),
                          onSaved: (v) => tf=v!,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'([tT]|[fF])')),
                            LengthLimitingTextInputFormatter(1),
                          ],
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
                      SizedBox(
                        width: 25,
                      ),

                      // Judging/Perceiving Option
                      SizedBox(
                        width: 40,
                        child: TextFormField(
                          onEditingComplete: () => node.nextFocus(),
                          onSaved: (v) => jp=v!,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'([jJ]|[pP])')),
                            LengthLimitingTextInputFormatter(1),
                          ],
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
