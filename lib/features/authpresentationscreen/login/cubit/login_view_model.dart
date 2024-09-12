import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce/domain/usecases/loginUseCase.dart';
import 'package:route_ecommerce/features/authpresentationscreen/login/cubit/login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  bool showPassword = false;
  var emailController = TextEditingController(text: "Mohamed47200@gmail.com");
  var passwordController = TextEditingController(text: "Mohamed@123");
  void login(GlobalKey<FormState> formkey) async {
    if (formkey.currentState!.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        emailController,
        passwordController,
      );
      either.fold((l) {
        emit(LoginErrorState(failures: l));
      }, (respone) {
        emit(
          LoginSuccessState(loginEntity: respone),
        );

      });
    }
  }

  onChangePasswordState() {
    if (showPassword == false) {
      showPassword = true;
    } else {
      showPassword = false;
    }
    emit(ChangePasswordLoginState(isPasswordShowed: showPassword));
  }
}
