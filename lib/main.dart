import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
 import 'package:medication_reminder/Core/Utils/Global_Bloc.dart';
import 'package:medication_reminder/Views/Splash/splash_screen.dart';
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
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Medication Reminder',
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
