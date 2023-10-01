import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/presentation/screens/homepage/bloc/homepage_events.dart';
import 'package:shopease/presentation/screens/homepage/bloc/homepage_states.dart';

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
