import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/ColorManager.dart';
import 'package:route_ecommerce/core/resources/styles_manager.dart';

class BuildTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final String? label;
  final TextInputType? keyboardType;
  final bool? obscureText;
  const BuildTextField({
    super.key,
    this.controller,
    
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.label,
    this.keyboardType,
    this.obscureText,
  });

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 14),
          child: Text(
            widget.label!,
            textAlign: TextAlign.start,
            style: getMediumStyle(fontSize: 16,color: ColorManager.white),
          ),
        ),
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ColorManager.primary),
            color: ColorManager.white,
          ),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText ?? false,
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: getLightStyle(color: ColorManager.black),
              suffixIcon: widget.suffixIcon,
              fillColor: ColorManager.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 17,horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}
