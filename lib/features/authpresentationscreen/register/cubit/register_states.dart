import 'package:route_ecommerce/domain/entities/registerResponseEntity.dart';
import 'package:route_ecommerce/domain/failure.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class ChangePasswordState extends RegisterStates {
  bool isPasswordShowed;
  ChangePasswordState({required this.isPasswordShowed});
}

class RegisterErrorState extends RegisterStates {
  Failures failures;
  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity responseEntity;
  RegisterSuccessState({required this.responseEntity});
}
