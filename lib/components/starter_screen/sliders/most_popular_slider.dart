import 'package:flutter/material.dart';
import 'package:news_app/components/starter_screen/most_popular_tile.dart';
import 'package:news_app/model/article_model.dart';

class MostPopularSlider extends StatelessWidget {
  const MostPopularSlider({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount:articles.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top:10.0,bottom:10.0),
      itemBuilder: (context,index) {
        final article = articles[index];
        return MostPopularTile(article: article);
      },
      separatorBuilder: (context,index)=>const Padding(padding:EdgeInsets.only(bottom:8.0)),
    );
  }
}
