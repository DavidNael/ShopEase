import 'package:equatable/equatable.dart';

class HomePageStates extends Equatable {
  const HomePageStates();

  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageStates {}

class HomePageLoadingState extends HomePageStates {}

class HomePageLoadedState extends HomePageStates {}

class HomePageErrorState extends HomePageStates {
  final String message;
  const HomePageErrorState(this.message);
}
