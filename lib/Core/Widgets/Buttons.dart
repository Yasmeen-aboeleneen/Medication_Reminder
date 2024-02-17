import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Constants/Constants.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.w, left: 18.w),
      child: SizedBox(
        height: 7.h,
        child: TextButton(
          onPressed: () {},
          child: Center(
            child: Text(
              'Confirm',
              style: TextStyle(
                  color: kSColor, fontSize: 13.sp, fontWeight: FontWeight.w600),
            ),
          ),
          style: TextButton.styleFrom(
              backgroundColor: kMainColor, shape: const StadiumBorder()),
        ),
      ),
    );
  }
}
