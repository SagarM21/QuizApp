import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  // the arguments written in {} are named arguments and written outside of it is positional argument.
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You answered X out of Y questions correctly!'),
                const SizedBox(height: 30),
                QuestionsSummary(getSummaryData()),
                const SizedBox(height: 30),
                TextButton(onPressed: () {}, child: const Text('Restart Quiz'))
              ],
            )));
  }
}
