import 'package:flutter/material.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';

import '../../../resources/temp_data.dart';
import '../../products/products_view.dart';

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
  final String id;
  final String image;
  const Category({required this.name, required this.id, required this.image});
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
                      builder: (context) => ProductsView(
                        category: categories[index],
                      ),
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
