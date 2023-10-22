

part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.loaded(List<ProductsModel> products) = _Loaded;
  const factory ProductsState.error(String message) = _Error;
}
// abstract class ProductsState {}

// class ProductsInitialState extends ProductsState {}

// class ProductsLoadingState extends ProductsState {}

// class ProductsLoadedState extends ProductsState {
//   final List<ShoppingItemModel> products;

//   ProductsLoadedState(this.products);
// }

// class ProductsErrorState extends ProductsState {
//   final String message;

//   ProductsErrorState(this.message);
// }
