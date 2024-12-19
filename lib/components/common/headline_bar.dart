import 'package:flutter/material.dart';
import 'package:news_app/utils/static/app_dimension.dart';

class HeadlineBar extends StatelessWidget {
  const HeadlineBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: AppDimensions.defaultHorizontalPadding, vertical: AppDimensions.defaultVerticalPadding),
      child:Text(text.toUpperCase(),
          style:const TextStyle(
              fontSize: 20.0,
              color:Colors.black,
              fontWeight:FontWeight.bold
          )),
    );
  }
}
