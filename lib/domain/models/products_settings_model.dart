import 'dart:ui';

import '../../presentation/resources/color_manager.dart';

enum SortMode { price, newest, oldest, rating, popular, discount }

class SortModel {
  SortMode filter;
  bool isAscending;
  SortModel({required this.filter, required this.isAscending});
  SortModel copyWith({
    SortMode? filter,
    bool? isAscending,
  }) {
    return SortModel(
      filter: filter ?? this.filter,
      isAscending: isAscending ?? this.isAscending,
    );
  }
}

class FilterModel {
  final double minPrice;
  final double maxPrice;
  final double minRating;
  final double maxRating;
  final double minDiscount;
  final double maxDiscount;
  final bool isFavorite;
  final bool isPopular;
  final bool isDiscounted;
  final Color color;
  final String category;

  FilterModel({
    required this.minPrice,
    required this.maxPrice,
    required this.minRating,
    required this.maxRating,
    required this.minDiscount,
    required this.maxDiscount,
    required this.isFavorite,
    required this.isPopular,
    required this.isDiscounted,
    required this.color,
    required this.category,
  });

  FilterModel copyWith({
    double? minPrice,
    double? maxPrice,
    double? minRating,
    double? maxRating,
    double? minDiscount,
    double? maxDiscount,
    bool? isFavorite,
    bool? isPopular,
    bool? isDiscounted,
    Color? color,
    String? category,
  }) {
    return FilterModel(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      minRating: minRating ?? this.minRating,
      maxRating: maxRating ?? this.maxRating,
      minDiscount: minDiscount ?? this.minDiscount,
      maxDiscount: maxDiscount ?? this.maxDiscount,
      isFavorite: isFavorite ?? this.isFavorite,
      isPopular: isPopular ?? this.isPopular,
      isDiscounted: isDiscounted ?? this.isDiscounted,
      color: color ?? this.color,
      category: category ?? this.category,
    );
  }
}

class ProductsSettings {
  final SortModel sortMode;
  final FilterModel filterSettings;
  final bool isGrid = false;

  ProductsSettings(this.sortMode, this.filterSettings);
  factory ProductsSettings.initial() {
    return ProductsSettings(
      SortModel(filter: SortMode.price, isAscending: true),
      FilterModel(
        minPrice: 0,
        maxPrice: 1000,
        minRating: 0,
        maxRating: 5,
        minDiscount: 0,
        maxDiscount: 100,
        isFavorite: false,
        isPopular: false,
        isDiscounted: false,
        color: ColorManager.white,
        category: 'All',
      ),
    );
  }
  ProductsSettings copyWith({
    SortModel? sortMode,
    FilterModel? filterSettings,
  }) {
    return ProductsSettings(
      sortMode ?? this.sortMode,
      filterSettings ?? this.filterSettings,
    );
  }
}
