import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = Quiz();
  int index = 0;
  int score = 0;

  List<Icon> scoreKeeper = [
    //wow, such empty.
  ];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quiz.getQuestionAnswer(index);

    setState(() {
      if (index != 19) {
        if (userAnswer == correctAnswer) {
          score++;
          print("index: $index, Correct choice by user");
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          print("index: $index, Incorrect choice by user");
        }

        index = quiz.nextQuestion(); //go to the next question if it's safe.
      } else {
        _onBasicAlertPressed(context);
        scoreKeeper.clear();
        score = 0;
        index = 0;
        quiz.setQuestionNumber(0);
        print("End of program.");
      }
    });
  } //checkAnswer method

  // The easiest way for creating RFlutter Alert
  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Program Finished",
      desc: "You scored: $score/20",
    ).show();
  }

  // Code will continue after alert is closed.
  _onBasicWaitingAlertPressed(context) async {
    await Alert(
      context: context,
      title: "Program Finished",
      desc: "You scored: $score/20",
    ).show();

    // Code will continue after alert is closed.
    debugPrint("Alert closed now.");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Score: $score/20",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'VinaSans',
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText(index),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(fontFamily: 'VinaSans', fontSize: 35),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(fontFamily: 'VinaSans', fontSize: 35),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        SizedBox(
          height: 50, // Set the height of the SizedBox to 50
          child: Wrap(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
