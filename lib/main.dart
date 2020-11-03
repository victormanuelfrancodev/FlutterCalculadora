import 'package:calculadora/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestions = "";
  var userAnswer = "";
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
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestions,style: TextStyle(fontSize: 20,fontFamily: 'Game' ),),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer,style: TextStyle(fontSize: 20 ,fontFamily: 'Game')),
                  ),
                ],
              ),
            )),
            Expanded(
                flex: 3,
                child: Container(
                  child: GridView.builder(
                      primary: false,
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3),
                      itemBuilder: (BuildContext context, int index) {

                        if (index == 0){
                          return CalculatorButton(
                            buttonTapped: (){
                              setState(() {
                                userQuestions = '';
                                userAnswer = '';
                              });
                            },
                            imageName: "assets/recycle_arrows.png",
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                          );
                        }
                        else if (index == 1){
                          return CalculatorButton(
                            buttonTapped: (){
                              setState(() {
                                userQuestions = userQuestions.substring(0,userQuestions.length-1);
                              });
                            },
                            imageName: "assets/red_cross.png",
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                          );
                        }
                        else if (index == buttons.length-1){
                          return CalculatorButton(
                            buttonTapped: (){
                              setState(() {
                                equalPressed();
                              });
                            },
                            imageName: "assets/arrow_1.png",
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                          );
                        }
                        else{
                          return CalculatorButton(
                            buttonTapped: (){
                              setState(() {
                                userQuestions += buttons[index];
                              });
                            },
                            imageName: "assets/coin.png",
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                          );
                        }
                      }),
                ))
          ],
        ));
  }

  void equalPressed(){
    String finalQuestion = userQuestions;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
