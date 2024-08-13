import 'package:flutter/material.dart';
import 'package:recap/questions_screen.dart';
import 'package:recap/start_screen.dart';

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
      activeScreen =  'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.black87],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft)),
            child: activeScreen == 'start-screen'? StartScreen(switchScreen) : const QuestionsScreen()),
      ),
    );
  }
}
