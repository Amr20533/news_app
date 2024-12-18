import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app/core/repositories/news_repo.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/article_response_model.dart';

class NewsController extends GetxController{
  final NewsRepo repo;
  NewsController({required this.repo});
  List<Article> _teslaNews = [];
  List<Article> get teslaNews => _teslaNews;

  List<Article> _journalNews = [];
  List<Article> get journalNews => _journalNews;

  List<Article> _business = [];
  List<Article> get business => _business;

  List<Article> _apple = [];
  List<Article> get apple => _apple;

  List<Article> _technology = [];
  List<Article> get technology => _technology;

  Future<void> getTechnologyNews()async {
    final response = await repo.getTechnologyNews();
    if (response.statusCode == 200) {
      List<Article> articles = articleResponseModelFromJson(response.body)
          .articles;
      _technology.addAll(articles);
      debugPrint('Technology Data: ${articles.toList()}');
    } else {
      debugPrint('Error: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 401) {
        debugPrint('API Key might be invalid!');
      } else if (response.statusCode == 404) {
        debugPrint('Endpoint not found!');
      }
      throw Exception("Could not find data!");
    }
  }

  Future<void> getJournalNews()async {
    final response = await repo.getJournalNews();
    if (response.statusCode == 200) {
      List<Article> articles = articleResponseModelFromJson(response.body)
          .articles;
      _journalNews.addAll(articles);
      debugPrint('Journal Data: ${articles.toList()}');
    } else {
      debugPrint('Error: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 401) {
        debugPrint('API Key might be invalid!');
      } else if (response.statusCode == 404) {
        debugPrint('Endpoint not found!');
      }
      throw Exception("Could not find data!");
    }
  }

  Future<void> getBusinessNews()async {
    final response = await repo.getBusinessNews();
    if (response.statusCode == 200) {
      List<Article> articles = articleResponseModelFromJson(response.body)
          .articles;
      _business.addAll(articles);
      debugPrint('Business Data: ${articles.toList()}');
    } else {
      debugPrint('Error: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 401) {
        debugPrint('API Key might be invalid!');
      } else if (response.statusCode == 404) {
        debugPrint('Endpoint not found!');
      }
      throw Exception("Could not find data!");
    }
  }

  Future<void> getTeslaNews() async {
    final response = await repo.getQueryNews(query: 'tesla', date: '2024-11-18', sortBy: 'publishedAt');

    debugPrint('Response: ${response.body}');

    if (response.statusCode == 200) {
      List<Article> articles = articleResponseModelFromJson(response.body).articles;
      _teslaNews.addAll(articles);
      debugPrint('Tesla Data: ${articles.toList()}');
    } else {
      debugPrint('Error: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 401) {
        debugPrint('API Key might be invalid!');
      } else if (response.statusCode == 404) {
        debugPrint('Endpoint not found!');
      }
      throw Exception("Could not find data!");
    }
  }

  Future<void> getAppleNews() async {
    final response = await repo.getQueryNews(query: 'apple', date: '2024-12-17', sortBy: 'popularity');

    if (response.statusCode == 200) {
      List<Article> articles = articleResponseModelFromJson(response.body).articles;
      _apple.addAll(articles);
      debugPrint('Apple Data: ${articles.toList()}');
    } else {
      debugPrint('Error: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 401) {
        debugPrint('API Key might be invalid!');
      } else if (response.statusCode == 404) {
        debugPrint('Endpoint not found!');
      }
      throw Exception("Could not find data!");
    }
  }


}