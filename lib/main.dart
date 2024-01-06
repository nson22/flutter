import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/models/transaction.model.dart';

void main() => runApp(const MyFinance());

class MyFinance extends StatelessWidget {
  const MyFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: '1', title: 'Playstation 5', value: 4999.90, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Xbox Series X', value: 3999.90, date: DateTime.now()),
    Transaction(
        id: '3',
        title: 'Nintendo Switch',
        value: 2999.90,
        date: DateTime.now()),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Finance",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        primary: true,
        backgroundColor: Colors.purple[300],
      ),
      body: Column(children: [
        const SizedBox(
          width: double.infinity,
          height: 60,
          child: Card(
            color: Colors.amber,
            child: Text(
              "Grafico de despesas",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Column(
          children: _transactions.map((e) {
            return Card(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Text(
                      "R\$ ${e.value.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat("d MMM y").format(e.date),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
