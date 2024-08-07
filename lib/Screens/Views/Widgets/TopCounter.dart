import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Core/Constants/Constants.dart';

class TopCounter extends StatelessWidget {
  const TopCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Live Healthier!',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: kColor),
            ),
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        const Center(
          child: Text(
            '0',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: kColor),
          ),
        )
      ],
    );
  }
}
