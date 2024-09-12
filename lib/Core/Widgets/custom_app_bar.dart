import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Utils/Classes/global_bloc.dart';
import 'package:medication_reminder/Models/medicine.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Container(
      height: h * .38,
      width: w,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            kPrimary2,
            kPrimary,
            kLightPurple,
          ])),
      child: Stack(
        children: [
          Positioned(
            top: h * .04,
            left: w * .06,
            right: w * .06,
            child: Column(children: [
              SizedBox(
                height: h * .02,
              ),
              Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Medicine Reminder',
                    style: GoogleFonts.aBeeZee(
                        color: kveryWhite,
                        fontSize: w * .075,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: h * .04,
              ),
              Padding(
                padding: EdgeInsets.only(top: h * .04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Saved Medicines',
                    style: GoogleFonts.aBeeZee(
                      fontSize: w * .05,
                      fontWeight: FontWeight.bold,
                      color: kDGrey,
                    ),
                  ),
                ),
              ),
              StreamBuilder<List<Medicine>>(
                stream: globalBloc.medicineList$,
                builder: (context, snapshot) {
                  return Padding(
                    padding: EdgeInsets.only(left: w * .13),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        !snapshot.hasData
                            ? '0'
                            : snapshot.data!.length.toString(),
                        style: GoogleFonts.abel(
                          fontSize: w * .07,
                          fontWeight: FontWeight.w700,
                          color: kveryWhite,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ]),
          ),
          Positioned(
            right: 0,
            bottom: h * .03,
            top: h * .09,
            child: Image.asset(
              'Assets/Images/pic1.png',
              fit: BoxFit.cover,
              width: w * .4,
              height: h * .3,
            ),
          )
        ],
      ),
    );
  }
}
