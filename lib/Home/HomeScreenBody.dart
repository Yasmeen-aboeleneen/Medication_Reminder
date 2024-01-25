import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Screens/NewEntryScreen.dart';
import 'package:medication_reminder/Widgets/BottomContainer.dart';

import 'package:medication_reminder/Widgets/HeaderPart.dart';
import 'package:medication_reminder/Widgets/TopCounter.dart';
import 'package:sizer/sizer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderPart(),
          SizedBox(
            height: 4.h,
          ),
          const TopCounter(),
          SizedBox(height: 9.h),
          const BottomContainer()
        ],
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewEntryScreen()));
        },
        child: SizedBox(
          width: 19.w,
          height: 9.h,
          child: Card(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2.h)),
            color: KPrimaryColor,
            child: Icon(
              Icons.add_outlined,
              size: 50.sp,
              color: KSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
