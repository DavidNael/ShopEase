import 'package:flutter/material.dart';
import 'package:shopease/data/models/shopping_item_model.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/resources/widgets_manager.dart';

import '../../products/products_view.dart';

List<Category> categories = [
  const Category(name: "Clothes", image: ImageAssets.clothesCategory),
  const Category(name: "Shoes", image: ImageAssets.shoesCategory),
  const Category(name: "Bags", image: ImageAssets.bagsCategory),
  const Category(name: "Accessories", image: ImageAssets.accessoriesCategory),
  const Category(name: "Beauty", image: ImageAssets.beautyCategory),
  const Category(name: "Electronics", image: ImageAssets.electronicsCategory),
  const Category(name: "Shirts", image: ImageAssets.shirtCategory),
  const Category(name: "Home", image: ImageAssets.homeCategory),
  const Category(name: "Kids", image: ImageAssets.kidsCategory),
  const Category(name: "Sports", image: ImageAssets.sportsCategory),
  const Category(name: "Toys", image: ImageAssets.toysCategory),
];
List<ShoppingItemModel> shoppingItems = [
  ShoppingItemModel(
    image: "https://picsum.photos/200",
    title: "Washing Machine",
    brand: "LG",
    description:
        "LG 7.5 Kg 5 Star Smart Inverter Fully-Automatic Top Loading Washing Machine",
    rating: 4.5,
    price: 100,
    discountPrice: 75,
    isFavorite: false,
  ),
  ShoppingItemModel(
    image: "https://picsum.photos/200",
    title: "Shoes",
    brand: "Nike",
    description: "Nike Air Max 270",
    rating: 4.3,
    price: 100,
    discountPrice: 80,
    isFavorite: true,
  ),
  ShoppingItemModel(
    image: "https://picsum.photos/200",
    title: "Mobile",
    brand: "Samsung",
    description: "Samsung Galaxy S21 Ultra 5G",
    rating: 2.7,
    price: 100,
    discountPrice: 20,
    isFavorite: false,
  ),
  ShoppingItemModel(
    image: "https://picsum.photos/200",
    title: "Shirt",
    brand: "Polo",
    description: "Polo Shirt",
    rating: 3.5,
    price: 100,
    discountPrice: 10,
    isFavorite: true,
  ),
  ShoppingItemModel(
    image: "https://picsum.photos/200",
    title: "Shirt",
    brand: "Polo",
    description: "Polo Shirt",
    rating: 3.5,
    price: 100,
    discountPrice: 10,
    isFavorite: true,
  ),
  ShoppingItemModel(
    image: "https://picsum.photos/200",
    title: "Shirt",
    brand: "Polo",
    description: "Polo Shirt",
    rating: 3.5,
    price: 100,
    discountPrice: 10,
    isFavorite: true,
  ),
];

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: categoryView(context: context));
  }
}

Widget categoryView({required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                AppStrings.categories,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Positioned(
              right: AppSize.s10,
              child: IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        width: AppSize.infinity,
        height: AppSize.s44,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            AppStrings.viewAllItems,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorManager.white,
                ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p14,
          vertical: AppPadding.p18,
        ),
        child: Text(
          AppStrings.chooseCategory,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      viewCategories(categories: categories),
    ],
  );
}

class Category {
  final String name;
  final String image;
  const Category({required this.name, required this.image});
}

Widget viewCategories({required List<Category> categories}) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m14),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsView(),
                    ),
                  );
                },
                visualDensity: const VisualDensity(vertical: 4),
                title: Text(categories[index].name),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  child: Image.asset(
                    categories[index].image,
                    width: AppSize.s70,
                    height: AppSize.s70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(categories[index].name),
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(AppSize.s500),
              //       child: Image.asset(
              //         categories[index].image,
              //         width: AppSize.s70,
              //         height: AppSize.s70,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ],
              // ),
              Divider(
                color: Theme.of(context).disabledColor,
                thickness: AppSize.s0_2,
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget itemsList({required List<ShoppingItemModel> items}) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Material(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    items[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items[index].title),
                      Text(items[index].brand),
                      WidgetsManager.ratingStars(
                          context: context, rating: items[index].rating),
                      Text("${items[index].price}\$"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
