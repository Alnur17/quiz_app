import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/category_model.dart';

class QuizController extends GetxController {
  static const String categoryUrl = 'https://opentdb.com/api_category.php';
  var categoryItemList = <CategoryModel>[].obs;

  Future<void> categoryItem() async {
    try {
      final response = await http.get(Uri.parse(categoryUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['trivia_categories'];
        categoryItemList.value =
            data.map((json) => CategoryModel.fromJson(json)).toList();
        print(categoryItemList);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print(e);
    }
  }
}
