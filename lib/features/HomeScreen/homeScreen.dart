// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/ColorManager.dart';
import 'package:route_ecommerce/core/resources/asset_manager.dart';
import 'package:route_ecommerce/core/resources/styles_manager.dart';
import 'package:route_ecommerce/core/widget/HomeScreen/announcement_homeScreen.dart';
import 'package:route_ecommerce/core/widget/HomeScreen/customSearchBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(
                onPressSearch: () {},
                pressOnShoppingCart: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              const AnnouncementHomescreen(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "view all",
                    style: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Container(
                height: 280,
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: GridView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,childAspectRatio: 9/6, mainAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(180),
                          ), 

                          child: Image.asset(ImageAssets.iconSearch,height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
                        ),
                        Text("Category ${index+1}")
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
