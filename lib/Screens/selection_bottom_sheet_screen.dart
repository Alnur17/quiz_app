import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/quiz_questions.dart';

import '../constant/colors.dart';
import '../constant/dummy_data.dart';
import '../constant/style.dart';
import '../controller/quiz_controller.dart';

class SelectionBottomSheetScreen extends StatefulWidget {
  const SelectionBottomSheetScreen({super.key});

  @override
  State<SelectionBottomSheetScreen> createState() =>
      _SelectionBottomSheetScreenState();
}

class _SelectionBottomSheetScreenState
    extends State<SelectionBottomSheetScreen> {
  final QuizController quizController = Get.find<QuizController>();
  int? selectedCategoryId;
  String? selectedMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Please select category',
              style: styleWhiteBold24,
            ),
            const SizedBox(height: 12),
            Wrap(
              children: quizController.categoryItemList.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: ChoiceChip(
                    label: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: selectedCategoryId == category.id
                            ? justBlack
                            : justWhite,
                      ),
                    ),
                    selected: selectedCategoryId == category.id,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategoryId = selected ? category.id : null;
                      });
                    },
                    selectedColor: buttonColor,
                    backgroundColor: selectedCategoryId == category.id
                        ? Colors.yellow.withOpacity(0.3)
                        : background,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            const Divider(
              thickness: 4,
              color: buttonColor,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                'Please select difficulty',
                style: styleWhiteBold24,
              ),
            ),
            Wrap(
              children: difficulties.map((difficulty) {
                return Padding(
                  padding: const EdgeInsets.only(left: 4,right: 4),
                  child: ChoiceChip(
                    label: Text(
                      difficulty,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color:
                            selectedMode == difficulty ? justBlack : justWhite,
                      ),
                    ),
                    selected: selectedMode == difficulty,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedMode = selected ? difficulty : null;
                      });
                    },
                    selectedColor: buttonColor,
                    backgroundColor: selectedMode == difficulty
                        ? buttonColor
                        : background,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (selectedCategoryId != null && selectedMode != null) {
                        await quizController.fetchQuizData(
                            selectedCategoryId!, selectedMode!);
                        Get.to(() => QuizQuestions(
                            questions: quizController.questionList));
                      } else {
                        // Show a message to select both category and mode
                        Get.snackbar(
                          'Error',
                          'Please select both category and mode',
                          backgroundColor: Theme.of(context).colorScheme.error,
                          colorText: justWhite,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: justBlack,

                    ),
                    child: const Text('Let\'s Go',style: styleBlackBold16,),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: buttonColor,foregroundColor: justBlack),
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
