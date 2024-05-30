import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/selection_bottom_sheet_screen.dart';
import 'package:quiz_app/constant/colors.dart';
import 'package:quiz_app/constant/style.dart';
import 'package:quiz_app/controller/quiz_controller.dart';
import '../constant/dummy_data.dart';
import '../constant/images&icons.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuizController quizController = Get.find<QuizController>();

  @override
  void initState() {
    super.initState();
    quizController.categoryItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Obx(
        () {
          if (quizController.categoryItemList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  homeQuizImage,
                  height: 300,
                  width: 400,
                ),
                const SizedBox(height: 50),
                const Text(
                  textReadyFQuiz,
                  style: styleWhiteBold20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 50, right: 50),
                  child: OutlinedButton(
                    onPressed: () {
                      showSelectionBottomSheet(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: buttonColor,
                      fixedSize: const Size(double.maxFinite, 50),
                    ),
                    child: const Text(
                      textStart,
                      style: styleBlackBold16,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void showSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: background,
      context: context,
      builder: (context) => const SelectionBottomSheetScreen(),
    );
  }
}
