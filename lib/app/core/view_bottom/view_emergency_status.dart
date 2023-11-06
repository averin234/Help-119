import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/core/widget/elevated_container.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/app_colors.dart';
import '../values/app_values.dart';

class ViewEmergencyStatus extends StatelessWidget {
  const ViewEmergencyStatus({Key? key, required this.onPickStatus}) : super(key: key);

  final Function(EmergencyStatus status) onPickStatus;

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Pilih tindak lanjut", style: primaryTextStyle(weight: FontWeight.bold),),
          AppValues.padding.toInt().height,
          AppButton(
            onTap: (){
              onPickStatus(EmergencyStatus.ON_GOING);
            },
            color: AppColors.primary400,
            child: Text('Dalam penanganan', style: secondaryTextStyle(color: AppColors.textColorWhite),),
          ).marginSymmetric(vertical: AppValues.smallMargin),
          AppButton(
            onTap: (){
              onPickStatus(EmergencyStatus.NEED_FOLLOW_UP);
            },
            color: AppColors.secondary400,
            child: Text('Butuh bantuan penanganan terkait (Need Follow Up)', style: secondaryTextStyle(color: AppColors.textColorWhite),),
          ).marginSymmetric(vertical: AppValues.smallMargin),
          // AppButton(
          //   onTap: (){
          //     onPickStatus(EmergencyStatus.SCAM);
          //   },
          //   color: AppColors.error600,
          //   child: Text('Tidak ada tanda kejadian', style: secondaryTextStyle(color: AppColors.textColorWhite),),
          // ).marginSymmetric(vertical: AppValues.smallMargin),
          AppButton(
            onTap: (){
              onPickStatus(EmergencyStatus.REJECTED);
            },
            color: AppColors.error600,
            child: Text('Tolak penanganan', style: secondaryTextStyle(color: AppColors.textColorWhite),),
          ).marginSymmetric(vertical: AppValues.smallMargin),
        ]
      ),
    );
  }
}
