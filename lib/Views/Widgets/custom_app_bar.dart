import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .38,
      width: w,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kPrimary, kLightPurple])),
      child: Stack(
        children: [
          Positioned(
            top: h * .03,
            child: Padding(
              padding: EdgeInsets.only(top: h * .06, left: w * .03),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h * .02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create\nNew Schedule',
                        style: GoogleFonts.aBeeZee(
                            color: kBlack,
                            fontSize: w * .056,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: h * .02,
                    ),
                    // CustomButton(
                    //   text: 'Add',
                    //   onTap: () {
                    //     Get.to(() => const AddPills());
                    //   },
                    // ),
                  ]),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Image.asset(
              'assets/images/pic2.png',
              fit: BoxFit.cover,
              width: w * .4,
              height: h * .4,
            ),
          )
        ],
      ),
    );
  }
}
