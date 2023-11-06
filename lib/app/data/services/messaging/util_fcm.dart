
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kreki119/app/core/model/volunteer_status.dart';
import 'package:kreki119/app/core/utils/call_util.dart';
import 'package:kreki119/flavors/build_config.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import '../../../modules/volunteer/views/volunteer_view.dart';
import '../../model/response/notification_mobile_entity.dart';


class UtilFcm{

  final Logger logger = BuildConfig.instance.config.logger;


  Future<NotificationSettings> settingFcm()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,

    );

    return settings;
  }

  StreamSubscription<RemoteMessage> messageStream(){
    return FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      if (message.notification != null) {
        //TODO
      }
    });
  }

// It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (initialMessage != null) {
        _handleMessage(initialMessage);
      }
    });

    FirebaseMessaging.onMessage.listen((remoteMessage) {
      logger.d("aap, fcm");
      _handleMessage(remoteMessage);
    });

    FirebaseMessaging.onBackgroundMessage((message) => _handleMessage(message));
  }

  Future<void> _handleMessage(RemoteMessage message) async {

    logger.d("aap, fcm: ${message.toMap().toString()}");

    if(message.notification!=null){
      logger.d("aap, fcmNotif: ${message.notification?.toMap().toString()}");
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white, // Mengubah warna teks di sini
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        isDismissible: true,
        onTap: (_) {
          Get.to(VolunteerView());
        },
        message.notification!.title ?? '', message.notification!.body ?? '', );
    }

    var payLoad = NotificationMobileEntity.fromJson(message.data);

    // if(payLoad.currentStatus == VolunteerStatus.WAITING.name){
    //   UtilCall.showCallkitIncoming(const Uuid().v4(), payLoad.pesan.toString());
    // }


    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(message),
    //   );
    // }
  }
}
