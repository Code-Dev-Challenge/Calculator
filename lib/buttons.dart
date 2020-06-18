import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
    'x²',
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
    'x3',
    'xy',
    '(',
    ')',
  ];

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '='
        // x == 'sin' ||
        // x == 'cos' ||
        // x == 'tan' ||
        // x == 'sec'
        ) {
      return true;
    } else {
      return false;
    }
  }

  double firstNum = 0;
  double secondNum = 0;
  double answer = 0;
  String answerText = '';
  String tempText = '';
  String operation = '';

  void buttonPressed(String symbol) {
    bool dots = false;
    if (symbol == 'DEL') {
      if (number[number.length - 1] == 'n' ||
          number[number.length - 1] == 's') {
        print('hehe');
        number = '${number.substring(0, number.length - 3)}';
        tempText = '${tempText.substring(0, tempText.length - 1)}';
      } else {
        number = '${number.substring(0, number.length - 1)}';
        tempText = '${tempText.substring(0, tempText.length - 1)}';
      }
    } else if (symbol == 'C') {
      dotState = false;
      number = '';
      firstNum = null;
      tempText = '';
      secondNum = 0;
      answer = 0;
      answerText = '';
      operation = '';
    } else if (symbol == '=') {
      dotState = false;

      String equation = tempText;
      String first = '';
      String second = '';
      double num1 = 0;
      double num2 = 0;
      double ans = 0;

      List<String> operations = ['%', 's', 'c', 't', '*', '/', '+', 'm'];

      for (int out = 0; out < operations.length; out++) {
        int i = 0;
        for (; i < equation.length; i++) {
          //gets the numbers that will simplified

          if (equation[i] == operations[out]) {
            int k = i - 1;
            int c = i + 1;

            if (operations[out] == 's' ||
                operations[out] == 'c' ||
                operations[out] == 't') {
              for (;; c++) {
                if (c == equation.length ||
                    equation[c] == '*' ||
                    equation[c] == '/' ||
                    equation[c] == '+' ||
                    equation[c] == 'm' ||
                    equation[c] == 's' ||
                    equation[c] == 'c' ||
                    equation[c] == 't' ||
                    equation[c] == '%') {
                  break;
                } else {
                  second = '$second${equation[c]}';
                }
              }
            } else {
              for (;; k--) {
                if (k == -1 ||
                    equation[k] == '*' ||
                    equation[k] == '/' ||
                    equation[k] == '+' ||
                    equation[k] == 'm' ||
                    equation[k] == 's' ||
                    equation[k] == 's' ||
                    equation[k] == 'c' ||
                    equation[k] == 't' ||
                    equation[k] == '%') {
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
                    equation[c] == 'm' ||
                    equation[c] == 's' ||
                    equation[c] == 'c' ||
                    equation[c] == 't' ||
                    equation[c] == '%') {
                  break;
                } else {
                  second = '$second${equation[c]}';
                }
              }
            }

            //parses the numbers to be calculated

            if (operations[out] == 's' ||
                operations[out] == 'c' ||
                operations[out] == 't') {
              num2 = double.parse(second);
            } else {
              num1 = double.parse(first);
              num2 = double.parse(second);
            }

            //passes to a function to be calculated

            if (operations[out] == 's') {
              ans = getSin(num2);
            }
            if (operations[out] == 'c') {
              ans = getCos(num2);
            }
            if (operations[out] == 't') {
              ans = getTan(num2);
            }
            if (operations[out] == '*') {
              ans = getMult(num1, num2);
            }
            if (operations[out] == '/') {
              ans = getDiv(num1, num2);
            }
            if (operations[out] == '+') {
              ans = getAdd(num1, num2);
            }
            if (operations[out] == 'm') {
              ans = getMin(num1, num2);
            }
            if (operations[out] == '%') {
              ans = getMod(num1, num2);
            }

            //Builds the new equation to be simplified together with the new value

            if (k == -1) {
              equation =
                  '${ans.toString()}${equation.substring(c, equation.length)}';
            } else if (c == equation.length) {
              equation = '${equation.substring(0, k + 1)}${ans.toString()}';
            } else if (k != -1 && c != equation.length) {
              equation =
                  '${equation.substring(0, k + 1)}${ans.toString()}${equation.substring(c, equation.length)}';
            }

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
        tempText = '$tempText$symbol';
        dotState = true;
      }
    } else {
      if (symbol == 'x') {
        //answerText = '$answerText*';
        number = '$number*';
        tempText = '$tempText*';
        dotState = false;
      } else if (symbol == '/') {
        number = '$number$symbol';
        tempText = '$tempText$symbol';
        dotState = false;
      } else if (symbol == '+') {
        number = '$number$symbol';
        tempText = '$tempText$symbol';
        dotState = false;
      } else if (symbol == '-') {
        number = '$number$symbol';
        tempText = '$tempText\m';
        dotState = false;
      } else if (symbol == 'ANS') {
        dotState = false;
        number = '$number$answerText';
        tempText = '$tempText$answerText';
      } else if (symbol == 'sin') {
        dotState = false;
        number = '$number\sin';
        tempText = '$tempText\s';
      } else if (symbol == 'cos') {
        dotState = false;
        number = '$number\cos';
        tempText = '$tempText\c';
      } else if (symbol == 'tan') {
        dotState = false;
        number = '${number}tan';
        tempText = '${tempText}t';
      } else {
        //answerText = '$answerText$symbol';
        number = '$number$symbol';
        tempText = '$tempText$symbol';
      }
    }
  }

  String getAns() {
    return answerText;
  }

  String getNum() {
    return number;
  }

  String getTemp() {
    return tempText;
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

  double getSin(double a) {
    double rad = a * (pi / 180.0);
    return sin(rad);
  }

  double getCos(double a) {
    double rad = a * (pi / 180.0);
    return cos(rad);
  }

  double getTan(double a) {
    double rad = a * (pi / 180.0);
    return tan(rad);
  }
}
