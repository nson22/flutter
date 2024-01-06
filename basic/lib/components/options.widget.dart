import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  final String text;
  final void Function() isSelected;

  const OptionsWidget(this.text, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: isSelected,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
