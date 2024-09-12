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
import 'package:route_ecommerce/features/authpresentationscreen/register/cubit/register_states.dart';
import 'package:route_ecommerce/features/authpresentationscreen/register/cubit/register_view_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterViewModel viewModel = getIt.get<RegisterViewModel>();
  var formkey = GlobalKey<FormState>();
  bool? showPassword;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocConsumer<RegisterViewModel, RegisterStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoadingDialog(context, "Loading...");
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: state.failures.errMessage,
            );
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: "Register Sucessfully",
              postActionNamed: 'ok',
              posaction: () {
                SharedPreferenceUtils.saveData(
                  "token",
                  state.responseEntity.token,
                );
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.homeScreenRoutes,
                  (route) => false,
                );
                
              },
            );
          } else if (state is ChangePasswordState) {
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
                      margin: const EdgeInsets.only(top: 45,bottom:30),
                      child: SvgPicture.asset(
                        ImageAssets.routeLogo,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          BuildTextField(
                            controller: viewModel.nameController,
                            hintText: "enter your Full Name",
                            keyboardType: TextInputType.text,
                            label: "Full Name",
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'this field is required .';
                              }
                              return null;
                            },
                          ),
                          BuildTextField(
                            controller: viewModel.phoneController,
                            hintText: "enter your mobile No.",
                            keyboardType: TextInputType.phone,
                            label: "Mobile Number",
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'this field is required .';
                              }
                              return null;
                            },
                          ),
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
                          BuildTextField(
                            controller: viewModel.rePasswordController,
                            hintText: "enter your Confirm password .",
                            keyboardType: TextInputType.text,
                            obscureText: showPassword ?? false,
                            label: "Confirm Password",
                            validator: (val) =>
                                AppValidator.validateConfirmPassword(
                              val,
                              password,
                            ),
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
                            lable: "sign up",
                            onTap: () => viewModel.register(formkey),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text(
                                "Already have account ? ",
                                style: getRegularStyle(
                                    fontSize: 15, color: ColorManager.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    Routes.signInRoutes,
                                  );
                                },
                                child: Text(
                                  "Login ",
                                  style: getBoldStyle(
                                    fontSize: 18,
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
