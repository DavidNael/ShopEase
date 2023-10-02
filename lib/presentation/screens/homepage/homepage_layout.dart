import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopease/presentation/resources/assets_manager.dart';
import 'package:shopease/presentation/resources/strings_manager.dart';
import 'package:shopease/presentation/resources/theme_manager.dart';
import 'package:shopease/presentation/resources/values_manager.dart';
import 'package:shopease/presentation/screens/homepage/bloc/homepage_events.dart';
import 'package:shopease/presentation/screens/homepage/bloc/homepage_states.dart';
import 'package:shopease/presentation/screens/homepage/views/bag_view.dart';
import 'package:shopease/presentation/screens/homepage/views/favorites.dart';
import 'package:shopease/presentation/screens/homepage/views/home_view.dart';
import 'package:shopease/presentation/screens/homepage/views/profile.dart';
import 'package:shopease/presentation/screens/homepage/views/shop_view.dart';

import '../../../app/theme_bloc/theme_bloc.dart';
import '../../../app/theme_bloc/theme_event.dart';
import 'bloc/homepage_bloc.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // CustomThemeExtension customTheme =
    //     Theme.of(context).extension<CustomThemeExtension>()!;
    List<Widget> body = [
      const HomeView(),
      const ShopView(),
      const BagView(),
      const FavoritesView(),
      const ProfileView(),
    ];
    final bloc = BlocProvider.of<HomePageBloc>(context);
    return BlocBuilder<HomePageBloc, HomePageStates>(
      builder: (context, state) {
        return Scaffold(
          body: body[bloc.currentPage],
          floatingActionButton: BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p70),
                child: FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context)
                        .add(const ThemeChangeEvent());
                  },
                  child: Icon(
                    Theme.of(context)
                        .extension<CustomThemeExtension>()!
                        .themeIcon,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              bloc.add(HomePageChangeNavigationBarEvent(index: value));
            },
            currentIndex: bloc.currentPage,
            items: [
              bottomNavigationBarItem(
                inactiveIcon: ImageAssets.homeInactiveIcon,
                activeIcon: Theme.of(context)
                    .extension<CustomThemeExtension>()!
                    .homeIconActive,
                label: AppStrings.home,
              ),
              bottomNavigationBarItem(
                inactiveIcon: ImageAssets.shopInactiveIcon,
                activeIcon: Theme.of(context)
                    .extension<CustomThemeExtension>()!
                    .shopIconActive,
                label: AppStrings.shop,
              ),
              bottomNavigationBarItem(
                inactiveIcon: ImageAssets.bagInactiveIcon,
                activeIcon: Theme.of(context)
                    .extension<CustomThemeExtension>()!
                    .bagIconActive,
                label: AppStrings.bag,
              ),
              bottomNavigationBarItem(
                inactiveIcon: ImageAssets.heartInactiveIcon,
                activeIcon: Theme.of(context)
                    .extension<CustomThemeExtension>()!
                    .heartIconActive,
                label: AppStrings.favorites,
              ),
              bottomNavigationBarItem(
                inactiveIcon: ImageAssets.profileInactiveIcon,
                activeIcon: Theme.of(context)
                    .extension<CustomThemeExtension>()!
                    .profileIconActive,
                label: AppStrings.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem bottomNavigationBarItem(
    {required String inactiveIcon,
    required String activeIcon,
    required String label}) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p8),
      child: SvgPicture.asset(
        inactiveIcon,
      ),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p8),
      child: SvgPicture.asset(
        activeIcon,
      ),
    ),
    label: label,
  );
}
