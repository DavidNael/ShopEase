import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopease/domain/models/products_model.dart';
import 'package:shopease/presentation/resources/theme_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';

import '../../domain/models/category_model.dart';
import '../screens/products/product_view.dart';
import 'assets_manager.dart';
import 'color_manager.dart';

abstract class WidgetManager {
  static Widget outlinedElevatedButton({
    required BuildContext context,
    required Widget child,
    VoidCallback? onPressed,
    Color borderColor = ColorManager.lightPrimary,
    Color backgroundColor = ColorManager.lightWhite,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    double borderWidth = AppSize.s1,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
                borderRadius: borderRadius ??=
                    BorderRadius.circular(AppSize.s25),
              ),
            ),
            padding: MaterialStateProperty.all(padding ??= EdgeInsets.zero),
          ),
      child: child,
    );
  }

  static Widget textFormField({
    EdgeInsetsGeometry? padding = const EdgeInsets.all(AppSize.s10),
    EdgeInsetsGeometry? margin,
    double? height = AppSize.s70,
    double? width,
    BorderRadiusGeometry? borderRadius,
    Color? color,
    String? hintText,
    String? labelText,
    String? helperText,
    String? errorText,
    TextEditingController? controller,
    bool obscureText = false,
    bool readOnly = false,
    bool enabled = true,
    InputBorder border = InputBorder.none,
    InputBorder enabledBorder = InputBorder.none,
    InputBorder focusedBorder = InputBorder.none,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ??= BorderRadius.circular(AppSize.s4),
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlack.withOpacity(0.1),
              blurRadius: AppSize.s10,
              offset: const Offset(0, AppSize.s5),
            ),
          ]),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          errorText: errorText,
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
        ),
      ),
    );
  }

  static Widget hoveringIconWidget({
    required BuildContext context,
    required bool isActive,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? overlayColor,
    String? activeIcon,
    String? inactiveIcon,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? iconPadding,
    double? elevation,
    double? iconSize,
  }) {
    return customElevatedButton(
      context: context,
      onPressed: onPressed,
      backgroundColor:
          backgroundColor ?? Theme.of(context).inputDecorationTheme.fillColor,
      overlayColor: overlayColor ?? Theme.of(context).primaryColor,
      shape: const CircleBorder(),
      padding: padding ?? const EdgeInsets.all(AppPadding.p10),
      elevation: elevation ?? AppSize.s6,
      child: Padding(
        padding: iconPadding ?? EdgeInsets.zero,
        child: SvgPicture.asset(
          isActive
              ? activeIcon ?? ImageAssets.heartInactiveIcon
              : inactiveIcon ?? ImageAssets.heartActiveDarkIcon,
          height: iconSize,
        ),
      ),
    );
  }

  static Widget discountPrice({
    required BuildContext context,
    required double discountPercentage,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s10,
        vertical: AppSize.s5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        border: Border.all(
          width: AppSize.s0_5,
          color: ColorManager.black.withOpacity(AppSize.s0_5),
        ),
        color: Theme.of(context).extension<CustomThemeExtension>()!.salesColor,
      ),
      child: Text(
        '-$discountPercentage%',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorManager.white,
            ),
      ),
    );
  }

  static Widget ratingStars({
    required BuildContext context,
    required double rating,
    required int ratingCount,
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
              width: AppSize.s16,
              height: AppSize.s16,
            ),
          ),
        Text(
          '$rating ($ratingCount)',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  static Widget customElevatedButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? overlayColor,
    double? width,
    double? height,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    OutlinedBorder? shape,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: MaterialStatePropertyAll(backgroundColor),
              overlayColor: MaterialStatePropertyAll(overlayColor),
              elevation: MaterialStatePropertyAll(elevation),
              shape: MaterialStatePropertyAll(shape),
              padding: MaterialStatePropertyAll(padding),
            ),
        child: child,
      ),
    );
  }

  static Widget productSliderItem({
    required BuildContext context,
    required ProductModel product,
    required bool isFavorite,
    bool isNetwork = true,
    required VoidCallback onPressedFavorite,
  }) {
    return customElevatedButton(
      context: context,
      backgroundColor: ColorManager.transparent,
      elevation: 0,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(right: AppSize.s20),
      width: AppSize.s200,
      onPressed: () {
        if (kDebugMode) {
          print("Going to product page");
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // context
              //     .read<ProductsBloc>()
              //     .add(ProductsEvent.getProducts([ProductsRequest()]));
              return ProductView(item: product);
            },
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  height: AppSize.s200,
                  width: AppSize.s200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: CachedNetworkImage(
                        imageUrl: product.images.isNotEmpty
                            ? product.images[0].href
                            : "https://placehold.co/600x400/png",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return Padding(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            child: Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          );
                        },
                        height: product.images.isNotEmpty
                            ? double.parse(product.images[0].height)
                            : null,
                        width: product.images.isNotEmpty
                            ? double.parse(product.images[0].width)
                            : null,
                        errorWidget: (context, url, error) {
                          return Text(error.toString());
                        },
                        // fit: BoxFit.cover,
                      )),
                ),
                product.discountPercentage == 0
                    ? Container()
                    : Positioned(
                        top: AppSize.s10,
                        left: AppSize.s10,
                        child: discountPrice(
                          context: context,
                          discountPercentage: product.discountPercentage,
                        ),
                      ),
                Positioned(
                  bottom: AppSize.s0,
                  right: AppSize.s0,
                  child: hoveringIconWidget(
                    context: context,
                    isActive: isFavorite,
                    onPressed: onPressedFavorite,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s10),
          Expanded(
            flex: 1,
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Expanded(
            flex: 1,
            child: ratingStars(
              context: context,
              rating: product.customerReviewAverage,
              ratingCount: product.customerReviewCount,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text('\$${product.regularPrice}',
                    style: product.discountPercentage == 0
                        ? Theme.of(context).textTheme.displaySmall
                        : Theme.of(context).textTheme.labelSmall),
                const SizedBox(width: AppSize.s10),
                product.discountPercentage == 0
                    ? Container()
                    : Text(
                        '\$${product.salePrice}',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Theme.of(context)
                                      .extension<CustomThemeExtension>()!
                                      .salesColor,
                                ),
                      ),
                const SizedBox(width: AppSize.s10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget productInList({
    required BuildContext context,
    required ProductModel product,
  }) {
    return Stack(
      children: [
        Container(
          height: AppSize.s130,
          padding: const EdgeInsets.only(bottom: AppSize.s20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductView(item: product);
                  },
                ),
              );
            },
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(0),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                  ),
                  elevation: const MaterialStatePropertyAll(AppSize.s0),
                ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    child: CachedNetworkImage(
                      imageUrl: product.images.isNotEmpty
                          ? product.images[0].href
                          : "https://placehold.co/600x400/png",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return Padding(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                        );
                      },
                      height: product.images.isNotEmpty
                          ? double.parse(product.images[0].height)
                          : null,
                      width: product.images.isNotEmpty
                          ? double.parse(product.images[0].width)
                          : null,
                      errorWidget: (context, url, error) {
                        return Text(error.toString());
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          product.manufacturer,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppPadding.p4,
                            bottom: AppPadding.p8,
                          ),
                          child: ratingStars(
                            context: context,
                            rating: product.customerReviewAverage,
                            ratingCount: product.customerReviewCount,
                          ),
                        ),
                        Text(
                          "${product.regularPrice}\$",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// heart button
        Positioned(
          right: -10,
          bottom: AppSize.s0,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: hoveringIconWidget(
              context: context,
              isActive: product.isNew,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  static Widget subCategoryList({
    required BuildContext context,
    required List<CategoryModel> categories,
  }) {
    return SizedBox(
      height: AppSize.s40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
            child: customElevatedButton(
              onPressed: () {},
              backgroundColor: Theme.of(context)
                  .extension<CustomThemeExtension>()!
                  .complementaryColor,
              context: context,
              child: Text(categories[index].name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).inputDecorationTheme.fillColor)),
            ),
          );
        },
      ),
    );
  }

  static Widget productsList({
    required List<ProductModel> products,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return productInList(
            context: context,
            product: products[index],
          );
        },
      ),
    );
  }

  static Widget productsSlider({
    required BuildContext context,
    required String title,
    required String description,
    required List<ProductModel> items,
  }) {
    return Container(
      height: AppSize.s380,
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
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return productSliderItem(
                  context: context,
                  product: items[index],
                  isFavorite: items[index].isNew,
                  onPressedFavorite: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget dropdownButton<T>({
    required BuildContext context,
    required List<DropdownMenuItem<T>> items,
    required void Function(T?) onChanged,
    T? value,
    Color? buttonColor,
    String? hint,
    double? iconSize,
    IconData? icon,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
  }) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            // vertical: AppPadding.p2,
          ),
      margin: margin,
      decoration: ShapeDecoration(
        color: buttonColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          side: side ??
              BorderSide(
                  width: AppSize.s0_4,
                  color: Theme.of(context).colorScheme.error),
          borderRadius: borderRadius ?? BorderRadius.circular(AppSize.s8),
        ),
      ),
      child: DropdownButton<T>(
        hint: Text(hint ?? "Placeholder"),
        value: value,
        items: items,
        onChanged: onChanged,
        icon: Icon(
          icon ?? Icons.keyboard_arrow_down_rounded,
        ),
        isExpanded: true,
        iconSize: iconSize ?? 16,
        underline: const SizedBox(),
      ),
    );
  }

  static void showLoadingDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: AppSize.s20),
            Text(message),
          ],
        ),
      ),
    );
  }

  static void showMessageDialog({
    required BuildContext context,
    required String title,
    required String message,
    bool okButton = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(title),
        content: Text(message),
        actions: [
          if (okButton)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
        ],
      ),
    );
  }

  static Widget gridProductShimmer({
    required BuildContext context,
  }) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).inputDecorationTheme.fillColor!,
      highlightColor: Theme.of(context).disabledColor,
      child: Container(
        margin: const EdgeInsets.only(right: AppSize.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: AppSize.s200,
              width: AppSize.s200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              width: AppSize.s60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              width: AppSize.s100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              width: AppSize.s100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Container(
              height: AppSize.s24,
              width: AppSize.s160,
              margin: const EdgeInsets.only(bottom: AppMargin.m10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              height: AppSize.s24,
              width: AppSize.s100,
              margin: const EdgeInsets.only(bottom: AppMargin.m10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8),
                color: Theme.of(context).canvasColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget categorySliderShimmer(
      {required BuildContext context, int? itemCount}) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).inputDecorationTheme.fillColor!,
      highlightColor: Theme.of(context).disabledColor,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        height: AppSize.s320,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount ?? Random().nextInt(10) + 5,
          itemBuilder: (context, index) {
            return gridProductShimmer(context: context);
          },
        ),
      ),
    );
  }
}
