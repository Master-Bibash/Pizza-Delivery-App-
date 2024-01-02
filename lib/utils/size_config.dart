import 'package:flutter/material.dart';

class Sizeconfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? blocSizeHorizontal;
  static double? screenHeight;
  static double? blockSizeVertical;
  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlocVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blocSizeHorizontal = (screenWidth! / 100);
    blockSizeVertical = screenHeight! / 100;
    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlocVertical = (screenHeight! - _safeAreaVertical!) / 100;
    _safeAreaHorizontal = (screenWidth! - _safeAreaHorizontal!);
    // _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlocVertical = (screenHeight! - _safeAreaVertical!) / 100;
  }
}

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}
double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

double setWidth(num value,BuildContext context) {
  return displaySize(context).width*(value/475);
}
double setHeight(num value,BuildContext context) {
  return displaySize(context).height*(value/812);
}
