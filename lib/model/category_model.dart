class CategoryModel{
  final String category;

  CategoryModel({required this.category});
  static List<CategoryModel> categories = [
    CategoryModel(category: 'All'),
    CategoryModel(category: 'Business'),
    CategoryModel(category: 'Technology'),
    CategoryModel(category: 'Tesla'),
    CategoryModel(category: 'Apple'),

  ];
}