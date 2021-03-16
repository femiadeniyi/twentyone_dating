import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twentyone_dating/model/AppState.dart';
import 'package:provider/provider.dart';
import 'package:twentyone_dating/widgets/VideoContainer.dart';

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
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VideoContainer()));
          },
          onVerticalDragEnd: (dragUpdateDetails) {
            context.read<AppState>().setPage(1);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: TypewriterAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
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
