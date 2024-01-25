import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Widgets/PanelTitle.dart';
import 'package:sizer/sizer.dart';

class NewEntryScreenBody extends StatelessWidget {
  const NewEntryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 9.h,
        elevation: 0,
        title: Center(
            child: Text(
          'Add New Medicine',
          style: TextStyle(
              color: KMainColor, fontWeight: FontWeight.w500, fontSize: 20.sp),
        )),
        iconTheme: IconThemeData(
          color: KMainColor,
          size: 23.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const PanelTitle(
              title: 'Medicine Name',
              isRequired: true,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: KMainColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
