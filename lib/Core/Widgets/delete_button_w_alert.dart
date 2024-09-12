import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Utils/Classes/global_bloc.dart';
import 'package:medication_reminder/Views/Home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:medication_reminder/Models/medicine.dart';

class DeleteButton extends StatelessWidget {
  final Medicine medicine;

  const DeleteButton({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Container(
        height: 7.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(colors: [kPrimary, kLightPurple]),
        ),
        child: TextButton(
          onPressed: () {
            openAlertBox(context);
          },
          style: TextButton.styleFrom(shape: const StadiumBorder()),
          child: Center(
            child: Text(
              'Delete',
              style: TextStyle(
                color: kBlack,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void openAlertBox(BuildContext context) {
    final globalBloc = Provider.of<GlobalBloc>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kveryWhite,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 2.h),
          title: Text(
            "Delete This Reminder?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: kRed, fontSize: 16.sp),
              ),
            ),
            TextButton(
              onPressed: () {
                globalBloc.removeMedicine(medicine);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              child: Text(
                'Ok',
                style: TextStyle(color: kBlack, fontSize: 16.sp),
              ),
            ),
          ],
        );
      },
    );
  }
}
