import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/core/widget/asset_image_view.dart';
import 'package:kreki119/app/core/widget/custom_text_field.dart';
import 'package:kreki119/app/core/widget/icon_text_widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends BaseView<SignInController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  bool? avoidToBottomInset() {
    return true;
  }


  @override
  Widget body(BuildContext context) {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AssetImageView(fileName: 'logo_kreki_crop.png',
          width: AppValues.widthImageAuth,
          height: AppValues.heightImageAuth,
          fit: BoxFit.contain,
        ).marginAll(AppValues.padding)
        .paddingAll(AppValues.padding),
        AppValues.extraLargePadding.toInt().height,
        8.height,
        CustomTextField(hintText: 'Email', keyboardType: TextFieldType.EMAIL,
          controller: controller.emailController,
        ),
        8.height,
        CustomTextField(hintText: 'Password', keyboardType: TextFieldType.PASSWORD,
          controller: controller.passController,
        ),
        8.height,
        Align(
          alignment: Alignment.centerRight,
          child: Text('Forgot your password?', style: secondaryTextStyle()).onTap((){
            openBottomSheet(forgotPassWidget());
          }),
        ),
        8.height,
        8.height,
        Container(
          decoration: boxDecorationRoundedWithShadow(AppValues.largePadding.toInt(), backgroundColor: AppColors.colorPrimary),
          width: Get.width,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Text('Sign in', style: boldTextStyle(color: white)),
        ).onTap((){
          controller.signInEmail();
        }),
        8.height,
        RichTextWidget(list: [
          TextSpan(text: "Don't have an account? " , style: secondaryTextStyle()),
          TextSpan(
            text: ' Sign up',
            style: secondaryTextStyle(color: Colors.blue, decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap= ()=> controller.goToSignUpMode()
          ),
        ]).center(),
        AppValues.margin.toInt().height,
        Text('OR', style: primaryTextStyle(),).center(),
        8.height,
        socialLogin(FontAwesome.google, label: 'Sign in With Google', bgColor: AppColors.error500),
        SizedBox(
          height: 70,
        ),
        Text('Support by', textAlign: TextAlign.center),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AssetImageView(fileName: 'logo_kreki1.png',
              height: 50,
              fit: BoxFit.contain,
            ).marginAll(AppValues.halfPadding)
                .paddingAll(AppValues.halfPadding),
            AppValues.extraLargePadding.toInt().height,
            8.height,
          const AssetImageView(fileName: 'kemenkes.png',
            height: 40,
            fit: BoxFit.contain,
          ).marginAll(AppValues.halfPadding)
              .paddingAll(AppValues.halfPadding),
          AppValues.extraLargePadding.toInt().height,
          8.height,
        const AssetImageView(fileName: 'logo_averin.png',
          height: 40,
          fit: BoxFit.contain,
        ).marginAll(AppValues.halfPadding)
            .paddingAll(AppValues.halfPadding),
        AppValues.extraLargePadding.toInt().height,
        8.height,],),
      ],
    ).paddingAll(AppValues.padding);

  }

  Widget socialLogin(IconData iconData, {String? label, Color? bgColor}){
    return Container(
      decoration: boxDecorationRoundedWithShadow(
          AppValues.largePadding.toInt(),
          backgroundColor: bgColor ?? AppColors.colorPrimary),
      width: Get.width,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: IconTextWidget(
        icon: iconData,
        value: label ?? 'Sign in social',
        color: Colors.white,
        size: AppValues.iconSize_20,
      ).center(),
    ).onTap((){
      controller.signInGoogle();
    });
  }

  Widget forgotPassWidget(){
    return Container(
      padding: const EdgeInsets.all(AppValues.padding),
      decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.vertical(top: radiusCircular(AppValues.smallRadius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Input your email that you have register before',
            style: secondaryTextStyle(),),
          8.height,
          CustomTextField(hintText: 'Email', keyboardType: TextFieldType.EMAIL,
            controller: controller.resetEmailController,
          ),
          8.height,
          8.height,
          8.height,
          Container(
            decoration: boxDecorationRoundedWithShadow(AppValues.largePadding.toInt(),
                backgroundColor: AppColors.colorPrimary),
            width: Get.width,
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text('Reset Password', style: boldTextStyle(color: white)),
          ).onTap((){
            Get.back();
            controller.forgotPassword();
          }),
        ],
      ),
    );
  }

}
