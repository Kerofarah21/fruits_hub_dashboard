import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle styleRegular(
          BuildContext context, Color color, double fontSize) =>
      TextStyle(
        color: color,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize),
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleMedium(
          BuildContext context, Color color, double fontSize) =>
      TextStyle(
        color: color,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize),
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSemiBold(
          BuildContext context, Color color, double fontSize) =>
      TextStyle(
        color: color,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize),
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleBold(
          BuildContext context, Color color, double fontSize) =>
      TextStyle(
        color: color,
        fontSize: getResponsiveFontSize(context, fontSize: fontSize),
        fontWeight: FontWeight.w700,
      );
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  return width / 400;
}
