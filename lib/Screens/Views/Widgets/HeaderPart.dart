import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';

import '../../../../Core/Utils/Size_Config.dart';

class HeaderPart extends StatelessWidget {
  const HeaderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: SizeConfig.ScreenWidth,
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(50),
                bottomStart: Radius.circular(50))),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Pill Reminder',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor),
                    ),
                  ),
                ],
              ),
            ]));
  }
}
