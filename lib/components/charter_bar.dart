import 'package:flutter/material.dart';

class CharterBar extends StatelessWidget {
  final String label;
  final double value;
  final String day;

  const CharterBar({
    required this.label,
    required this.value,
    required this.day,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(label),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  width: 20,
                  height: 80,
                ),
                Text(day),
              ],
            ),
          ],
        ));
  }
}
