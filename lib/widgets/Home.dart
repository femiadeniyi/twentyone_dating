import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twentyone_dating/model/AppState.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          onVerticalDragEnd: (dragUpdateDetails) {
            context.read<AppState>().setPage("personality");
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
                      "I'll convince you",
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
