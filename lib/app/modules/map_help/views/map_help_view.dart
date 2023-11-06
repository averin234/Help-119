import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../../core/base/base_view.dart';
import '../controllers/map_help_controller.dart';

class MapHelpView extends BaseView<MapHelpController> {

  static push({List<Position>? marker, String? title, TypeVolunteer? typeVolunteer}){
    Get.toNamed(Routes.MAP_HELP, arguments: [marker, title, typeVolunteer]);
  }


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    var title = Get.arguments[1];

    return AppBar(title: Text(title??'', style: boldTitleStyle,),);
  }

  @override
  Widget body(BuildContext context) {
    return SnappingSheet(
      lockOverflowDrag: true,
      sheetBelow: SnappingSheetContent(
        childScrollController: controller.scrollController,
        draggable: true,
          child: userHelperWidget()
      ),
      grabbing: topSheet(),
      grabbingHeight: AppValues.extraLargeSpacing,
      child: mapWidget(),
    );
  }

  Widget mapWidget(){
    return SizedBox(
        height: Get.height,
        width: Get.width,
        child: Obx(()=>GoogleMap(
          initialCameraPosition: initialPosition,
          mapType: MapType.terrain,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController gMapController) async{
            controller.mapController = gMapController;
            controller.loadInitialPosition();
            controller.loadUserData();
          },
          markers: controller.markers.value.values.toSet(),
        ),)
    );
  }

  Widget topSheet(){
    return Container(
      height: AppValues.padding,
      width: Get.width,
      decoration: boxDecorationWithRoundedCorners(),
    );
  }

  Widget userHelperWidget(){
    return Container(
      decoration: boxDecorationWithRoundedCorners(),
      child: Obx(()=>controller.users.isEmpty ?
          const Icon(Icons.emoji_people_rounded).center() :
          ListView.builder(
            itemCount: controller.users.length,
            shrinkWrap: true,
            controller: controller.scrollController,
            reverse: false,
            itemBuilder: (BuildContext context, int index) {
              var item = controller.users[index];

              return ListTile(
                title: Text(item.fullName ?? 'User'),
              );
            },
          )),
    );
  }

}
