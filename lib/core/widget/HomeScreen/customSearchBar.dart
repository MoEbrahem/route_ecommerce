import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/ColorManager.dart';
import 'package:route_ecommerce/core/resources/asset_manager.dart';
import 'package:route_ecommerce/core/resources/styles_manager.dart';

class CustomSearchBar extends StatelessWidget {
  final Function()? onPressSearch;
  final Function()? pressOnShoppingCart;
  const CustomSearchBar({
    super.key,
    required this.onPressSearch,
    required this.pressOnShoppingCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Image.asset(ImageAssets.routeBar),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 24),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.primary,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    InkWell(
                        onTap: onPressSearch,
                        child: Image.asset(ImageAssets.iconSearch)),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "what do you search for?",
                      style: getLightStyle(
                          color: ColorManager.describtionColor, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: pressOnShoppingCart,
              child: Image.asset(ImageAssets.shoppingCart),
            ),
          ],
        ),
      ],
    );
  }
}
