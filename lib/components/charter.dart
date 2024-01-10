import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expanses/components/charter_bar.dart';
import 'package:my_expanses/models/transaction.dart';

class Charter extends StatelessWidget {
  final List<Transaction> _transactions;

  const Charter(this._transactions, {super.key});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;

      for (int i = 0; i < _transactions.length; i++) {
        bool isSameDay = _transactions[i].date.day == weekDay.day;
        bool isSameMonth = _transactions[i].date.month == weekDay.month;
        bool isSameYear = _transactions[i].date.year == weekDay.year;

        if (isSameDay && isSameMonth && isSameYear) {
          totalSum += _transactions[i].value;
        }
      }

      dev.log("${DateFormat.E().format(weekDay)[0]} \t $totalSum");

      return {"day": DateFormat.E().format(weekDay)[0], "value": totalSum};
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}
