import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/search/category_list.dart';
import 'package:news_app/components/search/search_result_view.dart';
import 'package:news_app/core/controllers/search_controller.dart';
import 'package:news_app/utils/static/app_colors.dart';

class SearchScreen extends GetView<SearchViewController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   margin: const EdgeInsets.only(top:10.0),
            //   child: IconButton(
            //     icon: const Icon(EvaIcons.menu2,size: 30,color:Colors.black,), onPressed: () {  },
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(top:30,bottom: 30.0),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Discover',style:TextStyle(fontSize: 40.0,fontWeight:FontWeight.bold,color:Colors.black)),
                  Text('news from all over the world',style:TextStyle(color:Colors.grey[500],fontSize:18.0))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey[100],
              ),
              child: SingleChildScrollView(
                child: TextFormField(
                  controller: controller.searchController,
                  keyboardType:TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.grey),
                      prefixIcon:const Icon(EvaIcons.search),
                      contentPadding: const EdgeInsets.only(top: 13),
                      border: InputBorder.none,
                      suffixIcon:const Icon(EvaIcons.options)
                  ),
                ),
              ),
            ),
            const CategoryList(),
            const SearchResultView(),
          ],
        ),
      ),
    );
  }
}
