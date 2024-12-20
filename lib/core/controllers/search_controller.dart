import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/core/controllers/news_controller.dart';
import 'package:news_app/model/article_model.dart';

class SearchViewController extends GetxController{

  late TextEditingController searchController;

  final RxInt _isSelected = 0.obs;
  RxInt get isSelected => _isSelected;

  set setCategorySelection(int newIndex){
    _isSelected.value = newIndex;
  }
  List<List<Article>> articles = [
    Get.find<NewsController>().journalNews,
    Get.find<NewsController>().business,
    Get.find<NewsController>().technology,
    Get.find<NewsController>().teslaNews,
    Get.find<NewsController>().apple,
  ];
  List<Article> allNews = [
    ...Get.find<NewsController>().journalNews,
    ...Get.find<NewsController>().business,
    ...Get.find<NewsController>().technology,
    ...Get.find<NewsController>().teslaNews,
    ...Get.find<NewsController>().apple,
  ];

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}