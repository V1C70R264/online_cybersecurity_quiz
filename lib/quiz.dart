import 'package:flutter/material.dart';
import 'package:recap/data/questions.dart';
import 'package:recap/questions_screen.dart';
import 'package:recap/results_screen.dart';
import 'package:recap/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void getSelectedAnswers(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
         
        activeScreen = 'results-screen';
      });
    }
  }

  void getBackToQuestionsScreen() {
    if (selectedAnswers.length == questions.length && activeScreen == 'results-screen') {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'questions-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: getSelectedAnswers);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        backToQuestionsScreen: getBackToQuestionsScreen,
      );
    }
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: getSelectedAnswers);
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.black87],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft)),
          child: screenWidget),
    ));
  }
}
