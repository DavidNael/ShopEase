import 'dart:math';

class ShoppingItemModel {
  final String image;
  final String title;
  final String brand;
  final String description;
  final double rating;
  final double price;
  final double discountPrice;
  final bool isFavorite;
  final DateTime date =
      DateTime.now().subtract(Duration(days: Random().nextInt(30)));
  final int popularity = Random().nextInt(100);

  ShoppingItemModel({
    required this.image,
    required this.title,
    required this.brand,
    required this.description,
    required this.rating,
    required this.price,
    required this.discountPrice,
    required this.isFavorite,
  });
  double get discountPercentage => 100 - (discountPrice / price) * 100;
}
