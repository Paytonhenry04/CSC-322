import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }  
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen'; // sets the new screen when called
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer); // able to add more items as it does not reassign the list, depspite it being final

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = []; // when you run out of questions, reset the selected answers 
        activeScreen = 'results-screen';// back to empty to be able to meet this requirement again
      });
    }
  }


  @override
  Widget build(content) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers
      );
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