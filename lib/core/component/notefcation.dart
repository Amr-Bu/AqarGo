import 'package:firebase_messaging/firebase_messaging.dart';

import '../network/remote/header_constance.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _requestPermission();
    await _printToken();
    _setupForegroundListener();
    _setupOpenedAppListener();
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('✅ تم منح إذن الإشعارات');
    } else {
      print('❌ لم يتم منح إذن الإشعارات');
    }
  }

  Future<void> _printToken() async {
    String? token = await _messaging.getToken();
    print('📱 FCM Token: $token');
    HeaderConstance.fcmToken= token!;
    print(HeaderConstance.fcmToken);
  }

  void _setupForegroundListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 إشعار أثناء فتح التطبيق:');
      print('📌 العنوان: ${message.notification?.title}');
      print('📝 المحتوى: ${message.notification?.body}');
    });
  }

  void _setupOpenedAppListener() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('📲 تم فتح التطبيق من الإشعار:');
      print('📌 العنوان: ${message.notification?.title}');
      print('📝 المحتوى: ${message.notification?.body}');
    });
  }
}
