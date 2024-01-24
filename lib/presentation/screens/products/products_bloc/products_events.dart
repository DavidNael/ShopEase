part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.changeSettings(
      ProductsSettings productsSettings) = _ChangeSettingsEvent;
  const factory ProductsEvent.getProducts(List<ProductsRequest> request) =
      _GetProductsEvent;
  const factory ProductsEvent.getHomeProducts(ProductsRequest request) =
      _GetHomeProductsEvent;
  const factory ProductsEvent.switchProductFavorite(ProductModel product) =
      _SwitchProductFavoriteEvent;
  const factory ProductsEvent.switchProductCart(ProductModel product) =
      _SwitchProductCartEvent;
}



// abstract class ProductsEvent extends Equatable {
//   const ProductsEvent();

//   @override
//   List<Object> get props => [];
// }

// class ProductsChangeSettingsEvent extends ProductsEvent {
//   final ProductsSettings productsSettings;

//   const ProductsChangeSettingsEvent(this.productsSettings);

//   @override
//   List<Object> get props => [productsSettings];
// }
// class GetProductsEvent extends ProductsEvent {


//   @override
//   List<Object> get props => [];
// }
