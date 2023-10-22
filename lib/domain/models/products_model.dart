class ProductsModel {
  int from;
  int to;
  int currentPage;
  int totalPages;
  int totalItems;
  List<ProductModel> products;

  ProductsModel({
    required this.from,
    required this.to,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.products,
  });
}

class ProductModel {
  int sku;
  String name;
  String manufacturer;
  bool isNew;
  bool onSale;
  String condition;
  double regularPrice;
  double salePrice;
  String itemUpdateDate;
  String longDescription;
  int customerReviewCount;
  double customerReviewAverage;
  List<CategoryPathModel> categoryPath;
  List<VariationsModel> productVariations;
  List<ImageModel> images;
  List<DetailsModel> details;
  List<IncludedItemsModel> includedItemList;
  List<FeaturesModel> features;
  List<ShippingModel> shipping;
  double get discountPercentage =>
      (100 - (salePrice / regularPrice) * 100).ceilToDouble();
  ProductModel({
    required this.sku,
    required this.name,
    required this.manufacturer,
    required this.isNew,
    required this.onSale,
    required this.condition,
    required this.regularPrice,
    required this.salePrice,
    required this.itemUpdateDate,
    required this.longDescription,
    required this.customerReviewCount,
    required this.customerReviewAverage,
    required this.categoryPath,
    required this.productVariations,
    required this.images,
    required this.details,
    required this.includedItemList,
    required this.features,
    required this.shipping,
  });
}

class ShippingModel {
  double secondDayCost;
  double nextDayCost;
  ShippingModel({
    required this.secondDayCost,
    required this.nextDayCost,
  });
}

class FeaturesModel {
  String feature;
  FeaturesModel({
    required this.feature,
  });
}

class IncludedItemsModel {
  String includedItem;

  IncludedItemsModel({
    required this.includedItem,
  });
}

class CategoryPathModel {
  String id;
  String name;
  CategoryPathModel({
    required this.id,
    required this.name,
  });
}

class DetailsModel {
  String name;
  List<String> values;
  DetailsModel({
    required this.name,
    required this.values,
  });
}

class ImageModel {
  String rel;
  String href;
  String width;
  String height;
  bool primary;
  ImageModel({
    required this.rel,
    required this.href,
    required this.width,
    required this.height,
    required this.primary,
  });
}

class VariationsModel {
  String sku;
  List<VariationModel> variations;
  VariationsModel({
    required this.sku,
    required this.variations,
  });
}

class VariationModel {
  String name;
  String value;
  VariationModel({
    required this.name,
    required this.value,
  });
}
