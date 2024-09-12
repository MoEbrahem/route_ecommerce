import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_ecommerce/domain/usecases/registerUseCase.dart';
import 'package:route_ecommerce/features/authpresentationscreen/register/cubit/register_states.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  bool showPassword = false;
  var nameController = TextEditingController(text:"Mohamed");
  var emailController = TextEditingController(text:"Mohamed47200@gmail.com");
  var passwordController = TextEditingController(text:"Mohamed@123");
  var rePasswordController = TextEditingController(text:"Mohamed@123");
  var phoneController = TextEditingController(text:"01210335687");
  void register(GlobalKey<FormState> formkey) async {
    if(formkey.currentState!.validate() == true){
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold(
      (l) {
        emit(RegisterErrorState(failures: l));
      },
      (respone) {
        emit(
          RegisterSuccessState(responseEntity: respone),
        );
      }
      );
    }
  }

  onChangePasswordState() {
    if (showPassword == false) {
      showPassword = true;
    } else {
      showPassword = false;
    }
    emit(ChangePasswordState(isPasswordShowed: showPassword));
  }


}
