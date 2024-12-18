import 'dart:convert';

import 'package:news_app/model/article_model.dart';
ArticleResponseModel articleResponseModelFromJson(String json) => ArticleResponseModel.fromJson(jsonDecode(json));
class ArticleResponseModel {
  String status;
  int totalResults;
  List<Article> articles;

  ArticleResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    return ArticleResponseModel(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List<dynamic>)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((article) => article.toJson()).toList(),
    };
  }
}


