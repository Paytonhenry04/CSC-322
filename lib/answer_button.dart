import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onTap}); // named args

  final String answerText;
  final void Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 12, 32, 204),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(40)
          ),
        ),
        child: Text(answerText, textAlign: TextAlign.center),
      ),
    );
  }
}