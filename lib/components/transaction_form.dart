import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Enter new item",
              ),
            ),
            TextField(
              controller: valueController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Enter item value (R\$)",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
