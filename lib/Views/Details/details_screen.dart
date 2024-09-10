import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Widgets/delete_button_w_alert.dart';
import 'package:medication_reminder/Views/Widgets/extended_section.dart';
import 'package:medication_reminder/Views/Widgets/main_section_info.dart';
import 'package:sizer/sizer.dart';

class MedicineDetailsScreen extends StatefulWidget {
  const MedicineDetailsScreen({super.key});

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kveryWhite,
      appBar: AppBar(
        shadowColor: kPurple,
        surfaceTintColor: kveryWhite,
        backgroundColor: kveryWhite,
        toolbarHeight: 9.h,
        elevation: 15,
        title: Center(
          child: Text(
            'Details',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          size: 23.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(3.h),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            const MainSectionInfo(),
            SizedBox(
              height: 4.h,
            ),
            const ExtendedSection(),
            const Spacer(),
            const DeleteButton()
          ],
        ),
      ),
    );
  }
}
