import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/ColorManager.dart';
import 'package:route_ecommerce/core/resources/styles_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String lable;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.lable,
    this.backgroundColor,
    this.radius,
    required this.onTap,
    this.textStyle,
    this.isStadiumBorder = true,
  });

  // const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 55),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: isStadiumBorder
              ? const StadiumBorder()
              : RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          backgroundColor: backgroundColor ?? ColorManager.primary,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: Text(
                lable,
                textAlign: TextAlign.center,
                style: textStyle ??
                    getMediumStyle(
                      color: ColorManager.white,
                    ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            suffixIcon ?? const SizedBox(),
      
          ],
        ),
      ),
    );
  }
}
