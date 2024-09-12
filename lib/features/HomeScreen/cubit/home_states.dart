import 'package:route_ecommerce/domain/failure.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeErrorState extends HomeStates {
  Failures failures;
  HomeErrorState({required this.failures});
}

class HomeSuccessState extends HomeStates {
}
