import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constant/colors.dart';
import 'package:quiz_app/constant/dummy_data.dart';
import 'package:quiz_app/constant/style.dart';
import 'package:quiz_app/controller/quiz_controller.dart';

import '../constant/images_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuizController quizController = Get.find<QuizController>();

  late int selectedCategory;

  late String selectedMode = '';

  @override
  void initState() {
    super.initState();

    quizController.categoryItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Obx(() {
          if (quizController.categoryItemList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
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
                const SizedBox(height: 24),
                OutlinedButton(
                  onPressed: () {
                    bottomSheetForSelections(context);
                  },
                  child: const Text(
                    textStart,
                    style: styleWhiteBold16,
                  ),
                ),
              ],
            );
          }
        }));
  }

  void bottomSheetForSelections(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: background,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.close),
                ),
                const Text(
                  'Please select category',
                  style: styleWhiteBold20,
                ),
                const SizedBox(height: 16),
                Wrap(
                  children: quizController.categoryItemList.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: ChoiceChip(
                        label: Text(
                          category.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        selected: false,
                        onSelected: (bool selected) {
                          selectedCategory = category.id;
                        },
                        backgroundColor: background,
                        //Customize the background color
                        labelStyle: const TextStyle(
                          color: justWhite,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'Please select difficulty',
                    style: styleWhiteBold20,
                  ),
                ),
                Wrap(
                  children: modes.map((mode) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: ChoiceChip(
                        label: Text(
                          mode,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        selected: false,
                        onSelected: (bool selected) {
                          selectedMode = mode;
                        },
                        backgroundColor: background,
                        //Customize the background color
                        labelStyle: const TextStyle(
                          color: justWhite,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Let\'s Go'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
