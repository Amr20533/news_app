import 'package:news_app/model/source_model.dart';

class Article {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String publishedAt;
  String content;

  // Constructor that initializes the Article object with the required and optional parameters
  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  // Factory constructor to create an Article object from a JSON map
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),  // Calls Source.fromJson to handle the nested 'source' object
      author: json['author'],  // Optional field, can be null
      title: json['title'] ?? '',  // Provides a default empty string if 'title' is null
      description: json['description'] ?? '',  // Provides a default empty string if 'description' is null
      url: json['url'] ?? '',  // Provides a default empty string if 'url' is null
      urlToImage: json['urlToImage'],  // Optional field, can be null
      publishedAt: json['publishedAt'] ?? '',  // Default empty string if 'publishedAt' is null
      content: json['content'] ?? '',  // Default empty string if 'content' is null
    );
  }

  // Method to convert the Article object back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'source': source.toJson(),  // Calls the toJson() method on the 'source' object
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
