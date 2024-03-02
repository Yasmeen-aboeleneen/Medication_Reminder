import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Constants/Constants.dart';
import 'package:medication_reminder/Core/Utils/Global_Bloc.dart';
import 'package:medication_reminder/Screens/NewEntry_Bloc.dart';

import 'package:medication_reminder/Splash/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Medication Reminder',
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kScaffold,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
