import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Models/medicine.dart';
import 'package:medication_reminder/Views/Widgets/main_info_table.dart';
import 'package:sizer/sizer.dart';

class MainSectionInfo extends StatelessWidget {
  const MainSectionInfo({super.key, required this.medicine});
  final Medicine medicine;
  Hero makeIcon(double size) {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        makeIcon(8.h),
        SizedBox(
          width: 4.w,
        ),
        Column(
          children: [
            Hero(
              tag: medicine.medicineName!,
              child: MainInfoTable(
                fieldTitle: 'Medicine name',
                fieldInfo: medicine.medicineName!,
              ),
            ),
            MainInfoTable(
              fieldTitle: "Dosage",
              fieldInfo: medicine.dosage == 0
                  ? "Not Specified"
                  : "${medicine.dosage} mg",
            ),
          ],
        )
      ],
    );
  }
}
