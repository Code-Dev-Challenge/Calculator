import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

MyHomePage hp = new MyHomePage();
class CreateCard{

  String number = '';
  bool dotState = false;
  final controller = TextEditingController();

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
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

  bool isOperator(String x){
      if(x == '%' || x == '/' ||x == 'x' ||x == '-' ||x == '+' ||x == '=' ){
        return true;
      }
      else{
        return false;
      }
  }

  double firstNum = 0;
  double secondNum = 0;
  double answer = 0;
  String answerText = '';
  String operation = '';

  void buttonPressed(String symbol){
    bool dots = false;
    if(symbol == 'DEL'){
      dotState = false;
      number = '';
      firstNum = null;
      secondNum = 0;
      answer = 0;
      answerText = '';
      operation = '';
    }
    else if(symbol == 'C'){
      dotState = false;
      number = '';
      firstNum = null;
      secondNum = 0;
      answer = 0;
      answerText = '';
      operation = '';
    }
    else if(symbol == '+'){
      dotState = false;
      answerText = '$answerText$symbol';
      if(firstNum == null){
        firstNum = double.parse(number);
        operation = 'add';
        number ='';
      }
      else if(firstNum != 0 || firstNum != null){
        //secondNum = double.parse(number);
        operation = 'add';
        number = '';
      }
    }
    else if(symbol == '-'){
      dotState = false;
      answerText = '$answerText$symbol';
      if(firstNum == null){
        firstNum = double.parse(number);
        operation = 'minus';
        number ='';
      }
      else if(firstNum != 0 || firstNum != null){
        //secondNum = double.parse(number);
        operation = 'minus';
        number = '';
      }
    }
    else if(symbol == 'x'){
      dotState = false;
      answerText = '$answerText$symbol';
      if(firstNum == null){
        firstNum = double.parse(number);
        operation = 'times';
        number ='';
      }
      else if(firstNum != 0 || firstNum != null){
        //secondNum = double.parse(number);
        operation = 'times';
        number = '';
      }
    }
    else if(symbol == '/'){
      dotState = false;
      answerText = '$answerText$symbol';
      if(firstNum == null){
        firstNum = double.parse(number);
        operation = 'div';
        number ='';
      }
      else if(firstNum != 0 || firstNum != null){
        //secondNum = double.parse(number);
        operation = 'div';
        number = '';
      }
    }
    else if(symbol == '%'){
      dotState = false;
      answerText = '$answerText$symbol';
      if(firstNum == null){
        firstNum = double.parse(number);
        operation = 'mod';
        number ='';
      }
      else if(firstNum != 0 || firstNum != null){
        //secondNum = double.parse(number);
        operation = 'mod';
        number = '';
      }
    }
    else if(symbol == '='){
      dotState = false;
      if(operation == 'add'){
        secondNum = double.parse(number);
        answer = firstNum + secondNum;
        answerText = answer.toString();
        firstNum = answer;
        number = '';
      }
      if(operation == 'minus'){
        secondNum = double.parse(number);
        answer = firstNum - secondNum;
        if(answer == 0 || answer == 0.0){
          answer = 0;
        }
        print(answer);
        answerText = answer.toString();
        firstNum = answer;
        number = '';
      }
      if(operation == 'times'){
        secondNum = double.parse(number);
        answer = firstNum * secondNum;
        answerText = answer.toString();
        firstNum = answer;
        number = '';
      }
      if(operation == 'div'){
        secondNum = double.parse(number);
        answer = firstNum / secondNum;
        if(answer == 0 || answer == 0.0){
          answer = 0;
        }
        answerText = answer.toString();
        firstNum = answer;
        number = '';
      }
      if(operation == 'mod'){
        secondNum = double.parse(number);
        answer = firstNum % secondNum;
        answerText = answer.toString();
        firstNum = answer;
        number = '';
      }
    }
    else if(symbol == '.'){
      if(dotState == false){
        answerText = '$answerText$symbol';
        number = '$number$symbol';
        dotState = true;
      }
    }
    else{
      answerText = '$answerText$symbol';
      number = '$number$symbol';
      
    }
  }

  String getAns(){
    return answerText;
  }

  String getNum(){
    return number;
  }
}