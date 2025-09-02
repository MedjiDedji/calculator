import 'package:flutter/material.dart';
import 'package:calculator/data/notifiers.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcButtons extends StatelessWidget {
  const CalcButtons({super.key});

  void addToExpression(String digit) {
    equationNotifier.value += digit;
  }

  void clearExpression() {
    equationNotifier.value = '';
  }

  void calculateResult() {
    try {
      String expression = equationNotifier.value
          .replaceAll('x', '*')
          .replaceAll('-', '-');
      Expression exp = Parser().parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      equationNotifier.value = eval.toString();
    } catch (e) {
      equationNotifier.value = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7',
      '8',
      '9',
      'C',
      '4',
      '5',
      '6',
      '*',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '=',
      '+',
    ];

    final actions = [
      () => addToExpression('7'),
      () => addToExpression('8'),
      () => addToExpression('9'),
      clearExpression,
      () => addToExpression('4'),
      () => addToExpression('5'),
      () => addToExpression('6'),
      () => addToExpression('x'),
      () => addToExpression('1'),
      () => addToExpression('2'),
      () => addToExpression('3'),
      () => addToExpression('-'),
      () => addToExpression('0'),
      () => addToExpression('.'),
      () => calculateResult(),
      () => addToExpression('+'),
    ];

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(buttons.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: actions[index],
            child: Text(buttons[index], style: TextStyle(fontSize: 24)),
          ),
        );
      }),
    );
  }
}
