import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:sizer/sizer.dart';

import '../Common/ConvertTime.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  final TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  final bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 30, right: 30),
        child: TextButton(
          onPressed: () {},
          child: Center(
            child: Text(
              _clicked == false
                  ? 'Select Time'
                  : '${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}',
              style: TextStyle(
                  color: KSColor, fontSize: 13.sp, fontWeight: FontWeight.w600),
            ),
          ),
          style: TextButton.styleFrom(
              backgroundColor: KMainColor, shape: const StadiumBorder()),
        ),
      ),
    );
  }
}
