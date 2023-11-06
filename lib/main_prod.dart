import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/data/local/preference/preference_manager.dart';
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

  EnvConfig prodConfig = EnvConfig(
    appName: "Kreki 119",
    baseUrl: "https://api-apps.kreki119.com/",
    initialPage: firstPage,
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  //Initialize nb_utils in main.dart file for initializing Shared Preferences and other variables.
  await initialize();

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
