import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Views/Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _textOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _textOpacity = 1.0;
      });

      Timer(const Duration(seconds: 3), () {
        _navigateToNextScreen();
      });
    });
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kLightPurple, kPrimary],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/Images/pic1.png',
              fit: BoxFit.cover,
              width: w * 0.9,
              height: h * 0.3,
            ),
            SizedBox(height: h * 0.05),
            AnimatedOpacity(
              opacity: _textOpacity,
              duration: const Duration(seconds: 2),
              child: Text(
                'We take care of\n your regular medication',
                textAlign: TextAlign.center,
                style: GoogleFonts.readexPro(
                  color: kBlack,
                  fontSize: w * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            AnimatedOpacity(
              opacity: _textOpacity,
              duration: const Duration(seconds: 2),
              child: Text(
                'Keep yourself safe and\n never forget to take your\n meds, supplements, and vitamins',
                textAlign: TextAlign.center,
                style: GoogleFonts.recursive(
                  color: kBlack,
                  fontSize: w * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
