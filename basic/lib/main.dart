import 'package:flutter/material.dart';
import 'package:guessing_game/components/questions_form.widget.dart';
import 'package:guessing_game/components/result.widget.dart';

void main() => runApp(const _GuessingApp());

class _GuessingAppState extends State<_GuessingApp> {
  int selectedQuestion = 0;
  int totalPoints = 0;

  final questions = [
    {
      "question": "What is your favorite programming language?",
      "options": [
        {
          "text": "Java",
          "value": 0,
        },
        {
          "text": "C#",
          "value": 5,
        },
        {
          "text": "C",
          "value": 10,
        },
        {
          "text": "Zig",
          "value": 11,
        },
        {
          "text": "Rust lang",
          "value": 6,
        }
      ]
    },
    {
      "question": "What is your favorite IDE?",
      "options": [
        {
          "text": "VS Code",
          "value": 1,
        },
        {
          "text": "Vim",
          "value": 10,
        },
        {
          "text": "Neo Vim",
          "value": 9,
        },
        {
          "text": "Emacs",
          "value": 10,
        },
        {
          "text": "Android Studio",
          "value": 2,
        },
      ]
    }
  ];

  void answer(int selectedOption) {
    if (hasQuestionSelected) {
      setState(() {
        selectedQuestion++;
        totalPoints += selectedOption;
      });
    }
  }

  void restartForm() {
    setState(() {
      selectedQuestion = 0;
      totalPoints = 0;
    });
  }

  bool get hasQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text(
            "Dev questions 2023!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: hasQuestionSelected
            ? QuestionsFormWidget(
                questions: questions,
                selectedQuestion: selectedQuestion,
                answer: answer,
              )
            : ResultWidget(totalPoints, restartForm),
      ),
    );
  }
}

class _GuessingApp extends StatefulWidget {
  const _GuessingApp();

  @override
  _GuessingAppState createState() {
    return _GuessingAppState();
  }
}
