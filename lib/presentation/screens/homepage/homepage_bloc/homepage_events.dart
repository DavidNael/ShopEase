abstract class HomePageEvents {}
class HomePageLoadEvent extends HomePageEvents {}
class HomePageRefreshEvent extends HomePageEvents {}
class HomePageSearchEvent extends HomePageEvents {
  final String query;
  HomePageSearchEvent(this.query);
}
class HomePageChangeNavigationBarEvent extends HomePageEvents {
  final int index;
  HomePageChangeNavigationBarEvent({required this.index});
}