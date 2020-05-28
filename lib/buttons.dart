import 'package:flutter/material.dart';



class MyButtons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;

  final controller =  TextEditingController();

  MyButtons({this.color, this.textColor, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          print(buttonText);
          controller.text = '1';
          
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
