import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/domain/models/carousel_model.dart';
import 'package:shopease/presentation/resources/color_manager.dart';
import 'package:shopease/presentation/resources/font_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/style_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';

import '../../../resources/widgets_manager.dart';
import '../../error_screen/error_screen.dart';
import '../../products/products_bloc/products_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CarouselModel> carouselItems = [
      CarouselModel(
        image:
            'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        title: AppStrings.fashionSale,
      ),
      CarouselModel(
        image:
            "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        title: AppStrings.newArrivals,
      ),
    ];

    // context.read<ProductsBloc>().add(
    //       ProductsEvent.getProducts([
    //         ProductsRequest(
    //           sort: "itemUpdateDate.desc",
    //         ),
    //         ProductsRequest(
    //           options: "(onSale=true)",
    //           sort: "itemUpdateDate.desc",
    //         ),
    //       ]),
    //     );
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
                fitBox: true,
                title: carouselItems[index].title,
                padding: EdgeInsets.zero,
              );
            },
            options: CarouselOptions(
              height: AppSize.s300,
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
          FutureBuilder(
            future: context.read<ProductsBloc>().initHomeProducts(),
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
                    return homeView(context: context);
                  } else if (state.hasError) {
                    return error("error occured ${state.error.toString()}}");
                  } else {
                    return error("unknown error occured");
                  }
                default:
                  return loading(context);
              }
            },
          )
        ],
      ),
    );
  }
}

Widget homeView({
  required BuildContext context,
}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m24),
        child: WidgetManager.productsSlider(
          context: context,
          title: "New",
          description: "You've never seen it before",
          items: context.watch<ProductsBloc>().newProducts!.products,
        ),
      ),
      Container(
        child: WidgetManager.productsSlider(
          context: context,
          title: "Sale",
          description: "Super summer sale",
          items: context.watch<ProductsBloc>().onSaleProducts!.products,
        ),
      )
    ],
  );
}

Widget loading(context) {
  return Column(
    children: [
      WidgetManager.categorySliderShimmer(context: context),
      WidgetManager.categorySliderShimmer(context: context),
    ],
  );
}

Widget error(String message) {
  return ErrorScreen(
    message: message,
  );
}

Widget carouselElement({
  required BuildContext context,
  required String image,
  required String title,
  EdgeInsetsGeometry? padding,
  bool fitBox = false,
  bool showButton = true,
  double imageHeight = AppSize.s400,
}) {
  return Container(
    height: imageHeight,
    padding: padding ?? const EdgeInsets.all(AppPadding.p8),
    decoration: BoxDecoration(
      color: ColorManager.transparent,
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    child: Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s8),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: fitBox ? BoxFit.cover : null,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                );
              },
              alignment: Alignment.topCenter,
              height: imageHeight,
              width: double.infinity,
            )),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.black.withOpacity(AppSize.s0_4),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
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
              if (showButton)
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
