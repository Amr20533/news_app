import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/search/search_card.dart';
import 'package:news_app/core/controllers/news_controller.dart';
import 'package:news_app/core/controllers/search_controller.dart';
import 'package:news_app/utils/static/app_dimension.dart';

class SearchResultView extends GetView<SearchViewController> {
  const SearchResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: Get.find<NewsController>(),
        builder: (newsController){
          return Obx(() {
            final articles = controller.articles[controller.isSelected.value];
            // final filteredArticles = articles.where((article) => article.title.isNotEmpty && article.description.isNotEmpty).toList();
            return ListView.separated(
              itemCount: articles.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemBuilder:(context,index) {
                  return SearchCard(article: articles[index]);
              },
              separatorBuilder: (context, _) => const SizedBox(height: AppDimensions.defaultVerticalPadding,),
            );

          });
      });
  }
}