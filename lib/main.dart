import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/controllers/news_controller.dart';
import 'package:news_app/utils/static/app_colors.dart';
import 'package:news_app/views/home_screen.dart';
import 'package:news_app/utils/helper/init.dart' as dependencies;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<NewsController>().getJournalNews();
    Get.find<NewsController>().getBusinessNews();
    Get.find<NewsController>().getTechnologyNews();
    Get.find<NewsController>().getAppleNews();
    Get.find<NewsController>().getTeslaNews();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: AppColors.white,
        )
       ),
      home: const HomeScreen(),
    );
  }
}
