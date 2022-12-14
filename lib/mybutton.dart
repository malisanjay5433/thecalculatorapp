import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonTitleColor;
  final String buttonTitle;
  // ignore: prefer_typing_uninitialized_variables
  final buttonTapped;
  const MyButton({
    Key? key,
    required this.buttonColor,
    required this.buttonTitleColor,
    required this.buttonTitle,
    this.buttonTapped,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              color: buttonColor,
              child: Center(
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                      color: buttonTitleColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              )),
        ),
      ),
    );
  }
}
