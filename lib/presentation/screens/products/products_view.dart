import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopease/data/network/requests/remote_requests.dart';
import 'package:shopease/domain/models/products_settings_model.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/screens/error_screen/error_screen.dart';
import 'package:shopease/presentation/screens/products/products_bloc/products_bloc.dart';
import '../../../domain/models/category_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/widgets_manager.dart';
import '../homepage/views/shop_view.dart';

class ProductsView extends StatelessWidget {
  final Category category;
  const ProductsView({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        name: "Clothes",
        image: ImageAssets.clothesCategory,
        description: "Clothes",
        subCategories: [],
      ),
      CategoryModel(
        name: "Shoes",
        image: ImageAssets.shoesCategory,
        description: "Shoes",
        subCategories: [],
      ),
      CategoryModel(
        name: "Bags",
        image: ImageAssets.bagsCategory,
        description: "Bags",
        subCategories: [],
      ),
      CategoryModel(
        name: "Accessories",
        image: ImageAssets.accessoriesCategory,
        description: "Accessories",
        subCategories: [],
      ),
      CategoryModel(
        name: "Beauty",
        image: ImageAssets.beautyCategory,
        description: "Beauty",
        subCategories: [],
      ),
      CategoryModel(
        name: "Electronics",
        image: ImageAssets.electronicsCategory,
        description: "Electronics",
        subCategories: [],
      ),
      CategoryModel(
        name: "Shirts",
        image: ImageAssets.shirtCategory,
        description: "Shirts",
        subCategories: [],
      ),
      CategoryModel(
        name: "Home",
        image: ImageAssets.homeCategory,
        description: "Home",
        subCategories: [],
      ),
      CategoryModel(
        name: "Kids",
        image: ImageAssets.kidsCategory,
        description: "Kids",
        subCategories: [],
      ),
      CategoryModel(
        name: "Sports",
        image: ImageAssets.sportsCategory,
        description: "Sports",
        subCategories: [],
      ),
      CategoryModel(
        name: "Toys",
        image: ImageAssets.toysCategory,
        description: "Toys",
        subCategories: [],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                child: WidgetManager.subCategoryList(
                  context: context,
                  categories: categories,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                child: BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    return filterWidget(
                      context: context,
                      settings: context.watch<ProductsBloc>().settings,
                    );
                  },
                ),
              ),
              FutureBuilder(
                future: context.read<ProductsBloc>().initCurrentProducts(
                    forceLoad: true,
                    request: ProductsRequest(
                        options: "(categoryPath.id=${category.id})")),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ErrorScreen(
                      message: snapshot.error.toString(),
                    );
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return productsViewShimmer(context);
                    case ConnectionState.done:
                      return WidgetManager.productsList(
                        products: context
                            .watch<ProductsBloc>()
                            .currentProducts!
                            .products,
                      );
                    default:
                      return productsViewShimmer(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget filterWidget({
  required BuildContext context,
  required ProductsSettings settings,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: WidgetManager.customElevatedButton(
          context: context,
          onPressed: () {},
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: AppSize.s0,
          child: const Row(
            children: [
              Icon(
                Icons.filter_list_rounded,
              ),
              Text(AppStrings.filters)
            ],
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: WidgetManager.customElevatedButton(
          context: context,
          onPressed: () {},
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: AppSize.s0,
          child: const Row(
            children: [
              Icon(
                Icons.swap_vert_rounded,
              ),
              Expanded(child: Text("Price: lowest to highest"))
            ],
          ),
        ),
      ),
      WidgetManager.customElevatedButton(
        context: context,
        onPressed: () {},
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppSize.s0,
        child: const Icon(
          Icons.view_module_rounded,
        ),
      ),
    ],
  );
}

Widget productsViewShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Theme.of(context).inputDecorationTheme.fillColor!,
    highlightColor: Theme.of(context).disabledColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          10,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Container(
                    width: AppSize.s120,
                    height: AppSize.s110,
                    margin: const EdgeInsets.only(right: AppMargin.m10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: AppSize.s20,
                        width: MediaQuery.of(context).size.width * 0.6,
                        margin: const EdgeInsets.only(top: AppMargin.m16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                      Container(
                        height: AppSize.s20,
                        width: MediaQuery.of(context).size.width * 0.6,
                        margin:
                            const EdgeInsets.symmetric(vertical: AppMargin.m16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                      Container(
                        height: AppSize.s20,
                        width: AppSize.s100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ],
                  ),
                ]),
              )),
    ),
  );
}
