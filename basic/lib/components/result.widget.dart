import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int totalPoints;
  final void Function() restartForm;

  const ResultWidget(this.totalPoints, this.restartForm, {super.key});

  String get message {
    if (totalPoints < 10) {
      return "Congratulation!";
    } else if (totalPoints > 10 && totalPoints < 15) {
      return "You're a good person.";
    } else {
      return "You're aweson.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            "You made a total of ${int.parse(totalPoints.toString())} of points",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () => restartForm(),
          child: const Text("Restart?"),
        )
      ],
    );
  }
}
