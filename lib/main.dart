import 'dart:ffi';

import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

CreateCard buttonClass = new CreateCard();

final controller = TextEditingController();

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
  String numText = '';
  String ansText = '';
  String tempText = '';

  Widget createCard({String buttonText, Color color1, Color color2}) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            buttonClass.buttonPressed(buttonText);
            numText = buttonClass.getNum();
            ansText = buttonClass.getAns();
            tempText = buttonClass.getTemp();
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 80.0,
            height: 65.0,
            color: color1,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: color2),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // List getCard() {
  //   List<Padding> _list = [];

  //   for (int i = 0; i < buttonClass.buttons.length; i++) {
  //     if (i == 0) {
  //       _list.add(createCard(
  //           buttonText: buttonClass.buttons[i],
  //           color1: Colors.green,
  //           color2: Colors.white));
  //     } else if (i == 1) {
  //       _list.add(createCard(
  //           buttonText: buttonClass.buttons[i],
  //           color1: Colors.red,
  //           color2: Colors.white));
  //     } else if (i >= 4 && i <= 7) {
  //       _list.add(createCard(
  //           buttonText: buttonClass.buttons[i],
  //           color1: Colors.grey.shade600,
  //           color2: Colors.white));
  //     } else {
  //       _list.add(createCard(
  //           buttonText: buttonClass.buttons[i],
  //           color1: buttonClass.isOperator(buttonClass.buttons[i])
  //               ? Colors.blueGrey
  //               : Colors.blueGrey[50],
  //           color2: buttonClass.isOperator(buttonClass.buttons[i])
  //               ? Colors.white
  //               : Colors.blueGrey));
  //     }
  //   }

  //   return _list;
  // }

  @override
  void initState() {
    numText = buttonClass.getNum();
    ansText = buttonClass.getAns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttonformat = Container(
      margin: EdgeInsets.only(bottom: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildCreateCard(Colors.green, Colors.white, 0),
              buildCreateCard(Colors.red, Colors.white, 1),
              buildCreateCard(Colors.blueGrey, Colors.blueGrey[50], 2),
              buildCreateCard(Colors.blueGrey, Colors.blueGrey[50], 3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildCreateCard(Colors.grey[600], Colors.white, 4),
              buildCreateCard(Colors.grey[600], Colors.white, 5),
              buildCreateCard(Colors.grey[600], Colors.white, 6),
              buildCreateCard(Colors.grey[600], Colors.white, 7),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildCreateCard(Colors.white, Colors.blueGrey, 8),
              buildCreateCard(Colors.white, Colors.blueGrey, 9),
              buildCreateCard(Colors.white, Colors.blueGrey, 10),
              buildCreateCard(Colors.blueGrey, Colors.blueGrey[50], 11),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildCreateCard(Colors.white, Colors.blueGrey, 12),
              buildCreateCard(Colors.white, Colors.blueGrey, 13),
              buildCreateCard(Colors.white, Colors.blueGrey, 14),
              buildCreateCard(Colors.blueGrey, Colors.blueGrey[50], 15),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildCreateCard(Colors.white, Colors.blueGrey, 16),
              buildCreateCard(Colors.white, Colors.blueGrey, 17),
              buildCreateCard(Colors.white, Colors.blueGrey, 18),
              buildCreateCard(Colors.blueGrey, Colors.blueGrey[50], 19),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildCreateCard(Colors.white, Colors.blueGrey, 20),
              buildCreateCard(Colors.white, Colors.blueGrey, 21),
              buildCreateCard(Colors.white, Colors.blueGrey, 22),
              buildCreateCard(Colors.blueGrey, Colors.blueGrey[50], 23),
            ],
          ),
        ],
      ),
    );
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
                    border: new Border.all(
                        color: Colors.blueGrey.shade100, width: 2.0),
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
                                    numText,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: true,
                        child: Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.blueGrey.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                reverse: true,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      ansText,
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.blueGrey.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                reverse: true,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      tempText,
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(flex: 3, child: buttonformat),
          ],
        ),
      ),
    );
  }

  Widget buildCreateCard(Color kulay1, Color kulay2, int pos) {
    return createCard(
        buttonText: buttonClass.buttons[pos], color1: kulay1, color2: kulay2);
  }
}

// GridView.count(
//                       padding: EdgeInsets.only(bottom: 10),
//                       crossAxisCount: 4,
//                       physics: ScrollPhysics(),
//                       // to disable GridView's scrolling

//                       shrinkWrap: true,
//                       children: getCard()),
