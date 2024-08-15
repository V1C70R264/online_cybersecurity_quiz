import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
                child: Text(((data['question_index'] as int) + 1).toString(), style: TextStyle(fontSize: 8),)),
              Expanded(
                child: Column( 
                  children: [
                   Text(data['question'] as String, style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data['user_answer'] as String, style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                    Text(data['correct_answer'] as String, style: TextStyle(color: Colors.green),textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
