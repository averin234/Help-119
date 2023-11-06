import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async{

  var widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  //Initialize nb_utils in main.dart file for initializing Shared Preferences
  //and other variables.
  await initialize();

  ///check what first page to see
  var token = getStringAsync(PreferenceManager.keyToken);
  bool isLogin = token.isNotEmpty;
  String firstPage = isLogin ? Routes.MAIN : Routes.SIGN_IN;

  EnvConfig devConfig = EnvConfig(
    appName: "Help 119 Dev",
    baseUrl: "https://kreki-backend-nest-i6nlulkyva-et.a.run.app/",
    initialPage: firstPage,
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}


@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.toMap().toString()}");
}

