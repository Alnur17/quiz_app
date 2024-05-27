import 'package:flutter/material.dart';
import 'package:quiz_app/constant/colors.dart';
import 'package:quiz_app/constant/dummy_data.dart';
import 'package:quiz_app/constant/style.dart';

import '../constant/images_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
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
      ),
    );
  }

  void bottomSheetForSelections(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: background,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Please select category',
                style: styleWhiteBold20,
              ),
              const SizedBox(height: 16),
              Wrap(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: ChoiceChip(
                      label: Text(
                        category,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: false,
                      onSelected: (bool selected) {},
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
                      onSelected: (bool selected) {},
                      backgroundColor: background,
                      //Customize the background color
                      labelStyle: const TextStyle(
                        color: justWhite,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
