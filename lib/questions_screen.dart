import 'package:flutter/material.dart';
import 'package:recap/answer_button.dart';
import 'package:recap/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});
  final void Function(String onSelectedAnswerByUser) onSelectedAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String clickedAnswer) {
    widget.onSelectedAnswer(clickedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                  answerText: item,
                  onTap: () {
                    answerQuestion(item);
                  });
            })
          ],
        ),
      ),
    );
  }
}
