import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() { //Map takes in keys and values
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i, //reflecting the index of the questions
         'question': questions[i].text,
         'correct_answer': questions[i].answers[0],
         'user_answers': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text ('You answered X out of Y questions correclty!'),
            SizedBox(height: 30,),
            Text('List of answers and questions...'),
            SizedBox(height: 30,),
            TextButton(
              onPressed: () {},
              child: Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}