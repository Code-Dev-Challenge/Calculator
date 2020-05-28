import 'dart:ffi';

import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

MyButtons button = new MyButtons();

final controllers = TextEditingController();

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

  @override
  void initState() {
    button.controller.text = '0';
    super.initState();
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                 decoration: BoxDecoration(
                    border: new Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.vertical(
                        bottom: new Radius.circular(10.0),
                        top: new Radius.circular(10.0)),
                    //border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid)
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ListView(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                //color: Colors.red,
                                child: Center(
                                  child: Text(
                                    'Test',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                         child: Container(
                           color: Colors.blue,
                           child: Center(
                             child: TextField(
                               decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                  
                                ),
                               textDirection: TextDirection.rtl,
                               readOnly: true,
                               controller: button.controller,
                               
                             ),
                           ),
                         ),
                      )
                    ],
                  ),
                ),
              ),
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
            
            TextField(
              controller: controllers,
            ),
            Card(
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    controllers.text = '${controllers.text} 1';
                  });
                },
                child: Container(
                  child: Center(
                    child: Text('pressme'),
                  ),
                ),
              ),
            )
          ],
        ),
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
