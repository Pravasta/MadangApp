import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:madang/common/routes/routes_name.dart';
import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  int randNumber = 0;

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotifications) async {
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) async {
        final payload = details.payload;
        if (payload != null) {
          print('Notification payload :$payload');
        }
        selectNotificationSubject.add(payload ?? 'Empty payload');
      },
    );
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    Restaurants restaurant,
  ) async {
    var channelId = '1';
    var channelName = 'Madang';
    var channelDescription = 'Madang recommended resto';

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: const DefaultStyleInformation(
        true,
        true,
      ),
    );

    var iosPlatformChannelSpecifics = const DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    var titleNotification = "<b>Madang Resto";
    var dataResto = restaurant;
    var nameResto = dataResto.name;

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      nameResto,
      platformChannelSpecifics,
      payload: json.encode(dataResto.toJson()),
    );
  }

  void configureSelectNotificationSubject(BuildContext context, String route) {
    selectNotificationSubject.stream.listen(
      (String event) async {
        var data = Restaurants.fromJson(json.decode(event));

        Navigator.of(context).pushNamed(
          RoutesName.detailPage,
          arguments: data.id,
        );
      },
    );
  }
}
