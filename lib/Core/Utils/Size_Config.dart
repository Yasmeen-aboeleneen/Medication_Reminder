import 'dart:core';

import 'package:flutter/material.dart';

class SizeConfig {
  static double? ScreenWidth;
  static double? ScreenHeight;
  static double? DefaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    DefaultSize = orientation == Orientation.landscape
        ? ScreenHeight! * .024
        : ScreenWidth! * .024;

    print('this is the default Size $DefaultSize');
  }
}