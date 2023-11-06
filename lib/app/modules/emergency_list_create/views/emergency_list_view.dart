import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/model/emergency_status.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/view_item/item_emergency_korban.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../routes/app_pages.dart';
import '../controllers/emergency_list_controller.dart';

class EmergencyListView extends BaseView<EmergencyListController> {
  final updateController = Get.put(EmergencyListController());
  late final String currentVersion;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(title: Text('Permintaan Emergency'),);
  }

  @override
  Widget body(BuildContext context) {
    updateController.checkForUpdate();
    return WillPopScope(
        onWillPop: () async {
      Navigator.of(context).popUntil((route) => route.isFirst);
      return true;
    },
    child: RefreshIndicator(
      onRefresh: () => controller.mainController.onLoadEmergency(),
      child: Column(
        children: [
          Container(
            child: Obx(() =>
            controller.mainController.emergencyList.isEmpty
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
                AppValues.padding
                    .toInt()
                    .height,
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
              itemCount: controller.mainController.emergencyList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                  vertical: AppValues.smallPadding),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.mainController.emergencyList[index];
                // var photos = item.photos?.first ?? '';
                if (item.currentStatus == "finished") {
                  // Jika currentStatus adalah "finished", maka item akan diabaikan.
                  return SizedBox
                      .shrink(); // Ini akan menghasilkan widget yang tidak terlihat
                } else {
                  return ItemEmergency_korban(
                    item: item,
                    onTap: () {
                      if (item.currentStatus ==
                          EmergencyStatus.WAITING.description) {
                        Get.toNamed(Routes.EMERGENCY_WAIT, arguments: item);
                      } else if (item.currentStatus ==
                          EmergencyStatus.ACCEPTED.description) {
                        Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
                      } else if (item.currentStatus ==
                          EmergencyStatus.NEED_FOLLOW_UP.description) {
                        Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
                      } else if (item.currentStatus ==
                          EmergencyStatus.ON_GOING.description) {
                        Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
                      }
                    },
                  );
                }
              },
            )
            ).expand(),
          ),
        ],
      ),
      ),
    );
  }
}
