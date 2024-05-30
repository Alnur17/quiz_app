import 'package:flutter/material.dart';
import 'package:quiz_app/constant/colors.dart';
import 'package:quiz_app/constant/style.dart';
import 'package:quiz_app/model/questions_model.dart';

class QuizQuestions extends StatelessWidget {
  final List<QuestionModel> questions;

  const QuizQuestions({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Quiz Questions',style: styleBlackBold24,),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${index + 1}: ${question.question}',
                  style: styleBlackBold20,
                ),
                const SizedBox(height: 8),
                Text(
                  'Correct Answer: ${question.correctAnswer}',
                  style: TextStyle(
                    color: darkGreen,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Incorrect Answers: ${question.incorrectAnswers.join(', ')}',
                  style:  TextStyle(
                    color: darkRed,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
