import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thecalculatorapp/mybutton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final buttonList = [
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
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Question',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.centerRight,
                  child: const Text('Answer',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: buttonList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonColor: Colors.green,
                        buttonTitle: buttonList[index],
                        buttonTitleColor: Colors.white,
                        buttonTapped: () {},
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonColor: Colors.red,
                        buttonTitle: buttonList[index],
                        buttonTitleColor: Colors.white,
                        buttonTapped: () {},
                      );
                    } else {
                      return MyButton(
                        buttonColor: isOperator(buttonList[index])
                            ? Colors.black
                            : const Color.fromARGB(255, 40, 36, 36),
                        buttonTitle: buttonList[index],
                        buttonTitleColor: isOperator(buttonList[index])
                            ? Colors.white
                            : Colors.deepPurple,
                        buttonTapped: () {
                          setState(() {
                            // question += buttonList[index];
                            log("Tapped");
                          });
                        },
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
}
