import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medication_reminder/Core/Utils/Classes/medicine_type.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:medication_reminder/Models/medicine.dart';

class NotificationsService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String customChannelId = 'custom_channel_id';

  static Future<void> init() async {
    // Initialize timezone data
    tz.initializeTimeZones();

    // Define initialization settings for Android and iOS
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    // Initialize the FlutterLocalNotificationsPlugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          debugPrint('Notification payload: ${response.payload}');
        }
        // Navigate to specific screen if needed
      },
    );

    // Create notification channel
    await checkNotificationChannel();

    // Request permissions for iOS
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
        );
  }

  static Future<void> checkNotificationChannel() async {
    // Define a notification channel for Android with custom sound
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      customChannelId,
      'Sound',
      description: 'This channel is used for notifications with custom sound',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('sound'), // Ensure 'sound' is a valid file in res/raw
    );

    // Create the notification channel
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    debugPrint('Notification channel created successfully');
  }

  static Future<void> showInstantNotification(String title, String body) async {
    // Define notification details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        customChannelId,
        'Sound',
        sound: RawResourceAndroidNotificationSound('sound'),
        playSound: true,
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    // Show an instant notification
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformChannelSpecifics,
      payload: 'instant_notification',
    );
  }

  static Future<void> scheduleNotification(Medicine medicine) async {
    final hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
    final minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);

    for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {
      var scheduledHour = hour + (medicine.interval! * i).toInt();
      if (scheduledHour > 23) {
        scheduledHour -= 24;
      }

      final scheduledTime = tz.TZDateTime(
        tz.local,
        tz.TZDateTime.now(tz.local).year,
        tz.TZDateTime.now(tz.local).month,
        tz.TZDateTime.now(tz.local).day,
        scheduledHour,
        minute,
        0
      );

      debugPrint('Scheduling notification for ${scheduledTime.toString()}');

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          customChannelId,
          'Sound',
          sound: RawResourceAndroidNotificationSound('sound'),
          playSound: true,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      );

      try {
        await flutterLocalNotificationsPlugin.zonedSchedule(
          int.parse(medicine.notificationIDs![i] as String),
          'Reminder: ${medicine.medicineName}',
          medicine.medicineType != MedicineType.none
              ? 'It is time to take your ${medicine.medicineType!.toLowerCase()}, according to schedule'
              : 'It is time to take your medicine, according to schedule',
          scheduledTime,
          platformChannelSpecifics,
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
}
