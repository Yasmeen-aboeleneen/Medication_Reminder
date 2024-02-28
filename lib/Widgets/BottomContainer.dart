import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:sizer/sizer.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Flexible(
    //   child: Text(
    //     'You are in a good health🥰 ',
    //     style: TextStyle(
    //       fontSize: 25,
    //       color: kMainColor,
    //       fontWeight: FontWeight.w500,
    //     ),
    //     textAlign: TextAlign.center,
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              splashColor: Colors.grey,
              highlightColor: Colors.white,
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(2.h),
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(2.h)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'Assets/Icons/pills.png',
                        height: 8.h,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      'Panadol',
                      style: TextStyle(
                          color: kMainColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: .2.h,
                    ),
                    Text(
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      'Every 8 hours',
                      style: TextStyle(
                          color: kColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
