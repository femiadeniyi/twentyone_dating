import 'package:flutter/material.dart';
import 'package:twentyone_dating/model/Question.dart';
import 'package:twentyone_dating/widgets/questions/PersonalityType.dart';

import 'QuestionStateless.dart';


class QuestionWidget extends StatelessWidget {

  QuestionWidget({
    required this.question,
  });

  final Question question;



  @override
  Widget build(BuildContext context) {
    if(question.type == "input"){
      return PersonalityType(question);
    } else {
      return QuestionStateless(question: question);
    }
  }
}


