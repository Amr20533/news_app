import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeader = {
      // 'Content-type':'application/json',
      'Accept': 'application/json',
    };
  }

  Future<Response> getData(String uri, Map<String, dynamic> query) async {
    try {
      debugPrint('Request URL: $uri');
      debugPrint('Request Params: $query');

      Response response = await get(uri, query: query, headers: _mainHeader);

      debugPrint('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        debugPrint('Response Body: ${response.body}');
      } else {
        debugPrint('Error: ${response.statusCode} - ${response.statusText}');
      }

      return response;
    } catch (e) {
      debugPrint('Error in getData: $e');
      return Response(
        statusCode: 500,
        statusText: 'An error occurred: ${e.toString()}',
      );
    }
  }


  Future<http.Response> requestData(String uri, Map<String, dynamic> query) async {
    try {
      final uriWithParams = Uri.parse(uri).replace(queryParameters: query);
      debugPrint('Request URL: $uriWithParams');
      debugPrint('Request Params: $query');

      final response = await http.get(uriWithParams);

      // Check if the request was successful
      if (response.statusCode == 200) {
        debugPrint('Response Status: ${response.statusCode}');
        debugPrint('Response Body: ${response.body}');
        return response;
      } else {
        debugPrint('Error: ${response.statusCode} - ${response.body}');
        return response;
      }
    } catch (e) {
      debugPrint('Error in getData: $e');
      return http.Response('An error occurred: ${e.toString()}', 500);
    }
  }

}
