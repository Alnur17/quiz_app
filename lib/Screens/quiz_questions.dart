import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/result_screen.dart';
import 'package:quiz_app/constant/colors.dart';
import 'package:quiz_app/constant/style.dart';
import 'package:quiz_app/model/questions_model.dart';

class QuizQuestions extends StatefulWidget {
  final List<QuestionModel> questions;

  const QuizQuestions({super.key, required this.questions});

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  // List to store selected answers for each question
  List<String?> selectedAnswers = [];

// List to store shuffled options for each question
  List<List<String>> shuffledOptions = [];

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<String?>.filled(widget.questions.length, null);
    shuffledOptions = widget.questions.map(
      (question) {
        final options = [...question.incorrectAnswers, question.correctAnswer];
        options.shuffle();
        return options;
      },
    ).toList();
  }

  void _submitAnswers() {
    Get.to(
      () => ResultScreen(
        selectedAnswers: selectedAnswers,
        questions: widget.questions,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'Quiz Questions',
          style: styleWhiteBold24,
        ),
        iconTheme: const IconThemeData(
          color: buttonColor, // Set the color of the back button
        ),
      ),
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final question = widget.questions[index];
          final options = shuffledOptions[index];
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map((option) {
                    return RadioListTile<String>(
                      title: Text(
                        option,
                        style: styleWhiteBold16,
                      ),
                      activeColor: justWhite,
                      tileColor: Colors.transparent,
                      value: option,
                      groupValue: selectedAnswers[index],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[index] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _submitAnswers,
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          child: const Text(
            'Submit',
            style: styleBlackBold16,
          ),
        ),
      ),
    );
  }
}
