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
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //const instead of var
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'fox', 'score': 10},
        {'text': 'lion', 'score': 5},
        {'text': 'tiger', 'score': 3},
        {'text': 'grape', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 5},
        {'text': 'brown', 'score': 3},
        {'text': 'yellow', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite udemy instructor?',
      'answers': [
        {'text': 'Maximilian', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Maxi', 'score': 1},
        {'text': 'Milo', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('we have no more questions.');
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = ['Hello'];
    // dummy.add('Boi');
    // print(dummy);
    // questions: []; // does not work if questions is a const
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
