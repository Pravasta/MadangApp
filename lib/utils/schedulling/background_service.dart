import 'dart:isolate';
import 'dart:ui';
import 'package:madang/common/endpoint/app_endpoint.dart';
import 'package:madang/service/api/restaurant_api_service.dart';
import 'package:madang/utils/schedulling/notification_helper.dart';
import 'package:madang/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Alarm fired!');
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await RestaurantApiService(
      appEndPoint: AppEndPoint('restaurant-api.dicoding.dev'),
    ).getRandomResto();

    await notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      result,
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
