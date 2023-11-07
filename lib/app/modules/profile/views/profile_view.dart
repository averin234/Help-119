import 'dart:io';

// import 'package:app_settings/app_settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:kreki119/app/core/view_bottom/view_update_password.dart';
import 'package:kreki119/app/modules/web_app/views/web_app_view.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends BaseView<ProfileController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(title: Text('Profile'),);
  }

  @override
  Widget body(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.mainController.loadProfile(),
      child: mainProfileView()
    );
  }

  Widget mainProfileView(){
    return ListView(
      children: [
        header(),
        Obx(()=>
            SettingSection(
              // title: const Text('Profile', style: titleStyle,),
              headerPadding: EdgeInsets.zero,
              items: generalSetting(),
              headingDecoration: const BoxDecoration(color: AppColors.primary50),
            ),
        ),

        Obx(()=>SettingSection(
          title: const Text('General', style: titleStyle,),
          items: itemSetting(),
          headingDecoration: const BoxDecoration(color: AppColors.primary50),
        ),),

        AppValues.largeMargin.toInt().height,
      ],
    );
  }

  Widget header(){
    return Obx(()=>Container(
      color: AppColors.primary200,
      child: Row(
        children: [
          Stack(
            alignment: const Alignment(0.65 , 1),
            children: [
              Obx(()=>CircleAvatar(
                radius: AppValues.extraLargeRadius,
                backgroundImage: controller.mainController.userMobile.photo != null ?
                NetworkImage(controller.mainController.userMobile.photo ?? '') : null,
              ).marginOnly(right: AppValues.largeMargin),),

              Container(
                padding: const EdgeInsets.all(AppValues.extraSmallPadding),
                decoration: const BoxDecoration(
                  color: Colors.white60,
                  shape: BoxShape.circle
                ),
                child: const Icon(Icons.edit,size: AppValues.iconSize_18,),
              ).onTap((){controller.onChooseImage();})
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.mainController.userMobile.fullName ?? 'User', style: titleStyleWhite,),
              Obx(()=> Text('${controller.mainController.userMobile.email} as ${controller.mainController.userRole.group}',
                style: cardSmallTagStyle.copyWith(color: Colors.white),),),
              Obx(()=> controller.mainController.userMobile.verified == true ?
                  Container() :
                  const Text('belum terverifikasi', style: contentTextStyle,)
              ),
            ],
          ).expand()
        ],
      ).paddingAll(AppValues.padding),
    )
    );
  }


  List<SettingItemWidget> generalSetting(){
    return [

      SettingItemWidget(
        onTap: ()async{
          if(controller.mainController.userMobile.verified == false){
            Get.toNamed(Routes.SIGN_UP_VERIFICATION, arguments: controller.mainController.userMobile);
          } else {
            Get.toNamed(Routes.PROFILE_EDIT);
          }
        },
        trailing: const Icon(Icons.chevron_right_rounded),
        leading: const Icon(Icons.edit, color: AppColors.primary400,),
        title: controller.mainController.userMobile.verified== true ?  'Edit Profile' : 'Unverified Account',
        subTitle: controller.mainController.userMobile.verified== true ?  'Ubah pengaturan akun' : 'Akun kamu belum terverifikasi, lengkapi untuk melanjutkan',
      ),
      SettingItemWidget(
        onTap: (){
          //TODO
          openBottomSheet(ViewUpdatePassword(onClickSubmit: controller.updatePassword));
        },
        trailing: const Icon(Icons.chevron_right_rounded),
        leading: const Icon(Icons.lock_person_rounded, color: AppColors.primary400,),
        title: 'Edit Password', subTitle: 'Ubah pengaturan kata sandi',
      ),

      // SettingItemWidget(
      //   onTap: (){
      //     AppSettings.openNotificationSettings(
      //       callback: (){
      //         logger.d("aap, open setting detected");
      //       }
      //     );
      //   },
      //     trailing: const Icon(Icons.chevron_right_rounded),
      //     leading: const Icon(Icons.edit_notifications_rounded, color: AppColors.primary400,),
      //     title: 'Notification',
      //   subTitle: 'Ubah pengaturan notifikasi',
      // )
    ];
  }

  List<SettingItemWidget> itemSetting(){

    return [
      SettingItemWidget(
        onTap: (){
          WebAppView.push(url: 'assets/raw/tos.html', isLocalFile: true);
        },
        leading: const Icon(Icons.assignment, color: AppColors.primary400,),
        title: 'Terms of Service', subTitle: 'Persyaratan layanan aplikasi',
      ),
      SettingItemWidget(
        onTap: (){
          WebAppView.push(url: 'assets/raw/tos.html', isLocalFile: true);
        },
        leading: const Icon(LineIcons.question, color: AppColors.primary400,),
        title: 'Frequently Asked Question', subTitle: 'Hal yang sering ditanyakan',
      ),
      SettingItemWidget(
        leading: const Icon(Icons.app_settings_alt_outlined, color: AppColors.primary400,),
        title: 'About', subTitle: 'Kreki-119 version ${controller.packageName} ',
      ),
      SettingItemWidget(
        onTap: (){
          showConfirmDialog(Get.context, 'Apakah anda yakin ingin keluar? ',
            onAccept: (){
              controller.onSignOut();
            }
          );
        },
        leading: const Icon(Icons.logout_rounded, color: AppColors.primary400,),
        title: 'Sign Out', subTitle: 'Keluar dari aplikasi',
      )
    ];
  }


}
