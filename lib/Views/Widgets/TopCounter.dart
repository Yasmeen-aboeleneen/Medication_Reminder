import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Core/Constants/Constants.dart';

class TopCounter extends StatelessWidget {
  const TopCounter({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Medicine',
              style: TextStyle(
                  fontSize: w * .07,
                  fontWeight: FontWeight.w500,
                  color: kColor),
            ),
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Center(
          child: Text(
            '0',
            style: TextStyle(
                fontSize: w * .1, fontWeight: FontWeight.bold, color: kColor),
          ),
        )
      ],
    );
  }
}
