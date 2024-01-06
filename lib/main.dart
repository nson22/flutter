import 'package:flutter/material.dart';
import 'package:my_finance/components/transaction_user.dart';

void main() => runApp(const MyFinance());

class MyFinance extends StatelessWidget {
  const MyFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
      body: const Column(
        children: [
          SizedBox(
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
          TransactionUser(),
        ],
      ),
    );
  }
}
