import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    Key? key,
    this.onTap,
    required this.title,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * .06,
        width: w * .4,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [kColor, Kblue, kScaffold, Kblue, kColor]),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontSize: w * .06,
            fontWeight: FontWeight.bold,
            color: kColor,
          ),
        )),
      ),
    );
  }
}
