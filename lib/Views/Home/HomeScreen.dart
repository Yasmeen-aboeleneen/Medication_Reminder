import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Widgets/custom_app_bar.dart';
import 'package:medication_reminder/Views/Home/homeScreenBody.dart';
 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.height * .35;
    // var h = MediaQuery.of(context).size.height;
    // var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(),
          ),
          Positioned(
            top: appBarHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: const HomeScreenBody(),
          ),
        ],
      ),
    );
  }
}
