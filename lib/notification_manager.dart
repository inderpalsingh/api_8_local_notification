import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationManager{

  FlutterLocalNotificationsPlugin localNotificationsPlugin = FlutterLocalNotificationsPlugin();



  initializeNotificationManager(){

    AndroidInitializationSettings androidSettings = const AndroidInitializationSettings('app_icon');

    DarwinInitializationSettings iOSSettings = const DarwinInitializationSettings();

    InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings
    );

    localNotificationsPlugin.initialize(initSettings, onDidReceiveNotificationResponse: (response) {

      /// when tap on notification
      ///
    },);
  }


  /// normal notification
  void normalNotify({required int id, required String title, required String body}){

    AndroidNotificationDetails androidDetails = const AndroidNotificationDetails('channelId', 'HD Wallpaper',color: Colors.amber);

    DarwinNotificationDetails iOSDetails = const DarwinNotificationDetails();

    NotificationDetails details = NotificationDetails(

      android: androidDetails,
      iOS: iOSDetails
    );


    localNotificationsPlugin.show(
      id,
      title,
      body,
      details

    );

  }


  /// periodically notification

  void periodicallyNotify({required int id, required String title, required String body}){

    AndroidNotificationDetails androidDetails = const AndroidNotificationDetails('channelId', 'HD Wallpaper',color: Colors.amber);

    DarwinNotificationDetails iOSDetails = const DarwinNotificationDetails();

    NotificationDetails details = NotificationDetails(

      android: androidDetails,
      iOS: iOSDetails
    );

    localNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.everyMinute,
      details

    );

  }

  /// scheduled notification
  ///
  Future scheduledNotify({required int id, required String title, required String body}) async {


    AndroidNotificationDetails androidDetails = const AndroidNotificationDetails('channelId', 'HD Wallpaper',color: Colors.amber);


    DarwinNotificationDetails iOSDetails = const DarwinNotificationDetails();

    NotificationDetails details = NotificationDetails(

      android: androidDetails,
      iOS: iOSDetails
    );

    // DateTime scheduledDate = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

    return localNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)), details,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );


  }

}