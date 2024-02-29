import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Core/Constants/Constants.dart';

class MainInfoTable extends StatelessWidget {
  const MainInfoTable(
      {super.key, required this.fieldTitle, required this.fieldInfo});
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          fieldTitle,
          style: TextStyle(
              color: kCcolor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 1),
        ),
        Text(
          fieldInfo,
          style: TextStyle(
              color: kMainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ],
    );
  }
}
