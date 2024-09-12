// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_ecommerce/core/resources/ColorManager.dart';
import 'package:route_ecommerce/core/resources/asset_manager.dart';
import 'package:route_ecommerce/core/resources/dialogueUtils.dart';
import 'package:route_ecommerce/core/resources/styles_manager.dart';
import 'package:route_ecommerce/core/routes_manager/routes.dart';
import 'package:route_ecommerce/core/widget/custom_elevated_button.dart';
import 'package:route_ecommerce/core/widget/main_text_field.dart';
import 'package:route_ecommerce/core/widget/validators.dart';
import 'package:route_ecommerce/data/sharedPreferences/sharedPreference.dart';
import 'package:route_ecommerce/domain/di/di.dart';
import 'package:route_ecommerce/features/authpresentationscreen/login/cubit/login_state.dart';
import 'package:route_ecommerce/features/authpresentationscreen/login/cubit/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginViewModel viewModel = getIt.get<LoginViewModel>();
  var formkey = GlobalKey<FormState>();
  bool? showPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocConsumer<LoginViewModel, LoginStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoadingDialog(context, "Loading...");
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: state.failures.errMessage,
            );
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: "Login Sucessfully",
              postActionNamed: 'ok',
              posaction: () {
                SharedPreferenceUtils.saveData(
                  "token",
                  state.loginEntity.token,
                );
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.homeScreenRoutes,
                  (route) => false,
                );
                
              },
            );
          } else if (state is ChangePasswordLoginState) {
            showPassword = state.isPasswordShowed;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 235,
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 67,
                      ),
                      child: SvgPicture.asset(
                        ImageAssets.routeLogo,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Welcome Back To Route",
                          style: getSemiBoldStyle(
                              color: ColorManager.white, fontSize: 23),
                        ),
                        Text(
                          "Please sign in with your mail",
                          style: getLightStyle(
                              color: ColorManager.white, fontSize: 15),
                        )
                      ],
                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          BuildTextField(
                            controller: viewModel.emailController,
                            hintText: "enter your email address.",
                            keyboardType: TextInputType.emailAddress,
                            label: "E-mail address",
                            validator: (val) =>
                                AppValidator.validateEmail(val),
                          ),
                          BuildTextField(
                            controller: viewModel.passwordController,
                            hintText: "enter your password .",
                            keyboardType: TextInputType.text,
                            obscureText: showPassword ?? false,
                            label: "Password",
                            validator: (val) =>
                                AppValidator.validatePassword(val),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  viewModel.onChangePasswordState();
                                },
                                icon: showPassword == true
                                    ? const Icon(
                                        Icons.visibility,
                                        color: ColorManager.greyIcon,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: ColorManager.greyIcon,
                                      )),
                          ),
                          CustomElevatedButton(
                            backgroundColor: ColorManager.white,
                            textStyle: getSemiBoldStyle(
                              color: ColorManager.primary,
                              fontSize: 20,
                            ),
                            lable: "Login",
                            onTap: () {
                              viewModel.login(formkey);
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            children: [
                              Text(
                                "Don't Have an Account?",
                                style: getRegularStyle(
                                    fontSize: 14, color: ColorManager.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    Routes.registerRoutes,
                                  );
                                },
                                child: Text(
                                  "Create Account",
                                  style: getBoldStyle(
                                    fontSize: 14,
                                    color: ColorManager.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
