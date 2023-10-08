import 'package:flutter_bloc/flutter_bloc.dart';
import 'homepage_events.dart';
import 'homepage_states.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  int currentPage = 0;
  HomePageBloc() : super(HomePageInitialState()) {
    on<HomePageChangeNavigationBarEvent>((event, emit) {
      emit(HomePageLoadingState());
      currentPage = event.index;
      emit(HomePageLoadedState());
    });
  }
}
