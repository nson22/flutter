import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) _onSubmit;

  const TransactionForm(this._onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _onSubmitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget._onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add new expanse",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                ),
                style: ButtonStyle(
                  iconSize: const MaterialStatePropertyAll(18),
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                ),
              )
            ],
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            onSubmitted: (_) => _onSubmitForm(),
            decoration: const InputDecoration(
              labelText: "Enter new expanse",
            ),
          ),
          TextField(
            controller: valueController,
            onSubmitted: (_) => _onSubmitForm(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: "Enter expanse value (R\$)",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {
                _onSubmitForm();
              },
              child: const Text(
                "Add",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
