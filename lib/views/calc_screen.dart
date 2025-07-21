import 'package:calculator/data/notifiers.dart';
import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => CalcScreenState();
}

class CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: equationNotifier,
      builder: (context, equation, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.33,
          width: double.infinity,
          child: FittedBox(
            child: Wrap(
              alignment: WrapAlignment.end,
              children: [Text(equation)],
            ),
          ),
        );
      },
    );
  }
}
