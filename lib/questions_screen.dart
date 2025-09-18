import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function (String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer('');
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }


  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]; //List of strings

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column( // does not take in other lists, only widgets
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato( //third party package
                color: const Color.fromARGB(255, 245, 148, 237),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer) { // allows to change type of values, co exists
                return AnswerButton(answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }) 
            // AnswerButton( //targeted named args
            //   answerText: currentQuestion.answers[0], 
            //   onTap: () {}
            // ), 
            // AnswerButton(
            //   answerText: currentQuestion.answers[1], 
            //   onTap: () {}
            // ), 
            // AnswerButton(
            //   answerText: currentQuestion.answers[2], 
            //   onTap: () {}
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[3], 
            //   onTap: () {}
            // ),                    
          ]
        ),
      ),
    );
  }
}