import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/presentation/screens/products/products_view.dart';

import '../../../resources/widgets_manager.dart';
import '../../error_screen/error_screen.dart';
import '../../products/products_bloc/products_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: FutureBuilder(
          future: context.watch<ProductsBloc>().initFavoriteProducts(),
          builder: (context, state) {
            if (state.hasError) {
              return error(state.error.toString());
            }
            switch (state.connectionState) {
              case ConnectionState.waiting:
                return loading(context);
              case ConnectionState.done:
                if (state.data == null) {
                  return error("No favorites yet");
                } else if (state.hasData) {
                  return WidgetManager.productsList(
                    products: state.data!.products,
                  );
                } else if (state.hasError) {
                  return error("error occured ${state.error.toString()}}");
                } else {
                  return error("unknown error occured");
                }
              default:
                return loading(context);
            }
          },
        ),
      ),
    );
  }
}

Widget loading(context) {
  return productsViewShimmer(context);
}

Widget error(String message) {
  return ErrorScreen(
    message: message,
  );
}
