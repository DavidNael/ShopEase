import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/screens/homepage/views/shop_view.dart';

import '../../../data/models/category_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/widgets_manager.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

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
        title: Text(AppStrings.products,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                child: WidgetsManager.subCategoryList(
                  context: context,
                  categories: categories,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                child: filterWidget(context: context),
              ),
              WidgetsManager.productsList(
                shoppingItems: shoppingItems,
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
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: WidgetsManager.customElevatedButton(
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
        child: WidgetsManager.customElevatedButton(
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
      Expanded(
        child: WidgetsManager.customElevatedButton(
          context: context,
          onPressed: () {},
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: AppSize.s0,
          child: const Icon(
            Icons.view_module_rounded,
          ),
        ),
      ),
    ],
  );
}
