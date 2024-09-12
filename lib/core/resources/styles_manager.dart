import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: FontConstants.fontFamily,
  );
}

TextStyle getLightStyle({
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w300,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

TextStyle getRegularStyle({
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w400,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

TextStyle getMediumStyle({
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w500,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

TextStyle getBoldStyle({
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.bold,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

TextStyle getSemiBoldStyle({
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}
