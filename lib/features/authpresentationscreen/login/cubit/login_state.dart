import 'package:route_ecommerce/domain/entities/loginResponseEntity.dart';
import 'package:route_ecommerce/domain/failure.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class ChangePasswordLoginState extends LoginStates {
  bool isPasswordShowed;
  ChangePasswordLoginState({required this.isPasswordShowed});
}

class LoginErrorState extends LoginStates {
  Failures failures;
  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginEntity;
  LoginSuccessState({required this.loginEntity});
  
}
