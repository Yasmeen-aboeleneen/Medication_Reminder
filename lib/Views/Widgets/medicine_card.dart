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
    print('Medicine Type: ${medicine.medicineType}'); 
    if (medicine.medicineType == 'pills') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          'Assets/Icons/pills.png',
          height: 8.h,
        ),
      );
    } else if (medicine.medicineType == 'syrup') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          'Assets/Icons/syrup.png',
          height: 8.h,
        ),
      );
    } else if (medicine.medicineType == 'syringe') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          'Assets/Icons/syringe.png',
          height: 8.h,
        ),
      );
    } else if (medicine.medicineType == 'nasal') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          'Assets/Icons/nasal-spray (1).png',
          height: 8.h,
        ),
      );
    } else if (medicine.medicineType == 'eyeDrops') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          'Assets/Icons/eye-drops.png',
          height: 8.h,
        ),
      );
    } else if (medicine.medicineType == 'earDrops') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          'Assets/Icons/ear-drops.png',
          height: 8.h,
        ),
      );
    }
    return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: const Icon(
          Icons.error,
          color: kRed,
          size: 35,
        ));
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
            tag: medicine.medicineName!,
            child: Text(
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              medicine.medicineName!,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          SizedBox(height: .2.h),
          Text(
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            "Every ${medicine.interval} hour",
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
