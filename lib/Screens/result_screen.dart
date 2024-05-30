import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/home_screen.dart';
import 'package:quiz_app/Screens/quiz_questions.dart';
import 'package:quiz_app/constant/colors.dart';
import 'package:quiz_app/constant/style.dart';
import 'package:quiz_app/model/questions_model.dart';

class ResultScreen extends StatelessWidget {
  final List<QuestionModel> questions;
  final List<String?> selectedAnswers;

  const ResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'Quiz Results',
          style: styleWhiteBold24,
        ),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final userAnswer = selectedAnswers[index];
          final correctAnswer = question.correctAnswer;
          final isCorrect = userAnswer == correctAnswer;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${index + 1}: ${question.question}',
                  style: styleWhiteBold20,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your Answer: $userAnswer',
                  style: TextStyle(
                    color: isCorrect ? darkGreen : darkRed,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8),
                if (!isCorrect)
                  Text(
                    'Correct Answer: $correctAnswer',
                    style: styleDarkGreenBold16,
                  ),
              ],
            ),
          );
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => QuizQuestions(questions: questions));
            },
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor,),
            child: const Text('Restart',style: styleBlackBold16,),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor,),
            child: const Text('Close',style: styleBlackBold16,),
          ),
        ],
      ),
    );
  }
}

/*
ElevatedButton(
onPressed: () {
Get.to(() => HomeScreen());
},
child: Text('Close'),
),
*/
