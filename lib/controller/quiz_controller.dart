import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/category_model.dart';
import 'package:quiz_app/model/questions_model.dart';

import '../constant/urls.dart';

class QuizController extends GetxController {
  var categoryItemList = <CategoryModel>[].obs;

  Future<void> categoryItem() async {
    try {
      final response = await http.get(Uri.parse(categoryUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['trivia_categories'];
        categoryItemList.value =
            data.map((json) => CategoryModel.fromJson(json)).toList();
        print(categoryItemList.length);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print(e);
    }
  }

  var questionList = <QuestionModel>[].obs;

  Future<void> fetchQuizData(categoryId, difficulty) async {
    try {
      final response = await http.get(Uri.parse(getQuestions(categoryId, difficulty)));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['results'];
        questionList.value =
            data.map((json) => QuestionModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      print(e);
    }
  }
}
