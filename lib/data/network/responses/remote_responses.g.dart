// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryPathResponse _$CategoryPathResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryPathResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryPathResponseToJson(
        CategoryPathResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductVariationResponse _$ProductVariationResponseFromJson(
        Map<String, dynamic> json) =>
    ProductVariationResponse(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ProductVariationResponseToJson(
        ProductVariationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

ProductVariationsResponse _$ProductVariationsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductVariationsResponse(
      sku: json['sku'] as String?,
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) =>
              ProductVariationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductVariationsResponseToJson(
        ProductVariationsResponse instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'variations': instance.variations,
    };

ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) =>
    ImagesResponse(
      rel: json['rel'] as String?,
      href: json['href'] as String?,
      width: json['width'] as String?,
      height: json['height'] as String?,
      primary: json['primary'] as bool?,
    );

Map<String, dynamic> _$ImagesResponseToJson(ImagesResponse instance) =>
    <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
      'width': instance.width,
      'height': instance.height,
      'primary': instance.primary,
    };

DetailsResponse _$DetailsResponseFromJson(Map<String, dynamic> json) =>
    DetailsResponse(
      name: json['name'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DetailsResponseToJson(DetailsResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };

IncludedItemsResponse _$IncludedItemsResponseFromJson(
        Map<String, dynamic> json) =>
    IncludedItemsResponse(
      includedItem: json['includedItem'] as String?,
    );

Map<String, dynamic> _$IncludedItemsResponseToJson(
        IncludedItemsResponse instance) =>
    <String, dynamic>{
      'includedItem': instance.includedItem,
    };

FeaturesResponse _$FeaturesResponseFromJson(Map<String, dynamic> json) =>
    FeaturesResponse(
      feature: json['feature'] as String?,
    );

Map<String, dynamic> _$FeaturesResponseToJson(FeaturesResponse instance) =>
    <String, dynamic>{
      'feature': instance.feature,
    };

ShippingResponse _$ShippingResponseFromJson(Map<String, dynamic> json) =>
    ShippingResponse(
      secondDayCost: json['secondDay'],
      nextDayCost: json['nextDay'],
    );

Map<String, dynamic> _$ShippingResponseToJson(ShippingResponse instance) =>
    <String, dynamic>{
      'secondDay': instance.secondDayCost,
      'nextDay': instance.nextDayCost,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      sku: json['sku'] as int?,
      name: json['name'] as String?,
      manufacturer: json['manufacturer'] as String?,
      newProduct: json['new'] as bool?,
      onSale: json['onSale'] as bool?,
      condition: json['condition'] as String?,
      regularPrice: (json['regularPrice'] as num?)?.toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      itemUpdateDate: json['itemUpdateDate'] as String?,
      longDescription: json['longDescription'] as String?,
      customerReviewCount: json['customerReviewCount'] as int?,
      customerReviewAverage:
          (json['customerReviewAverage'] as num?)?.toDouble(),
      categoryPath: (json['categoryPath'] as List<dynamic>?)
          ?.map((e) => CategoryPathResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      productVariations: (json['productVariations'] as List<dynamic>?)
          ?.map((e) =>
              ProductVariationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => DetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      includedItemList: (json['includedItemList'] as List<dynamic>?)
          ?.map(
              (e) => IncludedItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeaturesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipping: (json['shipping'] as List<dynamic>?)
          ?.map((e) => ShippingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'name': instance.name,
      'manufacturer': instance.manufacturer,
      'new': instance.newProduct,
      'onSale': instance.onSale,
      'condition': instance.condition,
      'regularPrice': instance.regularPrice,
      'salePrice': instance.salePrice,
      'itemUpdateDate': instance.itemUpdateDate,
      'longDescription': instance.longDescription,
      'customerReviewCount': instance.customerReviewCount,
      'customerReviewAverage': instance.customerReviewAverage,
      'categoryPath': instance.categoryPath,
      'productVariations': instance.productVariations,
      'images': instance.images,
      'details': instance.details,
      'includedItemList': instance.includedItemList,
      'features': instance.features,
      'shipping': instance.shipping,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      code: json['code'] as int?,
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
    };

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      from: json['from'] as int?,
      to: json['to'] as int?,
      currentPage: json['currentPage'] as int?,
      totalPages: json['totalPages'] as int?,
      totalItems: json['total'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..error = json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'total': instance.totalItems,
      'products': instance.products,
      'error': instance.error,
    };
