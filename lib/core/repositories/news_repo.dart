import 'package:flutter/material.dart';
import 'package:news_app/core/dependencies/api_client.dart';
import 'package:news_app/utils/static/app_constants.dart';
import 'package:http/http.dart' as http;

class NewsRepo {
  final ApiClient apiClient;
  NewsRepo({required this.apiClient});

  Future<http.Response> getJournalNews()async{
    try {
      return await apiClient.requestData(AppConstants.baseUrl, {
        'domains': AppConstants.allNewsDomain,
        'apiKey': AppConstants.apiKey,
      });
    } catch (e) {
      debugPrint('Error while making API request: $e');
      return http.Response('Error: $e', 500);
    }
  }

  Future<http.Response> getTechnologyNews()async{
    try {
      return await apiClient.requestData(AppConstants.headlineBaseUrl, {
        'sources': AppConstants.technology,
        'apiKey': AppConstants.apiKey,
      });
    } catch (e) {
      debugPrint('Error while making API request: $e');
      return http.Response('Error: $e', 500);
    }
  }
  Future<http.Response> getBusinessNews()async{
    try {
      return await apiClient.requestData(AppConstants.headlineBaseUrl, {
        'country': AppConstants.country,
        'category': AppConstants.business,
        'apiKey': AppConstants.apiKey,
      });
    } catch (e) {
      debugPrint('Error while making API request: $e');
      return http.Response('Error: $e', 500);
    }
  }

  Future<http.Response> getQueryNews({required String query, required String date, required String sortBy}) async {
    try {
      return await apiClient.requestData(AppConstants.baseUrl, {
        'q': query,
        'from': date,
        'sortBy': sortBy,
        'apiKey': AppConstants.apiKey,
      });
    } catch (e) {
      debugPrint('Error while making API request: $e');
      return http.Response('Error: $e', 500);
    }
  }

  Future<http.Response> getPeriodicNews({required String query, required String from, required String to, required String sortBy}) async {
    try {
      return await apiClient.requestData(AppConstants.baseUrl, {
        'q': query,
        'from': from,
        'to': to,
        'sortBy': sortBy,
        'apiKey': AppConstants.apiKey,
      });
    } catch (e) {
      debugPrint('Error while making API request: $e');
      return http.Response('Error: $e', 500);
    }
  }
}