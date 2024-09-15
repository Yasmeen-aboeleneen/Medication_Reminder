import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/colors.dart';
import 'package:medication_reminder/Core/Widgets/custom_app_bar.dart';
import 'package:medication_reminder/Core/Widgets/custom_button.dart';
import 'package:medication_reminder/Views/Home/home_screen_body.dart';
import 'package:medication_reminder/Views/New%20Entry/new_entry_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:medication_reminder/Core/Utils/Classes/notifications_service.dart'; // Import the NotificationsService

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _requestNotificationPermission() async {
    final status = await Permission.notification.request();

    if (status.isGranted) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const NewEntryScreen()),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Notification permission is required to remind you.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    NotificationsService
        .checkNotificationChannel(); // Ensure checkNotificationChannel is called
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.height * .35;

    return Scaffold(
      floatingActionButton: CustomButton(
        text: 'Add',
        onTap: _requestNotificationPermission,
        colors: const [kPrimary, kLightPurple],
      ),
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
