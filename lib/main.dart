import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _question = const [
    {
      'questionText': 'What\'s Your favorite color is',
      'answer': ['Black', 'Red', 'Blue', 'White']
    },
    {
      'questionText': 'What\'s Your favorite animal is',
      'answer': ['Tiger', 'Lion', 'Dog', 'Fox']
    },
    {
      'questionText': 'What\'s Your favorite game is',
      'answer': ['Cricket', 'Football', 'Basketball', 'none']
    },
  ];
  var questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    print(questionIndex);

    if (questionIndex < _question.length) {
      print('more question');
    } else {
      print('end');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: questionIndex < _question.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: questionIndex,
              question: _question,
            )
          : Result(),
    );
  }
}
