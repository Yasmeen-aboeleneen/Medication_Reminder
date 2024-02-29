import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Widgets/Buttons.dart';
import 'package:medication_reminder/Widgets/ExtendedSection.dart';
import 'package:medication_reminder/Widgets/MainSectionInfo.dart';
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
        padding: EdgeInsets.all(3.h),
        child: Column(
          children: [
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
