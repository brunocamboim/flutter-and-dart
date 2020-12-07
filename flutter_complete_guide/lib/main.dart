import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// state is genereic, because this, its need a type (<MyApp>), that is belongs to my app
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What\'s is your color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Jake', 'score': 1},
        {'text': 'Josh', 'score': 1},
        {'text': 'Tigas', 'score': 1}
      ]
    }
  ];

  var _totalScore = 0;

  void _answerQuestion(int score) {
    this._totalScore += score;

    setState(() {
      this._questionIndex++;
    });
    print(this._questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      this._questionIndex = 0;
      this._totalScore = 0;
    });
  }

  // var dummy = const ['Hello'];
  // dummy.add('Bruno');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: this._answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(this._totalScore, this._resetQuiz),
      ),
    );
  }
}
