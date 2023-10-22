import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_responses.g.dart';

@JsonSerializable()
class CategoryPathResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  CategoryPathResponse({this.id, this.name});
  factory CategoryPathResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryPathResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryPathResponseToJson(this);
}

@JsonSerializable()
class ProductVariationResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;
  ProductVariationResponse({this.name, this.value});
  factory ProductVariationResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVariationResponseToJson(this);
}

@JsonSerializable()
class ProductVariationsResponse {
  @JsonKey(name: 'sku')
  String? sku;
  @JsonKey(name: 'variations')
  List<ProductVariationResponse>? variations;
  ProductVariationsResponse({this.sku, this.variations});
  factory ProductVariationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVariationsResponseToJson(this);
}

@JsonSerializable()
class ImagesResponse {
  @JsonKey(name: 'rel')
  String? rel;
  @JsonKey(name: 'href')
  String? href;
  @JsonKey(name: 'width')
  String? width;
  @JsonKey(name: 'height')
  String? height;
  @JsonKey(name: 'primary')
  bool? primary;
  ImagesResponse({this.rel, this.href, this.width, this.height, this.primary});
  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesResponseToJson(this);
}

@JsonSerializable()
class DetailsResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'values')
  List<String>? values;
  DetailsResponse({this.name, this.values});
  factory DetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsResponseToJson(this);
}

@JsonSerializable()
class IncludedItemsResponse {
  @JsonKey(name: 'includedItem')
  String? includedItem;
  IncludedItemsResponse({this.includedItem});
  factory IncludedItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$IncludedItemsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IncludedItemsResponseToJson(this);
}

@JsonSerializable()
class FeaturesResponse {
  @JsonKey(name: 'feature')
  String? feature;
  FeaturesResponse({this.feature});
  factory FeaturesResponse.fromJson(Map<String, dynamic> json) =>
      _$FeaturesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturesResponseToJson(this);
}

@JsonSerializable()
class ShippingResponse {
  @JsonKey(name: 'secondDay')
  dynamic secondDayCost;
  @JsonKey(name: 'nextDay')
  dynamic nextDayCost;
  ShippingResponse({this.secondDayCost, this.nextDayCost});
  factory ShippingResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingResponseToJson(this);
}

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'sku')
  int? sku;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'manufacturer')
  String? manufacturer;
  @JsonKey(name: 'new')
  bool? newProduct;
  @JsonKey(name: 'onSale')
  bool? onSale;
  @JsonKey(name: 'condition')
  String? condition;
  @JsonKey(name: 'regularPrice')
  double? regularPrice;
  @JsonKey(name: 'salePrice')
  double? salePrice;
  @JsonKey(name: 'itemUpdateDate')
  String? itemUpdateDate;
  @JsonKey(name: 'longDescription')
  String? longDescription;
  @JsonKey(name: 'customerReviewCount')
  int? customerReviewCount;
  @JsonKey(name: 'customerReviewAverage')
  double? customerReviewAverage;
  @JsonKey(name: 'categoryPath')
  List<CategoryPathResponse>? categoryPath;
  @JsonKey(name: 'productVariations')
  List<ProductVariationsResponse>? productVariations;
  @JsonKey(name: 'images')
  List<ImagesResponse>? images;
  @JsonKey(name: 'details')
  List<DetailsResponse>? details;
  @JsonKey(name: 'includedItemList')
  List<IncludedItemsResponse>? includedItemList;
  @JsonKey(name: 'features')
  List<FeaturesResponse>? features;
  @JsonKey(name: 'shipping')
  List<ShippingResponse>? shipping;
  ProductResponse({
    this.sku,
    this.name,
    this.manufacturer,
    this.newProduct,
    this.onSale,
    this.condition,
    this.regularPrice,
    this.salePrice,
    this.itemUpdateDate,
    this.longDescription,
    this.customerReviewCount,
    this.customerReviewAverage,
    this.categoryPath,
    this.productVariations,
    this.images,
    this.details,
    this.includedItemList,
    this.features,
    this.shipping,
  });
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'message')
  String? message;
  ErrorResponse({this.code, this.status, this.message});
  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: 'from')
  int? from;
  @JsonKey(name: 'to')
  int? to;
  @JsonKey(name: 'currentPage')
  int? currentPage;
  @JsonKey(name: 'totalPages')
  int? totalPages;
  @JsonKey(name: 'total')
  int? totalItems;
  @JsonKey(name: 'products')
  List<ProductResponse>? products;
  @JsonKey(name: 'error')
  ErrorResponse? error;
  ProductsResponse({
    this.from,
    this.to,
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.products,
  });
  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

/*
sku,name,manufacturer,new,onSale,condition,itemUpdateDate,longDescription,customerReviewCount,customerReviewAverage,categoryPath,productVariations,images,details,includedItemList,productVariations,features,shipping


sku
name
manufacturer
new
onSale
condition
itemUpdateDate
longDescription
customerReviewCount
customerReviewAverage

categoryPath
productVariations
images
details
includedItemList
productVariations
features
shipping
*/ 