import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  final String question;

  const QuestionsWidget(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      alignment: Alignment.topCenter,
      child: Text(
        question,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
