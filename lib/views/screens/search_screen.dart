import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/search/category_list.dart';
import 'package:news_app/components/search/search_result_view.dart';
import 'package:news_app/utils/static/app_colors.dart';
import 'package:news_app/views/screens/search_details.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            GestureDetector(
              onTap: (){
                Get.to(const SearchView());
              },
              child: Container(
                width: double.infinity,
                height: 56,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal:18.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.grey[100],
                ),
                child: Row(
                  children: [
                  const Icon(EvaIcons.search),
                    const SizedBox(width: 6,),
                    Text('Search',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.grey),),
                  ],
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
