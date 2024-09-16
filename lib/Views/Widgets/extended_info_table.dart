import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:sizer/sizer.dart';

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
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ),
          Text(
            fieldinfo,
            style: TextStyle(
                color: kRed,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
