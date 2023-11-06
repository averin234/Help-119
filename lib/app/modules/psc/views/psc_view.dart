import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kreki119/app/core/base/base_map_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/model/page_state.dart';
import '../../../core/values/app_values.dart';
import '../controllers/psc_controller.dart';

class PscView extends BaseMapView<PscController> {


  @override
  Widget body(BuildContext context) {
    return bodyMapWidget();
  }

  @override
  Widget childSheetWidget() {
    return Container(
      decoration: boxDecorationWithRoundedCorners(),
      child: Obx(()=>controller.pscDataList.isEmpty &&
          controller.pageState != PageState.LOADING?
      Column(
        children: [
          AppValues.padding.toInt().height,
          const Icon(Icons.emoji_people_rounded).center(),
          const Text('Tidak ada PSC terdeteksi di sekitarmu')
        ],
      ) :

      ListView.builder(
        itemCount: controller.pscDataList.length,
        shrinkWrap: true,
        controller: controller.scrollController,
        itemBuilder: (BuildContext context, int index) {
          var item = controller.pscDataList[index];

          return itemData(item.fullName ?? "PSC",
              address: item.address,
              phone: item.phoneNumber,
              latitude: item.latitude,
              longitude: item.longitude
          );
        },
      )),
    );
  }

  @override
  String titleAppBar() => "PSC";


}
