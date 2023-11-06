
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/utils/call_util.dart';
import 'package:kreki119/app/data/model/response/notification_mobile_entity.dart';
import 'package:kreki119/app/data/services/auth/firebase_user_provider.dart';
import 'package:kreki119/app/data/services/messaging/util_fcm.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:uuid/uuid.dart';

import '/app/bindings/initial_binding.dart';
import '/app/core/values/app_colors.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'core/values/text_styles.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;
  final Logger logger = BuildConfig.instance.config.logger;

  @override
  void initState() {
    super.initState();

    UtilFcm().setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: _envConfig.initialPage,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: _getSupportedLocal(),
      theme: ThemeData(
          primarySwatch: AppColors.colorPrimarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          primaryColor: AppColors.colorPrimary,
          textTheme: const TextTheme(
            labelLarge: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.pageBackground,
            iconTheme: const IconThemeData(color: AppColors.neutral400),
            elevation: 0,
            titleTextStyle: boldTitleNeutralColorStyle,
          ),
          fontFamily: 'Roboto',
          tabBarTheme: const TabBarTheme(
            labelColor: AppColors.neutral400,
            unselectedLabelColor: AppColors.neutral100,
          )
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
      const Locale('id', ''),
    ];
  }

  checkUserData()async{
    firebaseTokenStream().listen((event) async{
      var token = await event.user?.getIdToken();
      logger.d("aap, tokenChangeFromEvent: $token");
      var userJson = JwtDecoder.decode(token ?? await currentUser?.user?.getIdToken() ?? '');
      logger.d('aap, userJson: $userJson');
    });
  }

}


@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  //TODO
  // var payloadData = NotificationMobileEntity.fromJson(notificationResponse.payload as Map<String, dynamic>);
  // UtilCall.showCallkitIncoming(const Uuid().v4(), payloadData.currentStatus.toString());
}

