
import 'package:news_app/model/source_model.dart';

class SourceResponse{
  final List<Source> sources;
  final String error;
  SourceResponse({required this.error,required this.sources});
  SourceResponse.fromJson(Map<String,dynamic> json)
      :sources=(json["sources"] as List).map((e) => Source.fromJson(e)).toList(),
        error="";
  SourceResponse.withError(String errorValue)
      :sources=[],
        error=errorValue;
}