import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/data/network/requests/remote_requests.dart';
import 'package:shopease/domain/models/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopease/domain/models/products_settings_model.dart';
import 'package:shopease/domain/usecase/usecase_impl.dart';
import 'package:shopease/presentation/screens/authentication/auth_bloc/auth_bloc.dart';

import '../../../resources/widgets_manager.dart';

// import 'package:shopease/presentation/screens/products/products_bloc/products_events.dart';
// import 'package:shopease/presentation/screens/products/products_bloc/products_states.dart';

part 'products_bloc.freezed.dart';
part 'products_events.dart';

part 'products_states.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final UseCaseImpl _productsUseCase;
  ProductsModel? newProducts;
  ProductsModel? onSaleProducts;
  ProductsModel? recommendedProducts;
  ProductsModel? currentProducts;
  ProductsModel? favoriteProducts;
  ProductsModel? cartProducts;
  ProductModel? currentProduct;
  ProductsSettings settings = ProductsSettings.initial();
  ProductsBloc(this._productsUseCase) : super(const _Initial()) {
    on<_ChangeSettingsEvent>((event, emit) {
      // emit(const _Loading());
      // settings = event.productsSettings;
      // emit(_Loaded(products));
    });
    on<_GetProductsEvent>((event, emit) async {
      emit(const _Loading());
      List<ProductsModel> products = [];
      for (var request in event.request) {
        (await _productsUseCase.getProducts(input: request)).fold(
          (error) => emit(_Error(error.message)),
          (model) => products.add(model),
        );
      }
      emit(_Loaded(products));
    });
    on<_SwitchProductFavoriteEvent>(
      (event, emit) async {
        emit(const _Loading());
        if (AuthBloc.currentUser == null) {
          emit(const _Error("You must be logged in to add to favorites"));
          return;
        }
        final newUser = AuthBloc.currentUser!;
        newUser.favorites.contains(event.product.sku.toString())
            ? newUser.favorites.remove(event.product.sku.toString())
            : newUser.favorites.add(event.product.sku.toString());
        await _productsUseCase.updateUser(user: newUser);
        emit(const _Loaded([]));
      },
    );
    on<_SwitchProductCartEvent>(
      (event, emit) async {
        emit(const _Loading());
        if (AuthBloc.currentUser == null) {
          emit(const _Error("You must be logged in to add to cart"));
          return;
        }
        final newUser = AuthBloc.currentUser!;
        newUser.cart.contains(event.product.sku.toString())
            ? {
                newUser.cart.remove(event.product.sku.toString()),
                WidgetManager.showToast(
                  text: "Removed From Cart",
                )
              }
            : {
                newUser.cart.add(event.product.sku.toString()),
                WidgetManager.showToast(
                  text: "Added To Cart",
                )
              };
        await _productsUseCase.updateUser(user: newUser);
        emit(const _Loaded([]));
      },
    );
  }

  String getProductsWithSKU({required List<String> ids}) {
    String result = "";
    for (var id in ids) {
      result += "sku=$id|";
    }
    return result.substring(0, result.length - 1);
  }

  Future<void> initCurrentProducts(
      {required ProductsRequest request, bool forceLoad = false}) async {
    if (currentProducts == null || forceLoad) {
      try {
        await Future.wait([
          (await _productsUseCase.getProducts(
            input: request,
          ))
              .fold(
            (error) => throw (error.message),
            (model) async {
              currentProducts = model;
            },
          ),
        ]);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  Future<List<ProductsModel>> initHomeProducts() async {
    if (newProducts == null || onSaleProducts == null) {
      try {
        await Future.wait([
          (await _productsUseCase.getProducts(
            input: ProductsRequest(
              sort: "itemUpdateDate.desc",
            ),
          ))
              .fold(
            (error) => throw (error.message),
            (model) async {
              newProducts = model;
            },
          ),
          (await _productsUseCase.getProducts(
            input: ProductsRequest(
              options: "(onSale=true)",
              sort: "itemUpdateDate.desc",
            ),
          ))
              .fold(
            (error) => throw (error.message),
            (model) async {
              onSaleProducts = model;
            },
          ),
        ]);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return [newProducts!, onSaleProducts!];
  }

  Future<ProductsModel> initRecommendedProducts() async {
    if (recommendedProducts == null || currentProduct == null) {
      try {
        await (await _productsUseCase.getProducts(
          input: ProductsRequest(
              // options: "(manufacturer=${currentProduct!.manufacturer})",
              ),
        ))
            .fold(
          (error) => throw (error.message),
          (model) async {
            recommendedProducts = model;
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return recommendedProducts!;
  }

  Future<ProductsModel?> initFavoriteProducts() async {
    try {
      if (AuthBloc.currentUser!.favorites.isEmpty) {
        return null;
      }
      await (await _productsUseCase.getProducts(
        input: ProductsRequest(
          options:
              "(${getProductsWithSKU(ids: AuthBloc.currentUser!.favorites)})",
        ),
      ))
          .fold(
        (error) => throw (error.message),
        (model) async {
          favoriteProducts = model;
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return favoriteProducts!;
  }

  Future<ProductsModel?> initCartProducts() async {
    try {
      if (AuthBloc.currentUser!.cart.isEmpty) {
        return null;
      }
      await (await _productsUseCase.getProducts(
        input: ProductsRequest(
          options: "(${getProductsWithSKU(ids: AuthBloc.currentUser!.cart)})",
        ),
      ))
          .fold(
        (error) => throw (error.message),
        (model) async {
          cartProducts = model;
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return cartProducts!;
  }
}
