import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/search/category_button.dart';
import 'package:news_app/core/controllers/search_controller.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/static/app_dimension.dart';

class CategoryList extends GetView<SearchViewController> {
  const CategoryList({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.defaultVerticalPadding * 2),
      child: ListView.separated(
        itemCount: CategoryModel.categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = CategoryModel.categories[index];
          return Obx(() {
            bool isSelected = controller.isSelected.value == index;
            return CategoryButton(
                onTap: () {
                  controller.setCategorySelection = index;
                },
                isSelected: isSelected,
                category: category
            );
          });
        },
        separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.only(right: 7.0)),
      ),
    );
  }
}