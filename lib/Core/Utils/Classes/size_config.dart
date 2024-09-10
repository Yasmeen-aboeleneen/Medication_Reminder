// ignore_for_file: avoid_print

import 'dart:core';

import 'package:flutter/material.dart';

class SizeConfig {
  // ignore: non_constant_identifier_names
  static double? ScreenWidth;
  // ignore: non_constant_identifier_names
  static double? ScreenHeight;
  // ignore: non_constant_identifier_names
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
