import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopease/domain/models/products_model.dart';
import 'package:shopease/presentation/resources/widgets_manager.dart';
import 'package:shopease/presentation/screens/authentication/auth_bloc/auth_bloc.dart';
import 'package:shopease/presentation/screens/error_screen/error_screen.dart';
import 'package:shopease/presentation/screens/products/products_bloc/products_bloc.dart';

import '../../../data/network/requests/remote_requests.dart';
import '../../../domain/models/carousel_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../homepage/views/home_view.dart';

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

class ProductView extends StatelessWidget {
  final ProductModel item;
  const ProductView({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<ProductsBloc>()
        .add(ProductsEvent.getProducts([ProductsRequest()]));
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name, style: Theme.of(context).textTheme.displaySmall),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
          future: context.read<ProductsBloc>().initRecommendedProducts(),
          builder: (context, state) {
            if (state.hasError) {
              return ErrorScreen(
                message: state.error.toString(),
              );
            }
            switch (state.connectionState) {
              case ConnectionState.waiting:
                return productViewShimmer(context);
              case ConnectionState.done:
                if (state.data == null) {
                  return error("No Product yet");
                } else if (state.hasData) {
                  return productView(
                    context: context,
                    product: item,
                    products: state.data!.products,
                  );
                } else if (state.hasError) {
                  return error("error occured ${state.error.toString()}");
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

Widget productView({
  required BuildContext context,
  required ProductModel product,
  required List<ProductModel> products,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 1 Product Images
      CarouselSlider.builder(
        itemCount: product.images.length,
        itemBuilder: (context, index, realIndex) {
          return carouselElement(
            context: context,
            image: product.images[index].href,
            imageHeight: double.parse(product.images[index].height),
            title: "",
            showButton: false,
          );
        },
        options: CarouselOptions(
          height: AppSize.s400,
          viewportFraction: 0.9,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          scrollDirection: Axis.horizontal,
        ),
      ),
      // 2 required options
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: WidgetManager.dropdownButton(
              context: context,
              hint: AppStrings.size,
              margin: const EdgeInsets.symmetric(
                horizontal: AppMargin.m8,
              ),
              items: const [
                DropdownMenuItem(value: 1, child: Text("S")),
                DropdownMenuItem(value: 2, child: Text("M")),
                DropdownMenuItem(value: 3, child: Text("L")),
                DropdownMenuItem(value: 4, child: Text("XL")),
              ],
              buttonColor: Theme.of(context).scaffoldBackgroundColor,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: WidgetManager.dropdownButton(
              context: context,
              hint: AppStrings.color,
              margin: const EdgeInsets.symmetric(
                horizontal: AppMargin.m8,
              ),
              items: const [
                DropdownMenuItem(value: 1, child: Text("Black")),
                DropdownMenuItem(value: 2, child: Text("White")),
                DropdownMenuItem(value: 3, child: Text("Red")),
                DropdownMenuItem(value: 4, child: Text("Grey")),
              ],
              buttonColor: Theme.of(context).scaffoldBackgroundColor,
              onChanged: (value) {},
            ),
          ),
          WidgetManager.hoveringIconWidget(
            context: context,
            isActive: AuthBloc.checkFavorite(productId: product.sku.toString()),
            padding: const EdgeInsets.all(AppSize.s14),
            iconSize: AppSize.s14,
            onPressed: () {
              context.read<ProductsBloc>().add(
                    ProductsEvent.switchProductFavorite(
                      product,
                    ),
                  );
            },
          ),
        ],
      ),
      // 3 Product Details
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: Text(
                      product.manufacturer,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  WidgetManager.ratingStars(
                    context: context,
                    rating: product.customerReviewAverage,
                    ratingCount: product.customerReviewCount,
                  ),
                ],
              ),
            ),
            Text("\$${product.regularPrice}",
                style: Theme.of(context).textTheme.displayMedium),
          ],
        ),
      ),
      // 4 Product Description
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p12,
        ),
        child: ExpandableText(
          product.longDescription,
          expandText: AppStrings.readMore,
          collapseText: AppStrings.readLess,
          maxLines: 6,
        ),
      ),
      // 5 Add to Cart Button
      WidgetManager.customElevatedButton(
        context: context,
        width: double.infinity,
        height: AppSize.s48,
        margin: const EdgeInsets.all(AppMargin.m16),
        onPressed: () {
          context.read<ProductsBloc>().add(
                ProductsEvent.switchProductCart(
                  product,
                ),
              );
        },
        child: Text(
          AppStrings.addToCart.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorManager.white,
              ),
        ),
      ),
      // 6 Similar Products
      WidgetManager.productsSlider(
        context: context,
        title: "",
        description: "You Can Also Like This",
        items: products,
      ),
    ],
  );
}

Widget productViewShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Theme.of(context).inputDecorationTheme.fillColor!,
    highlightColor: Theme.of(context).disabledColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppSize.s340,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: Theme.of(context).canvasColor,
          ),
        ),
        Container(
          height: AppSize.s30,
          width: AppSize.s260,
          margin: const EdgeInsets.only(top: AppMargin.m16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: Theme.of(context).canvasColor,
          ),
        ),
        Container(
          height: AppSize.s30,
          width: AppSize.s260,
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: Theme.of(context).canvasColor,
          ),
        ),
        Container(
          height: AppSize.s30,
          width: AppSize.s100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: Theme.of(context).canvasColor,
          ),
        ),
      ],
    ),
  );
}
