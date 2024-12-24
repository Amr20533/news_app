import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/sources/source_tile.dart';
import 'package:news_app/core/controllers/news_controller.dart';
import 'package:news_app/core/controllers/search_controller.dart';
import 'package:news_app/utils/static/app_dimension.dart';

class SourcesScreen extends GetView<SearchViewController> {
  const SourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewsController(repo: Get.find()));
    return GetBuilder<NewsController>(
        init: Get.find<NewsController>(),
        builder: (newsController){
            final articles = controller.allNews;
            final filteredArticles = articles.where((article) => article.source.name.isNotEmpty).toList();
            return ListView.separated(
              itemCount: filteredArticles.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemBuilder:(context,index) {
                return SourceTile(source: filteredArticles[index].source);
              },
              separatorBuilder: (context, _) => const SizedBox(height: AppDimensions.defaultVerticalPadding,),
            );
        });
  }
}

