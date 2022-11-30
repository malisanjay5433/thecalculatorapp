import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:thecalculatorapp/mybutton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final button = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
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
    '='
  ];
  var question = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 94, 86, 112),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.centerLeft,
                child: Text(
                  question,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.centerRight,
                child: Text(answer,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800)),
              )
            ],
          )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: button.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //Clear button action
                    if (index == 0) {
                      return MyButton(
                        buttonColor: Colors.green,
                        buttonTitle: button[index],
                        buttonTitleColor: Colors.white,
                        buttonTapped: () {
                          setState(() {
                            question = '';
                            answer = '';
                          });
                        },
                      );
                    }
                    //Delete button action
                    else if (index == 1) {
                      return MyButton(
                        buttonColor: Colors.red,
                        buttonTitle: button[index],
                        buttonTitleColor: Colors.white,
                        buttonTapped: () {
                          setState(() {
                            if (question.isEmpty) {
                              return;
                            } else {
                              question =
                                  question.substring(0, question.length - 1);
                            }
                          });
                        },
                      );
                    } else if (index == button.length - 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalOperation();
                          });
                        },
                        buttonColor: isOperator(button[index])
                            ? Colors.black
                            : const Color.fromARGB(255, 40, 36, 36),
                        buttonTitle: button[index],
                        buttonTitleColor: isOperator(button[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }
                    //Rest of buttons
                    else {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            question += button[index];
                          });
                        },
                        buttonColor: isOperator(button[index])
                            ? Colors.black
                            : const Color.fromARGB(255, 40, 36, 36),
                        buttonTitle: button[index],
                        buttonTitleColor: isOperator(button[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }
                  }))
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "X" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }

  void equalOperation() {
    String finalQuestions = question;
    finalQuestions = finalQuestions.replaceAll("X", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestions);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = '= $eval';
  }
}
