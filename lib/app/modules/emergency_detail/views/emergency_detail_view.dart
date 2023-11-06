import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/view_item/item_emergency.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/emergency_detail_controller.dart';

class EmergencyDetailView extends BaseView<EmergencyDetailController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        mapViewWidget(),
        contentViewWidget()
      ],
    );
  }


  mapViewWidget(){
    return Obx(()=>GoogleMap(
      initialCameraPosition: initialPosition,
      mapType: MapType.terrain,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController gMapController) async{
        controller.mapController = gMapController;
        controller.loadInitialPosition();
      },
      markers: controller.markers.value.values.toSet(),
    ).expand(),);
  }

  contentViewWidget(){
    return Container(
      decoration: boxDecorationWithRoundedCorners(),
      padding: const EdgeInsets.all(AppValues.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(()=>ItemEmergency(item: controller.emergency))

        ],
      ),
    );
  }


}
