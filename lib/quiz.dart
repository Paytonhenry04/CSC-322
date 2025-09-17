import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }  
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(content) {
    Widget screenWidget = StartScreen(switchScreen);

  if (activeScreen == 'questions-screen') {
    screenWidget = const QuestionsScreen();
  }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient:LinearGradient(
              colors:[
              Color.fromARGB(255, 71, 30, 143),
              Color.fromARGB(255, 119, 61, 220),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
          child: screenWidget
        ),
      ),
    );
  }
}