import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_finance/components/transaction_form.dart';
import 'package:my_finance/components/transaction_list.dart';
import 'package:my_finance/models/transaction.dart';

void main() => runApp(const MyFinance());

class MyFinance extends StatelessWidget {
  const MyFinance({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
          tertiary: Colors.grey,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _transactions = [
    Transaction(
        id: Random().nextDouble().toString(),
        title: 'Playstation 5',
        value: 4999.90,
        date: DateTime.now()),
    Transaction(
        id: Random().nextDouble().toString(),
        title: 'Xbox Series X',
        value: 3999.90,
        date: DateTime.now()),
    Transaction(
        id: Random().nextDouble().toString(),
        title: 'Nintendo Switch',
        value: 2999.90,
        date: DateTime.now()),
  ];

  void _addTransaction(String title, double value) {
    Transaction transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(transaction);
    });

    Navigator.of(context).pop();
  }

  void openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Finance",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        primary: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              openTransactionFormModal(context);
            },
            icon: const Icon(Icons.add),
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary),
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondary),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Card(
              color: Theme.of(context).colorScheme.secondary,
              child: const Text(
                "Grafico de despesas",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TransactionList(_transactions),
        ],
      ),
    );
  }
}
