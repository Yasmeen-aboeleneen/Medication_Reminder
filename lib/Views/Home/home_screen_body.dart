import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with SingleTickerProviderStateMixin {
  double opacity = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: kveryWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: h * .02),
            child: Text(
              '0',
              style: GoogleFonts.aBeeZee(
                fontSize: w * .18,
                fontWeight: FontWeight.bold,
                color: kBlack,
              ),
            ),
          ),
          SizedBox(height: h * .17),
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(seconds: 2),
            child: Text(
              'No Medicine yet',
              style: GoogleFonts.aBeeZee(
                fontSize: w * .08,
                fontWeight: FontWeight.bold,
                color: kBlack,
              ),
            ),
          ),
          SizedBox(height: h * .06),
        ],
      ),
    );
  }
}
