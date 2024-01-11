import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) _onSubmit;

  const TransactionForm(this._onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  void _onSubmitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget._onSubmit(title, value, _selectedDate!);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // firstDate: DateTime(int.parse(DateFormat.y().format(DateTime.now()))),
      firstDate: DateTime.now().subtract(const Duration(days: 7)),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      margin: const EdgeInsets.symmetric(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            controller: _titleController,
            onSubmitted: (_) => _onSubmitForm(),
            decoration: const InputDecoration(
              labelText: "Enter new expanse",
            ),
          ),
          TextField(
            autofocus: true,
            controller: _valueController,
            onSubmitted: (_) => _onSubmitForm(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: "Enter expanse value (R\$)",
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate == null
                        ? "Select the date"
                        : "Selected date: ${DateFormat('dd/MM/y').format(_selectedDate!)}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: _showDatePicker,
                    icon: const Icon(
                      Icons.date_range,
                      size: 30,
                      color: Colors.purple,
                    ),
                  )
                ],
              )),
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
