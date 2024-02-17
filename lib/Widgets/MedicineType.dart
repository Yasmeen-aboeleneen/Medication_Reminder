import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:sizer/sizer.dart';

class MedicineType extends StatelessWidget {
  const MedicineType(
      {super.key,
      required this.name,
      required this.image,
      required this.isSelected});

  final String name;
  final String image;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 20.w,
        height: 12.h,
        decoration: BoxDecoration(
            color: isSelected ? kCcolor : kSecondaryColor,
            borderRadius: BorderRadius.circular(3.h)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Image.asset(
                  image,
                  height: 6.h,
                ),
              ),
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(
                    color: kMainColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
