import '../../../app/constants.dart';

class ProductsRequest {
  String options;
  String format;
  String apiKey;
  String show;
  int pageSize;
  int page;
  String sort;
  ProductsRequest({
    this.options = "",
    this.format = "json",
    this.apiKey = AppConstants.apiKey,
    this.show =
        "sku,name,manufacturer,new,onSale,condition,regularPrice,salePrice,itemUpdateDate,longDescription,customerReviewCount,customerReviewAverage,categoryPath,productVariations,images,details,includedItemList,features,shipping",
    this.pageSize = 10,
    this.page = 1,
    this.sort = "",
  });
}

