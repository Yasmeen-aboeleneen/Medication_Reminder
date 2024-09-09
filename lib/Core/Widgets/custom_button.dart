// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.colors,  
  });
  final String text;
  final void Function()? onTap;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * .05,
        width: w * .28,
        decoration: BoxDecoration(
           gradient: LinearGradient(colors: colors),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.aBeeZee(
                color: kBlack, fontSize: w * .05, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
