import 'package:flutter/material.dart';
import 'package:guessing_game/components/options.widget.dart';
import 'package:guessing_game/components/questions.widget.dart';

class QuestionsFormWidget extends StatelessWidget {
  final List questions;
  final int selectedQuestion;
  final void Function(int) answer;

  const QuestionsFormWidget({
    required this.questions,
    required this.selectedQuestion,
    required this.answer,
    super.key,
  });

  bool get hasQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> options =
        hasQuestionSelected ? questions[selectedQuestion]["options"] : [];

    return Column(
      children: [
        QuestionsWidget(
          "${selectedQuestion + 1} - ${questions[selectedQuestion]["question"].toString()}",
        ),
        ...options
            .map(
              (t) => OptionsWidget(
                t['text'].toString(),
                () => answer(
                  int.parse(t['value'].toString()),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
