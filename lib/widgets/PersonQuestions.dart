import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twentyone_dating/model/Option.dart';
import 'package:twentyone_dating/model/Person.dart';
import 'package:twentyone_dating/widgets/QuestionStateless.dart';

import '../model/Question.dart';

class PersonQuestions extends StatefulWidget {

  PersonQuestions({
    Key? key,
    required this.question,
    this.person = const Person(),
  }):super(key: UniqueKey());

  final Question question;
  final Person person;

  @override
  _PersonQuestionsState createState() => _PersonQuestionsState();
}

class _PersonQuestionsState extends State<PersonQuestions> {

  String _val = "";
  late List<Widget> questionWidget;
  final _formKey = GlobalKey<FormState>();

  void setVal(String newVal){
    setState(() {
      _val = newVal;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("initstate ${widget.person}");

  }

  void _saveAnswer(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var newPerson = await widget.person.updatePerson(_val);
      if(newPerson != null){
        print(newPerson);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder:
                (_) => PersonQuestions(question: widget.question, person: newPerson,)
            )
        );
      }else {
        print("something went seriously wrong");
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.question.text} opop");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: FaIcon(FontAwesomeIcons.female),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragEnd: (d){
            // _saveAnswer(context);
            print("123");
          },
          onTap: (){
            // print("yellow");
          },
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.person.getWidget(setVal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


