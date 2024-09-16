import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:sizer/sizer.dart';

class MainInfoTable extends StatelessWidget {
  const MainInfoTable({
    super.key,
    required this.fieldTitle,
    required this.fieldInfo,
  });

  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overflow: TextOverflow.fade,
          fieldTitle,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          overflow: TextOverflow.fade,
          fieldInfo,
          style: TextStyle(
            color: kRed,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
