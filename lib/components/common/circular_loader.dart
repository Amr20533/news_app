import 'package:flutter/material.dart';
import 'package:news_app/utils/static/app_colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),);
  }
}