import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/model/emergency_status.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/view_item/item_emergency.dart';
import '../../../core/view_item/item_emergency_korban.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../routes/app_pages.dart';
import '../../emergency_pick/views/emergency_pick_view.dart';
import '../controllers/emergency_history_controller.dart';

class EmergencyHistoryView extends BaseView<EmergencyHistoryController> {
  final updateController = Get.put(EmergencyHistoryController());
  late final String currentVersion;
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(title: Text('History Permintaan'),);
  }

  @override
  Widget body(BuildContext context) {
    updateController.checkForUpdate();
    return Container(
      child: Obx(() => controller.mainController.emergencyList.isEmpty
          ? Column(
        children: [
          const AssetImageView(
            fileName: 'help119.png',
            height: 220,
            fit: BoxFit.contain,
          ),
          const Text(
            'Belum ada permintaan darurat, klik tombol darurat untuk melakukan permintaan atau',
            textAlign: TextAlign.center,
          ).center(widthFactor: 2),
          AppValues.padding.toInt().height,
          AppButton(
            onTap: () {
              controller.mainController.onLoadEmergency();
            },
            textColor: AppColors.primary400,
            text: 'Muat ulang',
          ),
        ],
      )
          : ListView.builder(
        itemCount: controller.mainController.emergencyList.where((item) => item.currentStatus == "finished").length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
            horizontal: AppValues.padding,
            vertical: AppValues.smallPadding),
        itemBuilder: (BuildContext context, int index) {
          var finishedItems = controller.mainController.emergencyList.where((item) => item.currentStatus == "finished").toList();
          var item = finishedItems[index];

          return ItemEmergency_korban(
            item: item,
            onTap: () {
              if (item.currentStatus == EmergencyStatus.WAITING.description) {
                Get.toNamed(Routes.EMERGENCY_WAIT, arguments: item);
              } else if (item.currentStatus == EmergencyStatus.ACCEPTED.description) {
                Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
              } else if (item.currentStatus == EmergencyStatus.NEED_FOLLOW_UP.description) {
                Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
              } else if (item.currentStatus == EmergencyStatus.ON_GOING.description) {
                Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
              }
            },
          );
        },
      ),
      ),
    );
  }
  }
