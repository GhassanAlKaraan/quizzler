import 'question.dart';

class Quiz {
  final List<Question> _questionBank = [
    Question(
        q: "The Eiffel Tower was originally intended to be a temporary structure.",
        a: false),
    Question(q: "Cows can walk up stairs but not down stairs.", a: true),
    Question(
        q: "The tongue is the strongest muscle in the human body.", a: false),
    Question(
        q: "Chameleons change color to blend in with their surroundings.",
        a: false),
    Question(q: "Tomatoes are a fruit, not a vegetable.", a: false),
    Question(
        q: "Humans and giraffes have the same number of neck vertebrae.",
        a: true),
    Question(q: "There is a species of jellyfish that is immortal.", a: false),
    Question(q: "The largest organ in the human body is the liver.", a: false),
    Question(q: "The world's first computer was called the ENIAC.", a: false),
    Question(
        q: "The largest snowflake ever recorded was 15 inches wide and 8 inches thick.",
        a: true),
    Question(q: "Cats can jump higher than the average house.", a: true),
    Question(q: "Penguins can fly.", a: false),
    Question(q: "The Great Wall of China is visible from space.", a: false),
    Question(q: "Bananas grow on trees.", a: true),
    Question(q: "The tallest animal in the world is the elephant.", a: false),
    Question(q: "The human body has only four senses.", a: false),
    Question(q: "Alligators can grow up to 15 feet long.", a: true),
    Question(q: "The world's smallest mammal is the bumblebee bat.", a: true),
    Question(q: "Elephants are afraid of mice.", a: false),
    Question(q: "The shortest war in history lasted only 38 minutes.", a: true)
  ];

  String getQuestionText(int index) {
    return _questionBank[index].questionText;
  }

  bool getQuestionAnswer(int index) {
    return _questionBank[index].questionAnswer;
  }

  int getLength() {
    return _questionBank.length;
  }

  int _questionNumber = 0;
  int nextQuestion() {
    //next question. index from 0 to 19

    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      return _questionNumber;
    } else {
      //_questionNumber = 0;
      print("index out of bounds");
      return _questionNumber;
    }
  }

  void setQuestionNumber(int i) {
    _questionNumber = i;
  }
}
