import 'package:flutter/material.dart';
import 'package:medication_reminder/Widgets/MainInfoTable.dart';
import 'package:sizer/sizer.dart';

class MainSectionInfo extends StatelessWidget {
  const MainSectionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'Assets/Icons/pills.png',
          height: 9.h,
        ),
        SizedBox(
          width: 4.w,
        ),
        Column(
          children: [
            const MainInfoTable(
              fieldTitle: 'Medicine name',
              fieldInfo: 'Panadol',
            ),
            SizedBox(
              height: 1.h,
            ),
            const MainInfoTable(fieldTitle: "Dosage", fieldInfo: "500 mg"),
          ],
        )
      ],
    );
  }
}
