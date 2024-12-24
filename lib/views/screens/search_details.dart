import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/search/search_card.dart';
import 'package:news_app/core/controllers/search_controller.dart';
import 'package:news_app/utils/static/app_colors.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 56,
              margin: const EdgeInsets.symmetric(horizontal:20.0, vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey[100],
              ),
              child: TextFormField(
                controller: controller.searchController,
                keyboardType:TextInputType.text,
                cursorColor: Colors.black,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.grey),
                    prefixIcon:GestureDetector(
                        onTap: ()=> Get.back(),
                        child: const Icon(EvaIcons.arrowBack)),
                    contentPadding: const EdgeInsets.only(top: 13),
                    border: InputBorder.none,
                    suffixIcon:const Icon(EvaIcons.options)
                ),
                onChanged: (value) {
                  controller.filterArticles();
                },
              ),
            ),

          controller.searchController.text.isNotEmpty ? Obx(()=> Expanded(
                child: ListView.separated(
                  itemCount: controller.filteredArticles.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final article = controller.filteredArticles[index];
                    return SearchCard(article: article);
                  },
                  separatorBuilder: (context, _) => const SizedBox(height: 12,),
        
                ))) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
