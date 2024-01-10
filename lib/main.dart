import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_expanses/components/charter.dart';
import 'package:my_expanses/components/transaction_form.dart';
import 'package:my_expanses/components/transaction_list.dart';
import 'package:my_expanses/models/transaction.dart';

void main() => runApp(const MyExpanses());

class MyExpanses extends StatelessWidget {
  const MyExpanses({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.white,
          tertiary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
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
  final List<Transaction> _transactions = [
    Transaction(
        id: Random().nextDouble().toString(),
        title: 'Playstation 5',
        value: 4999.90,
        date: DateTime.now()),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Xbox Series X',
      value: 3999.90,
      date: DateTime.now().subtract(
        const Duration(days: 1),
      ),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Nintendo Switch',
      value: 2999.90,
      date: DateTime.now().subtract(
        const Duration(days: 30),
      ),
    ),
  ];

  List<Transaction> filterRecentTransactions() {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(String title, double value) {
    Transaction transaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(transaction);
    });

    Navigator.of(context).pop();
  }

  void openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        shape: const LinearBorder(),
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
          "My expanses",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 26,
          ),
        ),
        primary: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _transactions.isEmpty
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Click on the + icon and start to add your expanses!",
                      style: TextStyle(
                        fontSize: 26,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Charter(filterRecentTransactions()),
                  TransactionList(filterRecentTransactions())
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
        onPressed: () {
          openTransactionFormModal(context);
        },
      ),
    );
  }
}
