import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class PersonalityType extends StatefulWidget {
  @override
  _PersonalityTypeState createState() => _PersonalityTypeState();
}

class _PersonalityTypeState extends State<PersonalityType> {

  final _formKey = GlobalKey<FormState>();
  late String p1,p2,p3,p4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: FaIcon(FontAwesomeIcons.question),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          onVerticalDragEnd: (dragUpdateDetails) {
            print(dragUpdateDetails);
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
                      "What is your personality type?",
                    ],
                    textStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w200,
                        fontSize: 80.0,
                        color: Colors.pink.shade500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    Text("ff"),
                    Text("ff")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



