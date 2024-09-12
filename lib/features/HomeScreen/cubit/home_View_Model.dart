import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/core/resources/asset_manager.dart';
import 'package:route_ecommerce/features/HomeScreen/cubit/home_states.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());

  static get(context) => BlocProvider.of<HomeViewModel>(context);

  static List<Image> imagesList = [
    Image.asset(
      ImageAssets.announce1,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ),
    Image.asset(
      ImageAssets.announce2,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ),
    Image.asset(
      ImageAssets.announce3,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ),
  ];
}
