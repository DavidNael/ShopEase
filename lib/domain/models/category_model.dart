class CategoryModel {
  final String name;
  final String image;
  final String description;
  final List<CategoryModel> subCategories;

  CategoryModel({
    required this.name,
    required this.image,
    required this.description,
    required this.subCategories,
  });
}