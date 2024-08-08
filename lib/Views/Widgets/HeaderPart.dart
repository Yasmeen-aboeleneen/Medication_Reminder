import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';

class HeaderPart extends StatelessWidget {
  const HeaderPart({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
        height: h * .15,
        width: w,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [kColor, Kblue]),
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(50),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                  alignment: Alignment.topLeft, child: Icon(Icons.settings)),
            ),
            Center(
              child: Text(
                'Meds Control',
                style: TextStyle(
                    fontSize: w * .09,
                    fontWeight: FontWeight.bold,
                    color: kScaffold),
              ),
            ),
          ],
        ));
  }
}
