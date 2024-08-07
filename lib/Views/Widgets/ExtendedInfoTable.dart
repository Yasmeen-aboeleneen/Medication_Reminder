import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Core/Constants/Constants.dart';

class ExtendedInfoTable extends StatelessWidget {
  const ExtendedInfoTable(
      {super.key, required this.fieldTitle, required this.fieldinfo});
  final String fieldTitle;
  final String fieldinfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              fieldTitle,
              style: TextStyle(
                  color: kTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ),
          Text(
            fieldinfo,
            style: TextStyle(
                color: kMainColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
