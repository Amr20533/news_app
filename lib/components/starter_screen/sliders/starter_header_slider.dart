import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/starter_screen/carousal_card.dart';
import 'package:news_app/model/article_model.dart';

class StarterHeaderSlider extends StatelessWidget {
  const StarterHeaderSlider({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: articles.map((article) => CarousalCard(article: article)).toList(),
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1.0,
          autoPlayAnimationDuration:const Duration(seconds: 1),
          autoPlayCurve: Curves.linear,
          reverse: false,
          scrollDirection: Axis.horizontal

      ),

    );
  }
}
