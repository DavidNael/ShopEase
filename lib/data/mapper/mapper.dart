import 'package:flutter/foundation.dart';
import 'package:shopease/data/network/responses/remote_responses.dart';

import '../../domain/models/products_model.dart';

extension ProductsResponseMapper on ProductsResponse {
  ProductsModel toDomain() {
    return ProductsModel(
      from: from ?? 0,
      to: to ?? 0,
      currentPage: currentPage ?? 0,
      totalPages: totalPages ?? 0,
      totalItems: totalItems ?? 0,
      products: products?.map((product) => product.toDomain()).toList() ?? [],
    );
  }
}

extension ProductResponseMapper on ProductResponse {
  ProductModel toDomain() {
    return ProductModel(
      sku: sku ?? 0,
      name: name ?? '',
      manufacturer: manufacturer ?? '',
      isNew: newProduct ?? false,
      onSale: onSale ?? false,
      condition: condition ?? '',
      itemUpdateDate: itemUpdateDate ?? '',
      regularPrice: regularPrice ?? 0,
      salePrice: salePrice ?? 0,
      longDescription: longDescription ?? '',
      customerReviewCount: customerReviewCount ?? 0,
      customerReviewAverage: customerReviewAverage ?? 0,
      categoryPath:
          categoryPath?.map((category) => category.toDomain()).toList() ?? [],
      productVariations: productVariations
              ?.map((variation) => variation.toDomain())
              .toList() ??
          [],
      images: images?.map((image) => image.toDomain()).toList() ?? [],
      details: details?.map((detail) => detail.toDomain()).toList() ?? [],
      includedItemList:
          includedItemList?.map((item) => item.toDomain()).toList() ?? [],
      features: features?.map((feature) => feature.toDomain()).toList() ?? [],
      shipping: shipping?.map((shipping) => shipping.toDomain()).toList() ?? [],
    );
  }
}

extension CategoryPathResponseMapper on CategoryPathResponse {
  CategoryPathModel toDomain() {
    return CategoryPathModel(
      id: id ?? '',
      name: name ?? '',
    );
  }
}

extension VariationsResponseMapper on ProductVariationsResponse {
  VariationsModel toDomain() {
    return VariationsModel(
      sku: sku ?? '',
      variations:
          variations?.map((variation) => variation.toDomain()).toList() ?? [],
    );
  }
}

extension VariationResponseMapper on ProductVariationResponse {
  VariationModel toDomain() {
    return VariationModel(
      name: name ?? '',
      value: value ?? '',
    );
  }
}

extension ImageResponseMapper on ImagesResponse {
  ImageModel toDomain() {
    return ImageModel(
      rel: rel ?? '',
      href: href ?? '',
      width: width ?? '',
      height: height ?? '',
      primary: primary ?? false,
    );
  }
}

extension DetailsResponseMapper on DetailsResponse {
  DetailsModel toDomain() {
    return DetailsModel(
      name: name ?? '',
      values: values ?? [],
    );
  }
}

extension IncludedItemsResponseMapper on IncludedItemsResponse {
  IncludedItemsModel toDomain() {
    return IncludedItemsModel(
      includedItem: includedItem ?? '',
    );
  }
}

extension FeaturesResponseMapper on FeaturesResponse {
  FeaturesModel toDomain() {
    return FeaturesModel(
      feature: feature ?? '',
    );
  }
}

extension ShippingResponseMapper on ShippingResponse {
  ShippingModel toDomain() {
    double parsedSecondDayCost = 0;
    double parsedNextDayCost = 0;

    try {
      if (secondDayCost is String) {
        parsedSecondDayCost = double.parse(secondDayCost);
      } else if (secondDayCost is num) {
        parsedSecondDayCost = secondDayCost.toDouble();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing secondDayCost: $e');
      }
    }

    try {
      if (nextDayCost is String) {
        parsedNextDayCost = double.parse(nextDayCost);
      } else if (nextDayCost is num) {
        parsedNextDayCost = nextDayCost.toDouble();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing nextDayCost: $e');
      }
    }

    return ShippingModel(
      secondDayCost: parsedSecondDayCost,
      nextDayCost: parsedNextDayCost,
    );
  }
}
