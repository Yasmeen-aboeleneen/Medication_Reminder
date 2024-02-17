import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: Text(
        'You are in a good health🥰 ',
        style: TextStyle(
          fontSize: 25,
          color: kMainColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
