import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:twentyone_dating/model/Option.dart';

part 'Question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {

  Question(
      {required this.text,
      this.name,
      required this.options,
      this.allQuestions = const []
      });

  final String text;
  final String? name;
  final List<Option> options;
  final List<Question> allQuestions;


  static Future<List<Question>> fetchQuestions() async{
    const bool isProduction = bool.fromEnvironment('dart.vm.product');
    if (isProduction){
      final List<Question> l =[];
      return l;
    } else {
      final resp = await http.get(Uri.http('localhost:8080', 'question'));
      if (resp.statusCode == 200) {

        List list = jsonDecode(resp.body);
        List<Question> questionList = list.map((e){
          var text = e["text"] as String;
          var options = (e["options"] as List<dynamic>).map((e) => Option.fromJson(e)).toList();
          return Question(text: text, options: options);
        }).toList();

        print("$questionList");

        return questionList;
      } else {
        throw Exception('Failed to get questions');
      }
    }

  }

  String toString() {
    // TODO: implement toString
    return jsonDecode(jsonEncode(this)).toString();
  }


  Question next(Option _option){

    var nextIndex = allQuestions.indexWhere((element) => element.text == text)+1;

    var next = allQuestions.asMap().entries.where((element) => element.key == nextIndex).toList().first.value;

    var newAllQuestions = allQuestions.map((e) {
      if (e.text == text) {
        return Question(text: e.text, options: [Option(text: _option.text, oid: _option.oid)]);
      } else {
        return e;
      }
    }).toList();
    print("halla $nextIndex");

    var q = Question(text: next.text, options: next.options,  allQuestions: newAllQuestions);
    return q;
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

var questions = [
  {
    "responses": [],
    "question": "What is your personality type?",
    "type": "input",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Wife of a Preacher / Preacher",
      "Wife of a Governor / Governor",
      "Wife of a Gunman / Gunman"
    ],
    "question": "Would you date",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Random compliment / Excuse me miss",
      "Excuse me 'random question' / Random Question",
      "Eye contact (stare) / Sorry"
    ],
    "question": "You prefer the approach to you",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Hand holding",
      "Arm around shoulder",
      "None of that"
    ],
    "question": "You go out and prefer",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Divorce",
      "Neither",
      "Forgive"
    ],
    "question": "The love of your life cheats on you. You",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Carry on dating",
      "Convince them to leave gun life",
      "Stop dating"
    ],
    "question": "You discover the person you're dating is the wife of a Gunman / a Gunman",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Try get money off them",
      "Carry on dating",
      "Ask why they're into you"
    ],
    "question": "You discover the person you're dating is the wife of a rich man / a rich man and you're broke.",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Carry on dating",
      "Ask about their religion",
      "Consider their religion will get in your way"
    ],
    "question": "You discover the person you're dating is a religious leader and you're not religious.",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Go somewhere",
      "Sit down and chat",
      "Go in a group"
    ],
    "question": "You go and a date and you like to",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Still talk to old friends",
      "Disconnect from them"
    ],
    "question": "You become mega rich. You",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Reach out",
      "Let them try reach out",
      "Forget it"
    ],
    "question": "You find out someone likes you. You",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "That's ok",
      "You need to ask them about this",
      "100% unacceptable"
    ],
    "question": "The person you date had many partners before you. For you",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "This is a problem",
      "I'll try get them friends",
      "This is no problem"
    ],
    "question": "You're wife / husband is 100% not a social person. For you",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Conservative dressing",
      "I trust their judgement",
      "Show skin"
    ],
    "question": "I care what my wife / husband wears. You prefer",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "100%",
      "As long as I'm on the priority list",
      "I don't see things that way"
    ],
    "question": "You have to be your wife's/husband's no. 1 choice, You prefer",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "100% no",
      "It's ok",
      "It's normal, can't avoid it"
    ],
    "question": "You don't like your husband / wife near many people of the opposite sex. You say",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "There is 1 right person and millions of the wrong person",
      "There are a few right people and many wrong people. Need to make a wise choice",
      "There is no right or wrong person. You make things work together"
    ],
    "question": "You believe in the one. You say",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Yes",
      "Doesn't matter",
      "No"
    ],
    "question": "Your wife / husband is from a different country to you. You prefer",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "It's possible",
      "It's difficult",
      "Are you crazy?"
    ],
    "question": "Your can find a wife / husband in uni. You say",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "It's not good but yes",
      "I have to tell someone but not them",
      "I have to tell them"
    ],
    "question": "You cheat on your wife / husband. Can you live with yourself? You say",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "That's right. No sex before marriage",
      "God forgive me",
      "This question ain't real"
    ],
    "question": "Your engaged. No sex before marriage",
    "type": "option",
    "answers": [],
    "allQuestions": []
  },
  {
    "responses": [
      "Male",
      "Female",
    ],
    "question": "Are you male or female?",
    "type": "option",
    "answers": [],
    "allQuestions": []
  }
];
