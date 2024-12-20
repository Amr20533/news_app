import 'package:flutter/material.dart';
import 'package:news_app/model/source_model.dart';
import 'package:news_app/utils/static/app_dimension.dart';

class SourceTile extends StatelessWidget {
  const SourceTile({
    super.key,
    required this.source,
  });

  final Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.defaultHorizontalPadding),
        child: Text(source.name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
