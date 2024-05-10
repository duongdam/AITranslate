import 'package:flutter/material.dart';

class AppScreenSize {
  late double width;
  late double height;
  late double topPadding;
  late double bottomPadding;
  late double devicePixelRatio;
  late double deviceAspectRatio;
  late double viewInsetsBottom;
  late EdgeInsets viewPadding;
  late EdgeInsets viewInset;

  AppScreenSize.of(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    topPadding = mediaQueryData.padding.top;
    bottomPadding = mediaQueryData.padding.bottom;
    devicePixelRatio = mediaQueryData.devicePixelRatio;
    viewInsetsBottom = mediaQueryData.viewInsets.bottom;
    viewPadding = mediaQueryData.viewPadding;
    deviceAspectRatio = height / width;
    viewInset = mediaQueryData.viewInsets;
  }
}
