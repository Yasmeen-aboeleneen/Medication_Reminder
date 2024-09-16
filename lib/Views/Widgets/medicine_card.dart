import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Models/medicine.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    super.key,
    required this.medicine,
  });

  final Medicine medicine;

  Hero makeIcon(double size) {
    // Define a map for medicine types and their corresponding icons
    final Map<String, String> iconPaths = {
      'pills': 'Assets/Icons/pills.png',
      'syrup': 'Assets/Icons/syrup.png',
      'syringe': 'Assets/Icons/syringe.png',
      'nasal': 'Assets/Icons/nasal-spray (1).png',
      'eyeDrops': 'Assets/Icons/eye-drops.png',
      'earDrops': 'Assets/Icons/ear-drops.png',
    };

    // Get the icon path from the map or use a default icon if not found
    String iconPath =
        iconPaths[medicine.medicineType] ?? 'Assets/Icons/error.png';

    return Hero(
      tag: medicine.medicineName + (medicine.medicineType ?? 'unknown'),
      child: Image.asset(
        iconPath,
        height: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.5.h),
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kGrey, kveryWhite],
        ),
        borderRadius: BorderRadius.circular(2.h),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: makeIcon(8.h)),
          SizedBox(height: 1.h),
          Hero(
            tag: medicine.medicineName,
            child: Text(
              medicine.medicineName,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          SizedBox(height: .2.h),
          Text(
            "Every ${medicine.interval} hour",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
