import 'dart:ffi';

import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  

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

  

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: GridView.builder(
                  padding: EdgeInsets.all(11.0),
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if( index ==0 ){
                        return MyButtons(
                        buttonText: buttons[index],
                        color:  Colors.green,
                        textColor: Colors.white
                        );
                      }
                      else if( index == 1){
                        return MyButtons(
                        buttonText: buttons[index],
                        color:  Colors.red,
                        textColor: Colors.white
                        );
                      }
                      else{
                        return MyButtons(
                        buttonText: buttons[index],
                        color: isOperator(buttons[index]) ? Colors.blueGrey : Colors.blueGrey[50],
                        textColor:isOperator(buttons[index]) ? Colors.white : Colors.blueGrey,
                      );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );


    }
    bool isOperator(String x){
      if(x == '%' || x == '/' ||x == 'x' ||x == '-' ||x == '+' ||x == '=' ){
        return true;
      }
      else{
        return false;
      };
    
  }
}
