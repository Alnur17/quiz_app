import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/quiz_controller.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,

      /*themeMode: ThemeMode.system,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          useMaterial3: true
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          bottomSheetTheme: const BottomSheetThemeData(),
          useMaterial3: true
      ),*/
      home: HomeScreen(),
    );
  }
}
