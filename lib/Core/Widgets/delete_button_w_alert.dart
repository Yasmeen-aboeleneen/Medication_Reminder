import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:sizer/sizer.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.w, left: 18.w),
      child: Container(
        height: 7.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(colors: [kPrimary, kLightPurple])),
        child: TextButton(
          onPressed: () {
            openAlertBox(context);
          },
          style: TextButton.styleFrom(shape: const StadiumBorder()),
          child: Center(
            child: Text(
              'Delete',
              style: TextStyle(
                  color: kBlack, fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  openAlertBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kveryWhite,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            contentPadding: EdgeInsets.only(top: 2.h),
            title: Text(
              "Delete This Reminder?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kBlack, fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: kRed, fontSize: 16.sp),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ok',
                    style: TextStyle(color: kBlack, fontSize: 16.sp),
                  ))
            ],
          );
        });
  }
}
