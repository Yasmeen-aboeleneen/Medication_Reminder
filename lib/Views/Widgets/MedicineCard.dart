import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

 
class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.h),
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(2.h)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'Assets/Icons/pills.png',
              height: 8.h,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            'Panadol',
            style: TextStyle(
              
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          SizedBox(
            height: .2.h,
          ),
          Text(
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            'Every 8 hours',
            style: TextStyle(
               
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
          )
        ],
      ),
    );
  }
}
