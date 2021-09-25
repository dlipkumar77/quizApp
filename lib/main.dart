import 'package:flutter/material.dart';
import 'package:my_app/quiz.dart';
import 'package:my_app/result.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'What\'s your favorite color ?',
        'answers': [
          {'text': 'Blue', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 8},
          {'text': 'White', 'score': 3}
        ],
      },
      {
        'questionText': 'What\'s your favorite animal ?',
        'answers': [
          {'text': 'Rabbit', 'score': 4},
          {'text': 'Elephant', 'score': 3},
          {'text': 'Lion', 'score': 1},
          {'text': 'Tiger', 'score': 8}
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor ?',
        'answers': [
          {'text': 'Max', 'score': 10},
          {'text': 'Manu', 'score': 0},
          {'text': 'Mint', 'score': 4},
          {'text': 'Times', 'score': 3}
        ],
      },
    ];

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
