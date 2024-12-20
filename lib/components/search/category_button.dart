import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.isSelected, required this.onTap, required this.category});
  final bool isSelected;
  final VoidCallback onTap;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0*0.5),
        child:Column(
          children: [
            Text(category.category,style:TextStyle(color: isSelected ? Colors.black : Colors.grey[500],fontWeight: FontWeight.bold,fontSize: 22)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width:60,
              height: isSelected ? 2 : 1,
              color: isSelected ? Colors.black : Colors.transparent,

            ),
          ],
        ),
      ),
    );
  }
}

