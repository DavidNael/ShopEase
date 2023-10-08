import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopease/data/models/carousel_model.dart';
import 'package:shopease/data/models/shopping_item_model.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import 'package:shopease/presentation/resources/font_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/style_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/resources/widgets_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CarouselModel> carouselItems = [
      CarouselModel(
        image: ImageAssets.fashionSaleCarousel,
        title: AppStrings.fashionSale,
      ),
      CarouselModel(
        image: ImageAssets.electronicsCarousel,
        title: AppStrings.newArrivals,
      ),
    ];
    List<ShoppingItemModel> shoppingItems = [
      ShoppingItemModel(
        image: ImageAssets.fashionSaleCarousel,
        title: AppStrings.fashionSale,
        brand: "Nike",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        rating: 4.5,
        price: 100,
        discountPrice: 75,
        isFavorite: true,
      ),
      ShoppingItemModel(
        image: ImageAssets.electronicsCarousel,
        title: AppStrings.newArrivals,
        brand: "Apple",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        rating: 4.3,
        price: 100,
        discountPrice: 80,
        isFavorite: false,
      ),
      ShoppingItemModel(
        image: ImageAssets.fashionSaleCarousel,
        title: AppStrings.fashionSale,
        brand: "Nike",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        rating: 2.7,
        price: 100,
        discountPrice: 20,
        isFavorite: true,
      ),
      ShoppingItemModel(
        image: ImageAssets.electronicsCarousel,
        title: AppStrings.newArrivals,
        brand: "Apple",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        rating: 3.5,
        price: 100,
        discountPrice: 10,
        isFavorite: false,
      ),
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            itemCount: carouselItems.length,
            itemBuilder: (context, index, realIndex) {
              return carouselElement(
                context: context,
                image: carouselItems[index].image,
                title: carouselItems[index].title,
              );
            },
            options: CarouselOptions(
              height: AppSize.s400,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m24),
            child: WidgetsManager.categorySlider(
              context: context,
              title: "New",
              description: "You've never seen it before",
              items: shoppingItems,
            ),
          ),
          Container(
            child: WidgetsManager.categorySlider(
              context: context,
              title: "Sale",
              description: "Super summer sale",
              items: shoppingItems,
            ),
          ),
        ],
      ),
    );
  }
}

Widget carouselElement({
  required BuildContext context,
  required String image,
  required String title,
}) {
  return SizedBox(
    height: AppSize.s400,
    child: Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: AppSize.infinity,
        ),
        Container(
          color: ColorManager.black.withOpacity(AppSize.s0_5),
        ),
        Positioned(
          bottom: AppSize.s0,
          left: AppSize.s2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getBoldTextStyle(
                  fontSize: FontSize.s48,
                  color: ColorManager.white,
                ),
              ),
              Container(
                height: AppSize.s34,
                width: AppSize.s140,
                margin: const EdgeInsets.symmetric(vertical: AppSize.s20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.check,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
