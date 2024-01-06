import 'package:flutter/material.dart';
import 'package:my_finance/components/transaction_form.dart';
import 'package:my_finance/components/transaction_list.dart';
import 'package:my_finance/models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions),
        TransactionForm(),
      ],
    );
  }
}
