import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_map_view.dart';
import 'package:kreki119/app/core/model/page_state.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/values/app_values.dart';
import '../controllers/volunteer_map_controller.dart';

class VolunteerMapView extends BaseMapView<VolunteerMapController> {

  final updateController = Get.put(VolunteerMapController());
  late final String currentVersion;

  @override
  Widget body(BuildContext context) {
    updateController.checkForUpdate();
    return bodyMapWidget();
  }

  @override
  Widget childSheetWidget() {
    return Container(
      decoration: boxDecorationWithRoundedCorners(),
      child: Obx(()=>controller.volunteerDataList.isEmpty
          && controller.pageState != PageState.LOADING ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppValues.padding.toInt().height,
          const Icon(Icons.emoji_people_rounded).center(),
          const Text('Tidak ada Relawan terdeteksi di sekitarmu')
        ],
      ) :

      ListView.builder(
        itemCount: controller.volunteerDataList.length,
        shrinkWrap: true,
        controller: controller.scrollController,
        itemBuilder: (BuildContext context, int index) {
          var item = controller.volunteerDataList[index];

          return itemData(item.fullName ?? 'Relawan',
              address: item.address,
              phone: item.phoneNumber,
              jarak: item.jarak.toString() + " " + (item.satuan ?? ''),
              latitude: item.latitude,
              longitude: item.longitude
          );
        },
      )),
    );
  }

  @override
  String titleAppBar() => "Relawan";


}
