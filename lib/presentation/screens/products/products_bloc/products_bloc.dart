import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/data/network/requests/remote_requests.dart';
import 'package:shopease/domain/models/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopease/domain/models/products_settings_model.dart';
import 'package:shopease/domain/usecase/usecase_impl.dart';

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
            (model) async => currentProducts = model,
          ),
        ]);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  Future<void> initHomeProducts() async {
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
            (model) async => newProducts = model,
          ),
          (await _productsUseCase.getProducts(
            input: ProductsRequest(
              options: "(onSale=true)",
              sort: "itemUpdateDate.desc",
            ),
          ))
              .fold(
            (error) => throw (error.message),
            (model) async => onSaleProducts = model,
          ),
        ]);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  Future<void> initRecommendedProducts() async {
    if (recommendedProducts == null || currentProduct == null) {
      try {
        await Future.wait([
          (await _productsUseCase.getProducts(
            input: ProductsRequest(
                // options: "(manufacturer=${currentProduct!.manufacturer})",
                ),
          ))
              .fold(
            (error) => throw (error.message),
            (model) async => recommendedProducts = model,
          ),
        ]);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
