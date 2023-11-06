
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:kreki119/app/data/model/response/notification_mobile_entity.dart';
import 'package:kreki119/app/modules/profile/views/profile_view.dart';
import 'package:kreki119/app/routes/app_pages.dart';

import '/app/core/base/base_view.dart';
import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/settings/views/settings_view.dart';


// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return FirebaseNotificationsHandler(
      customSound: 'sirene.wav',
      defaultNavigatorKey: GlobalKey<NavigatorState>(),
      onOpenNotificationArrive: (_,payLoad){
        logger.d("aap, dataKey: ${payLoad.toString()}");
        var notif = NotificationMobileEntity.fromJson(payLoad as Map<String, dynamic>);
        if(notif.currentStatus == EmergencyStatus.WAITING.description){
          if(Get.currentRoute != Routes.MAIN){
            Get.until((route) => Get.currentRoute == Routes.MAIN);
          }
          controller.onLoadEmergency();
        }
      },
      onFCMTokenInitialize: (_, token){
        if(token!=null){
          controller.updateFcmToServer(token);
        }
      },
      onFCMTokenUpdate: (_,token){
        if(token!=null){
          controller.updateFcmToServer(token);
        }
      },
      onTap: (navState, appState, payLoad)async{
        var notif = NotificationMobileEntity.fromJson(payLoad as Map<String, dynamic>);
        var user = await controller.getUserMobile();

        if(controller.userRole.group == "volunteer"){
          Get.toNamed(Routes.VOLUNTEER);
        }

        if(controller.userRole.group == "user"){
          Get.offAllNamed(Routes.MAIN);
        }

      },
      channelId: 'ChannelId',
      channelName: 'Kreki',
      enableLogs: true,

      child: Container(
        key: UniqueKey(),
        child: Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar();
  }

  @override
  Widget floatingActionButton() {

    return FloatingActionButton.large(onPressed: (){
      onClickEmergency();
    },
      backgroundColor: AppColors.error600,
      child: const Text('Darurat', style: descriptionTextStyle,),
    );
  }
  @override
  Widget floatingActionButton1() {

    return FloatingActionButton.large(onPressed: (){
      onClickEmergency();
    },
      backgroundColor: AppColors.error600,
      child: const Text('Darurat', style: descriptionTextStyle,),
    );
  }

  @override
  FloatingActionButtonLocation? fabLocation() {
    return FloatingActionButtonLocation.centerDocked;
  }

  final HomeView homeView = HomeView();
  ProfileView? profileView;
  FavoriteView? favoriteView;
  SettingsView? settingsView;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.PROFILE:
        profileView ??= ProfileView();
        return profileView!;
      case MenuCode.FAVORITE:
        favoriteView ??= FavoriteView();
        return favoriteView!;
      case MenuCode.SETTINGS:
        settingsView ??= SettingsView();
        return settingsView!;
      default:
        return OtherView(
          viewParam: describeEnum(menuCode),
        );
    }
  }

  @override
  Color statusBarColor() {
    return AppColors.primary50;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.primary50;
  }

  onClickEmergency() async {
    var user = await controller.getUserMobile();

    choiceUserVerified(user.verified == true);
  }



}
