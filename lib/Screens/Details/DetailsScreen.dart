import 'package:flutter/material.dart';
import 'package:medication_reminder/Widgets/MainInfoTable.dart';
import 'package:sizer/sizer.dart';

import '../../Core/Constants/Constants.dart';

class MedicineDetailsScreen extends StatefulWidget {
  const MedicineDetailsScreen({super.key});

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 9.h,
        elevation: 0,
        title: Center(
          child: Text(
            'Details',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: kSecondaryColor),
          ),
        ),
        iconTheme: IconThemeData(
          color: kSecondaryColor,
          size: 23.sp,
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'Assets/Icons/pills.png',
                  height: 9.h,
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
                    const MainInfoTable(
                        fieldTitle: "Dosage", fieldInfo: "500 mg"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}