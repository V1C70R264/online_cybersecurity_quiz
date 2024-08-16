import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recap/data/questions.dart';
import 'package:recap/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.chosenAnswers,
      required this.backToQuestionsScreen
    });
    final void Function() backToQuestionsScreen;
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
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return (data['user_answer'] == data['correct_answer']);
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (numCorrectQuestions <= 10) ? 'Good Trial!!!' : 'Excellent!!!',
              style: GoogleFonts.seaweedScript(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestion questions correctly ',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed:backToQuestionsScreen,
              icon: Icon(
                Icons.refresh_outlined,
                color: Colors.white,
              ),
              label: Text('Restart Quiz'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
