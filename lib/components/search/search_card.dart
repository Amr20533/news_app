import 'dart:math';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/utils/helper/format_helper.dart';
import 'package:news_app/utils/static/app_colors.dart';
import 'package:news_app/utils/static/app_dimension.dart';

class SearchCard extends StatelessWidget {
  SearchCard({super.key, required this.article});
  final Article article;
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,height: 80,
              margin: const EdgeInsets.only(right:AppDimensions.defaultHorizontalPadding),
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(10.0)),
                image:DecorationImage(
                    image:NetworkImage(article.urlToImage!),
                    fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title,style:const TextStyle(fontWeight:FontWeight.bold,fontSize: 18.0,color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height:6.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.watch_later_outlined,size:16.0,color:AppColors.grey,),
                          const SizedBox(width: 3.0,),
                          Text(FormatHelper.timeAgoFormat(article.publishedAt), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.grey,))
                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.remove_red_eye_outlined,size:16.0,color:AppColors.grey,),
                          const SizedBox(width: 3.0,),
                          Text('${(random.nextInt(201)+1000).toString()} views', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.grey,)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
