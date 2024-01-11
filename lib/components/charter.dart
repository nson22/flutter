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

      return {"day": DateFormat.E().format(weekDay), "value": totalSum};
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransaction.fold(0.0, (sum, tr) {
      return sum + double.parse(tr['value'].toString());
    });
  }

  String _changeValueToDisplay(double value) {
    if (value > 1000 && value < 1000000) {
      return "${value.toStringAsFixed(0)}K";
    } else if (value > 1000000) {
      return "${value.toStringAsFixed(0)}M";
    } else {
      return value.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: CharterBar(
                label: tr['day'].toString(),
                value:
                    _changeValueToDisplay(double.parse(tr['value'].toString())),
                percentage:
                    double.parse(tr['value'].toString()) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
