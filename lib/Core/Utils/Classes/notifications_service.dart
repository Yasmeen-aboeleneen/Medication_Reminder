import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medication_reminder/Views/Home/home_screen.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:medication_reminder/Models/medicine.dart';
import 'package:medication_reminder/Core/Utils/Classes/medicine_type.dart';

class NotificationsService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String customChannelId = 'custom_channel_id';

  // Initialize notifications and time zones
  static Future<void> init() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          debugPrint('Notification payload: ${response.payload}');
        }
        // Navigation logic for notification click
        Navigator.push(
          BuildContext as BuildContext, // Use the correct BuildContext
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
    );

    await checkNotificationChannel();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // Create custom notification channel for Android
  static Future<void> checkNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      customChannelId,
      'Medication Notifications',
      description: 'Channel for medication reminders with custom sound',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('sound'),
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    debugPrint('Notification channel created successfully');
  }

  // Display an instant notification
  static Future<void> showInstantNotification(String title, String body) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        customChannelId,
        'Medication Notification',
        sound: RawResourceAndroidNotificationSound('sound'),
        playSound: true,
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformChannelSpecifics,
      payload: 'instant_notification',
    );
  }

  // Schedule a notification based on medicine details
  static Future<void> scheduleNotification(Medicine medicine) async {
    final now = tz.TZDateTime.now(tz.local);
    final hour = int.parse(medicine.startTime!.substring(0, 2));
    final minute = int.parse(medicine.startTime!.substring(2, 4));

    for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {
      var scheduledHour = hour + (medicine.interval! * i).toInt();
      if (scheduledHour > 23) {
        scheduledHour -= 24;
      }

      // Create the scheduled time
      var scheduledTime = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        scheduledHour,
        minute,
        0,
      );

      // If scheduledTime is in the past, add a day
      if (scheduledTime.isBefore(now)) {
        const daysToAdd = 1;
        final nextDay = now.add(const Duration(days: daysToAdd));
        scheduledTime = tz.TZDateTime(
          tz.local,
          nextDay.year,
          nextDay.month,
          nextDay.day,
          scheduledHour,
          minute,
          0,
        );
      }

      debugPrint('Scheduling notification for ${scheduledTime.toString()}');

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          customChannelId,
          'Medication Notification',
          sound: RawResourceAndroidNotificationSound('sound'),
          playSound: true,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      );

      try {
        await flutterLocalNotificationsPlugin.zonedSchedule(
          int.parse(medicine.notificationIDs![i]
              .toString()), // Ensure IDs are integers
          'Reminder: ${medicine.medicineName}',
          // ignore: unrelated_type_equality_checks
          medicine.medicineType != MedicineType.none
              ? 'It is time to take your ${medicine.medicineType!.toLowerCase()}, according to schedule'
              : 'It is time to take your medicine, according to schedule',
          scheduledTime,
          platformChannelSpecifics,
          // ignore: deprecated_member_use
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
        debugPrint('Notification scheduled successfully');
      } catch (error) {
        debugPrint('Error scheduling notification: $error');
      }
    }
  }

  // Schedule a periodic background notification task using WorkManager
  static Future<void> scheduleBackgroundNotification(Medicine medicine) async {
    Workmanager().registerPeriodicTask(
      'unique-task-id-${medicine.medicineName}', // Unique identifier
      'medicationReminder', // Task name
      inputData: {
        'medicineName': medicine.medicineName,
        'interval': medicine.interval,
        'type': medicine.medicineType.toString(),
      },
      frequency: Duration(hours: medicine.interval!),
    );
  }

  static void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      final String medicineName = inputData!['medicineName'];
      final String type = inputData['type'];

      await NotificationsService.showInstantNotification(
          'Reminder: $medicineName',
          type.isNotEmpty
              ? 'Time to take your $type medication'
              : 'Time to take your medicine');

      return Future.value(true);
    });
  }
}
