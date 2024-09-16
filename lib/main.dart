import 'package:flutter/material.dart';
import 'package:medication_reminder/Core/Utils/Classes/global_bloc.dart';
import 'package:medication_reminder/Core/Utils/Classes/notifications_service.dart';
import 'package:medication_reminder/Views/Splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    debugPrint("WorkManager task executed: $task");

    await NotificationsService.showInstantNotification(
      'Medication Reminder',
      'It is time to take your medicine.',
    );

    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize WorkManager for background tasks
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  // Initialize notifications
  await NotificationsService.init();
  await NotificationsService.checkNotificationChannel();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalBloc>(
          create: (_) => GlobalBloc(),
          dispose: (context, globalBloc) => globalBloc.dispose(),
        ),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Medication Reminder',
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
