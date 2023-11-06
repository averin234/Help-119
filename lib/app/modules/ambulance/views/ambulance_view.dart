import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kreki119/app/core/base/base_map_view.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/model/page_state.dart';
import '../controllers/ambulance_controller.dart';

class AmbulanceView extends BaseMapView<AmbulanceController> {

  @override
  Widget body(BuildContext context) {
    return bodyMapWidget();
  }

  @override
  Widget childSheetWidget() {
    return Container(
      decoration: boxDecorationWithRoundedCorners(),
      child: Obx(()=>controller.ambulanceDataList.isEmpty &&
          controller.pageState != PageState.LOADING?
      Column(
        children: [
          AppValues.padding.toInt().height,
          const Icon(Icons.emoji_people_rounded).center(),
          const Text('Tidak ada ambulans terdeteksi di sekitarmu')
        ],
      ).center() :

      ListView.builder(
        itemCount: controller.ambulanceDataList.length,
        shrinkWrap: true,
        controller: controller.scrollController,
        itemBuilder: (BuildContext context, int index) {
          var item = controller.ambulanceDataList[index];

          return itemData(item.name ?? "Ambulance",
            address: item.alamat,
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
  String titleAppBar() {
    return "Ambulans";
  }

}
