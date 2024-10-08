import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return OutlinedButton(
      
        onPressed: onTap,
       // icon: const Icon(Icons.dangerous_outlined,),
        child: Text(answerText, textAlign: TextAlign.center,),
        
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
        ));
  }
}
