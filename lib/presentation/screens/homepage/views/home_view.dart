import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import 'package:shopease/presentation/resources/font_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/style_manager.dart';
import 'package:shopease/presentation/resources/theme_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CarouselElement> carouselElements = [
      CarouselElement(
        image: ImageAssets.fashionSaleCarousel,
        title: AppStrings.fashionSale,
      ),
      CarouselElement(
        image: ImageAssets.electronicsCarousel,
        title: AppStrings.newArrivals,
      ),
    ];
    List<ShoppingItem> shoppingItems = [
      ShoppingItem(
        image: ImageAssets.fashionSaleCarousel,
        title: AppStrings.fashionSale,
        rating: 4.5,
        price: 100,
        discountPrice: 75,
      ),
      ShoppingItem(
        image: ImageAssets.electronicsCarousel,
        title: AppStrings.newArrivals,
        rating: 4.3,
        price: 100,
        discountPrice: 80,
      ),
      ShoppingItem(
        image: ImageAssets.fashionSaleCarousel,
        title: AppStrings.fashionSale,
        rating: 2.7,
        price: 100,
        discountPrice: 20,
      ),
      ShoppingItem(
        image: ImageAssets.electronicsCarousel,
        title: AppStrings.newArrivals,
        rating: 3.5,
        price: 100,
        discountPrice: 10,
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            itemCount: carouselElements.length,
            itemBuilder: (context, index, realIndex) {
              return carouselElement(
                image: carouselElements[index].image,
                title: carouselElements[index].title,
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
            child: categorySlider(
              context: context,
              title: "New",
              description: "You've never seen it before",
              items: shoppingItems,
            ),
          ),
          Container(
            child: categorySlider(
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

class CarouselElement {
  final String image;
  final String title;
  CarouselElement({required this.image, required this.title});
}

class ShoppingItem {
  final String image;
  final String title;
  final double rating;
  final double price;
  final double discountPrice;
  ShoppingItem({
    required this.image,
    required this.title,
    required this.rating,
    required this.price,
    required this.discountPrice,
  });
  double get discountPercentage => 100 - (discountPrice / price) * 100;
}

Widget carouselElement({required String image, required String title}) {
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
                  child: const Text(
                    AppStrings.check,
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

Widget categorySlider({
  required BuildContext context,
  required String title,
  required String description,
  required List<ShoppingItem> items,
}) {
  return SizedBox(
    height: AppSize.s380,
    child: Padding(
      padding: const EdgeInsets.only(left: AppPadding.p10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.displayLarge),
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m10),
            child: Text(description,
                style: Theme.of(context).textTheme.displaySmall),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return categoryItem(
                  context: context,
                  image: items[index].image,
                  title: items[index].title,
                  rating: items[index].rating,
                  price: items[index].price,
                  discountPrice: items[index].discountPrice,
                  discountPercentage: items[index].discountPercentage,
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget categoryItem({
  required BuildContext context,
  required String image,
  required String title,
  required double rating,
  required double price,
  required double discountPrice,
  required double discountPercentage,
}) {
  return Container(
    margin: const EdgeInsets.only(right: AppSize.s20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              height: AppSize.s200,
              width: AppSize.s200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: AppSize.s10,
              left: AppSize.s10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s10,
                  vertical: AppSize.s5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  border: Border.all(
                    width: AppSize.s1,
                    color: ColorManager.black.withOpacity(AppSize.s0_5),
                  ),
                  color: ThemeManager.isDark
                      ? ColorManager.darkSales
                      : ColorManager.lightSales,
                ),
                child: Text(
                  '-$discountPercentage%',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.white,
                      ),
                ),
              ),
            ),
            Positioned(
              bottom: AppSize.s0,
              right: AppSize.s2,
              child: ElevatedButton(
                onPressed: () {},
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        ThemeManager.isDark
                            ? ColorManager.darkBlack
                            : ColorManager.lightWhite, 
                      ),
                      overlayColor: MaterialStateProperty.all(
                        ThemeManager.isDark
                            ? ColorManager.darkPrimary
                            : ColorManager.lightPrimary,
                      ),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(
                          AppPadding.p4,
                        ),
                      ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p10),
                  child: SvgPicture.asset(
                    ImageAssets.heartInactiveIcon,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSize.s10),
        Text(
          title,
        ),
        const SizedBox(height: AppSize.s10),
        ratingStars(
          context: context,
          rating: rating,
        ),
        const SizedBox(height: AppSize.s10),
        Row(
          children: [
            Text('\$$price', style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(width: AppSize.s10),
            Text(
              '\$$discountPrice',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: ThemeManager.isDark
                        ? ColorManager.darkSales
                        : ColorManager.lightSales,
                  ),
            ),
            const SizedBox(width: AppSize.s10),
          ],
        ),
      ],
    ),
  );
}

Widget ratingStars({
  required BuildContext context,
  required double rating,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (int i = 0; i < 5; i++)
        Padding(
          padding: const EdgeInsets.only(right: AppPadding.p2),
          child: SvgPicture.asset(
            i < rating
                ? ImageAssets.starIconActive
                : ImageAssets.starIconInactive,
            width: AppSize.s20,
            height: AppSize.s20,
          ),
        ),
      Text(
        '($rating)',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    ],
  );
}
