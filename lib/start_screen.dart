import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.StartQuiz,{super.key});
  final void Function() StartQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz_logo1.png',
            width: 400,
          ),
          SizedBox(
            height: 20,
          ),
          Text('CyberSecurity is much more than the matter of IT',
              style: GoogleFonts.seaweedScript(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
            onPressed: () {
              StartQuiz();
            },
            label: Text('Start Quiz'),
            icon: Icon(Icons.arrow_right_alt_rounded),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
