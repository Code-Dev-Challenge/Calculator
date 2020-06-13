import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

MyHomePage hp = new MyHomePage();

class CreateCard {
  String number = '';
  bool dotState = false;
  final controller = TextEditingController();

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    'sin',
    'cos',
    'tan',
    'sec',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  bool isOperator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == 'sin' ||
        x == 'cos' ||
        x == 'tan' ||
        x == 'sec') {
      return true;
    } else {
      return false;
    }
  }

  double firstNum = 0;
  double secondNum = 0;
  double answer = 0;
  String answerText = '';
  String operation = '';

  void buttonPressed(String symbol) {
    bool dots = false;
    if (symbol == 'DEL') {
      number = '${number.substring(0, number.length - 1)}';
    } else if (symbol == 'C') {
      dotState = false;
      number = '';
      firstNum = null;
      secondNum = 0;
      answer = 0;
      answerText = '';
      operation = '';
    } else if (symbol == '=') {
      dotState = false;

      String equation = number;
      String first = '';
      String second = '';
      double num1 = 0;
      double num2 = 0;
      double ans = 0;

      List<String> operations = ['*', '/', '+', '-', '%'];

      for (int out = 0; out < operations.length; out++) {
        int i = 0;
        for (; i < equation.length; i++) {
          if (equation[i] == operations[out]) {
            int k = i - 1;
            int c = i + 1;
            for (;; k--) {
              if (k == -1 ||
                  equation[k] == '*' ||
                  equation[k] == '/' ||
                  equation[k] == '+' ||
                  equation[k] == '-' ||
                  equation[k] == '%') {
                //print(first);
                break;
              } else {
                first = '${equation[k]}$first';
              }
            }
            for (;; c++) {
              if (c == equation.length ||
                  equation[c] == '*' ||
                  equation[c] == '/' ||
                  equation[c] == '+' ||
                  equation[c] == '-' ||
                  equation[c] == '%') {
                //print(second);
                break;
              } else {
                second = '$second${equation[c]}';
              }
            }

            num1 = double.parse(first);
            num2 = double.parse(second);

            if (operations[out] == '*') {
              ans = getMult(num1, num2);
            }
            if (operations[out] == '/') {
              ans = getDiv(num1, num2);
            }
            if (operations[out] == '+') {
              ans = getAdd(num1, num2);
            }
            if (operations[out] == '-') {
              ans = getMin(num1, num2);
            }
            if (operations[out] == '%') {
              ans - getMod(num1, num2);
            }
            //equation = '${ans.toString()}';
            if (k == -1) {
              equation =
                  '${ans.toString()}${equation.substring(c, equation.length)}';
            } else if (c == equation.length) {
              equation = '${equation.substring(0, k + 1)}${ans.toString()}';
            } else if (k != -1 && c != equation.length) {
              equation =
                  '${equation.substring(0, k + 1)}${ans.toString()}${equation.substring(c, equation.length)}';
            }
            //print(equation);

            i = 0;
            first = '';
            second = '';
            num1 = 0;
            num2 = 0;
            ans = 0;
          } else {
            continue;
          }
        }
      }

      answerText = equation;
    } else if (symbol == '.') {
      if (dotState == false) {
        //answerText = '$answerText$symbol';
        number = '$number$symbol';
        dotState = true;
      }
    } else {
      if (symbol == 'x') {
        //answerText = '$answerText*';
        number = '$number*';
        dotState = false;
      } else if (symbol == '/') {
        number = '$number$symbol';
        dotState = false;
      } else if (symbol == '+') {
        number = '$number$symbol';
        dotState = false;
      } else if (symbol == '-') {
        number = '$number$symbol';
        dotState = false;
      } else if (symbol == 'ANS') {
        dotState = false;
        number = '$number$answerText';
      } else {
        //answerText = '$answerText$symbol';
        number = '$number$symbol';
      }
    }
  }

  String getAns() {
    return answerText;
  }

  String getNum() {
    return number;
  }

  double getMult(double a, double b) {
    return a * b;
  }

  double getDiv(double a, double b) {
    return a / b;
  }

  double getAdd(double a, double b) {
    return a + b;
  }

  double getMin(double a, double b) {
    return a - b;
  }

  double getMod(double a, double b) {
    return a % b;
  }
}
