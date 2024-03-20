import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../core/widget/elevated_container.dart';
import '../../../core/widget/loading.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.colorWhite,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AssetImageView(
              fileName: 'loading.png',
              fit: BoxFit.contain,
               height: 250,
            ),
            // ElevatedContainer(
            //   padding: EdgeInsets.all(AppValues.margin),
            //   child: AssetImageView(
            //     fileName: 'loading.png',
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   'Mohon tunggu !!',
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }
}