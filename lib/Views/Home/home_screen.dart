import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Widgets/custom_app_bar.dart';
import 'package:medication_reminder/Core/Widgets/custom_button.dart';
import 'package:medication_reminder/Views/Home/home_screen_body.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.height * .35;

    return Scaffold(
      floatingActionButton: CustomButton(
          text: 'Add',
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NewEntryScreen()),
            );
          },
          colors: const [kPrimary, kLightPurple]),
      backgroundColor: kBlack,
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
