import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twentyone_dating/model/Question.dart';
import 'package:twentyone_dating/widgets/QuestionStateless.dart';
import 'package:twentyone_dating/widgets/VideoContainer.dart';
import 'package:twentyone_dating/widgets/questions/PersonalityType.dart';

class Home extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            print("yellow");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoContainer()));
          },
          onVerticalDragEnd: (dragUpdateDetails) {
            print("$questions bloo");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>
                PersonalityType()));
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: TypewriterAnimatedTextKit(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VideoContainer()));
                    },
                    text: [
                      "Try this dating App",
                      "Meet someone new",
                      "Personality AI Matching",
                      "Swipe left 👈",
                      "Still thinking? 🤔",
                      "Tap 👆",
                      "🔁 restarting"
                    ],
                    textStyle: GoogleFonts.redressed(
                        fontSize: 120.0, color: Colors.pink.shade500),
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
