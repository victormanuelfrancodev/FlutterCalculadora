import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;
  final String imageName;

  CalculatorButton({this.color, this.textColor, this.buttonText, this.buttonTapped, this.imageName});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:
          Container(
            color: color,
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonText,
                      style: TextStyle(color: textColor,fontSize: 20,fontFamily: 'Game'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(imageName),
                    )
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
