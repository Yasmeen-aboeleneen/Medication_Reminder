import 'package:flutter/material.dart';
import 'package:medication_reminder/Home/HomeScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Medication Reminder',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
