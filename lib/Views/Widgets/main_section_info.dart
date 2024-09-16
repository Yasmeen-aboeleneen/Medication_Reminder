import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Models/medicine.dart';
import 'package:medication_reminder/Views/Widgets/main_info_table.dart';
import 'package:sizer/sizer.dart';

class MainSectionInfo extends StatefulWidget {
  const MainSectionInfo({super.key, required this.medicine});
  final Medicine medicine;

  @override
  State<MainSectionInfo> createState() => _MainSectionInfoState();
}

class _MainSectionInfoState extends State<MainSectionInfo> {
  Hero makeIcon(double size) {
    String medicineType = widget.medicine.medicineType ?? 'unknown';

    switch (medicineType) {
      case 'pills':
        return Hero(
          tag: widget.medicine.medicineName + medicineType,
          child: Image.asset(
            'Assets/Icons/pills.png',
            height: 9.h,
          ),
        );
      case 'syrup':
        return Hero(
          tag: widget.medicine.medicineName + medicineType,
          child: Image.asset(
            'Assets/Icons/syrup.png',
            height: 9.h,
          ),
        );
      case 'syringe':
        return Hero(
          tag: widget.medicine.medicineName + medicineType,
          child: Image.asset(
            'Assets/Icons/syringe.png',
            height: 9.h,
          ),
        );
      case 'nasal':
        return Hero(
          tag: widget.medicine.medicineName + medicineType,
          child: Image.asset(
            'Assets/Icons/nasal-spray (1).png',
            height: 9.h,
          ),
        );
      case 'eyeDrops':
        return Hero(
          tag: widget.medicine.medicineName + medicineType,
          child: Image.asset(
            'Assets/Icons/eye-drops.png',
            height: 9.h,
          ),
        );
      case 'earDrops':
        return Hero(
          tag: widget.medicine.medicineName + medicineType,
          child: Image.asset(
            'Assets/Icons/ear-drops.png',
            height: 9.h,
          ),
        );
      default:
        return Hero(
          tag: '${widget.medicine.medicineName}unknown',
          child: const Icon(
            Icons.error,
            color: kRed,
            size: 35,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        makeIcon(8.h),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainInfoTable(
              fieldTitle: 'Medicine name',
              fieldInfo: widget.medicine.medicineName,
            ),
            SizedBox(
              height: 6.h,
            ),
            MainInfoTable(
              fieldTitle: "Dosage",
              fieldInfo: widget.medicine.dosage == 0
                  ? "Not Specified"
                  : "${widget.medicine.dosage} mg",
            ),
          ],
        )
      ],
    );
  }
}
