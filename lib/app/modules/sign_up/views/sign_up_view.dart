import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../core/widget/custom_text_field.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends BaseView<SignUpController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
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
        CustomTextField(hintText: 'Confirm Password', keyboardType: TextFieldType.PASSWORD,
          controller: controller.rePassController,
        ),
        8.height,
        Container(
          decoration: boxDecorationRoundedWithShadow(AppValues.largePadding.toInt(),
              backgroundColor: AppColors.colorPrimary),
          width: Get.width,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Text('Sign up', style: boldTextStyle(color: white)),
        ).onTap((){
          controller.signUpByEmail();
        }),
        8.height,
        RichTextWidget(list: [
          TextSpan(text: "Already have an account? " , style: secondaryTextStyle()),
          TextSpan(
              text: ' Sign in',
              style: secondaryTextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap= ()=> controller.goToSignInView()
          ),
        ]).center()
      ],
    ).paddingAll(AppValues.padding);
  }


}
