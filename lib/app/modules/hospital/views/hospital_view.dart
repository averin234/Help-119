import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_map_view.dart';
import 'package:kreki119/app/core/model/page_state.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/values/app_values.dart';
import '../controllers/hospital_controller.dart';

class HospitalView extends BaseMapView<HospitalController> {

  @override
  Widget body(BuildContext context) {
    return bodyMapWidget();
  }

  @override
  Widget childSheetWidget() {
    return Container(
      decoration: boxDecorationWithRoundedCorners(),
      child: Obx(()=>controller.hospitalDataList.isEmpty &&
        controller.pageState != PageState.LOADING?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppValues.padding.toInt().height,
          const Icon(Icons.emoji_people_rounded).center(),
          const Text('Tidak ada Rs/Faskes terdeteksi di sekitarmu')
        ],
      ) :

      ListView.builder(
        itemCount: controller.hospitalDataList.length,
        shrinkWrap: true,
        controller: controller.scrollController,
        itemBuilder: (BuildContext context, int index) {
          var item = controller.hospitalDataList[index];

          return itemData(item.name ?? 'Hospital',
            address: item.address,
            phone: item.phone ?? item.phoneHumas,
            latitude: item.latitude,
            longitude: item.longitude
          );
        },
      )),
    );
  }

  @override
  String titleAppBar() {
    return "RS/Faskes";
  }



}
