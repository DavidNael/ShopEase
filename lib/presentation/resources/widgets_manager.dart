import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopease/presentation/resources/theme_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';

import '../../data/models/category_model.dart';
import '../../data/models/shopping_item_model.dart';
import 'assets_manager.dart';
import 'color_manager.dart';

abstract class WidgetsManager {
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
    Color? overlayColor,
    String? activeIcon,
    String? inactiveIcon,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).inputDecorationTheme.fillColor,
            ),
            overlayColor: MaterialStateProperty.all(
              overlayColor ?? Theme.of(context).primaryColor,
            ),
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(
              EdgeInsets.zero,
            ),
            elevation: MaterialStateProperty.all(AppSize.s6),
          ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppPadding.p10),
        child: SvgPicture.asset(
          isActive
              ? activeIcon ?? ImageAssets.heartInactiveIcon
              : inactiveIcon ?? ImageAssets.heartActiveDarkIcon,
        ),
      ),
    );
  }

  static Widget discountPrice({
    required BuildContext context,
    required double price,
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
        '-$price%',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorManager.white,
            ),
      ),
    );
  }

  static Widget ratingStars({
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
              width: AppSize.s16,
              height: AppSize.s16,
            ),
          ),
        Text(
          '($rating)',
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
    Color? splashColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    OutlinedBorder? shape,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: backgroundColor == null
                ? null
                : MaterialStatePropertyAll(backgroundColor),
            overlayColor: splashColor == null
                ? Theme.of(context).elevatedButtonTheme.style!.overlayColor
                : MaterialStatePropertyAll(splashColor),
            elevation:
                elevation == null ? null : MaterialStatePropertyAll(elevation),
            shape: shape == null
                ? Theme.of(context).elevatedButtonTheme.style!.shape
                : MaterialStatePropertyAll(shape),
          ),
      child: child,
    );
  }

  static Widget categoryItem({
    required BuildContext context,
    required ShoppingItemModel item,
    required bool isFavorite,
    required VoidCallback onPressedFavorite,
  }) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print("Going to product page");
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: AppSize.s20),
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
                      borderRadius: BorderRadius.circular(AppSize.s20),
                      image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSize.s10,
                    left: AppSize.s10,
                    child: WidgetsManager.discountPrice(
                      context: context,
                      price: item.discountPercentage,
                    ),
                  ),
                  Positioned(
                    bottom: AppSize.s0,
                    right: AppSize.s0,
                    child: WidgetsManager.hoveringIconWidget(
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
                item.title,
              ),
            ),
            Expanded(
              flex: 1,
              child: WidgetsManager.ratingStars(
                context: context,
                rating: item.rating,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text('\$${item.price}',
                      style: Theme.of(context).textTheme.labelSmall),
                  const SizedBox(width: AppSize.s10),
                  Text(
                    '\$${item.discountPrice}',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
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
      ),
    );
  }

  static Widget productInList({
    required BuildContext context,
    required ShoppingItemModel item,
  }) {
    return Stack(
      children: [
        Container(
          height: AppSize.s120,
          padding: const EdgeInsets.only(bottom: AppSize.s20),
          child: ElevatedButton(
            onPressed: () {},
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
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      fit: BoxFit.cover,
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
                            item.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Text(
                          item.brand,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p8,
                          ),
                          child: WidgetsManager.ratingStars(
                            context: context,
                            rating: item.rating,
                          ),
                        ),
                        Text(
                          "${item.price}\$",
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
            child: WidgetsManager.hoveringIconWidget(
              context: context,
              isActive: item.isFavorite,
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
            child: WidgetsManager.customElevatedButton(
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
    required List<ShoppingItemModel> shoppingItems,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: shoppingItems.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return WidgetsManager.productInList(
            context: context,
            item: shoppingItems[index],
          );
        },
      ),
    );
  }

  static Widget categorySlider({
    required BuildContext context,
    required String title,
    required String description,
    required List<ShoppingItemModel> items,
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
                return WidgetsManager.categoryItem(
                  context: context,
                  item: items[index],
                  isFavorite: items[index].isFavorite,
                  onPressedFavorite: () {},
                );
              },
            ),
          ),
        ],
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
}
