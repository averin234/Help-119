
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../utils/call_util.dart';
import '../values/app_values.dart';
import '../values/text_styles.dart';
import 'base_map_controller.dart';

abstract class BaseMapView<Controller extends BaseMapController>
  extends BaseView<Controller>{

  ///create top sheet widget on top of map widget
  // Widget topSheetWidget();

  ///create child sheet widget below top sheet on top of map widget
  Widget childSheetWidget();

  ///create title for app bar
  String titleAppBar();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(title: Text(titleAppBar(), style: boldTitleStyle,),);
  }

  ///return this bodyMap to general ui view
  Widget bodyMapWidget(){
    return SnappingSheet(
      controller: controller.sheetController,
      lockOverflowDrag: false,
      sheetBelow: SnappingSheetContent(
          childScrollController: controller.scrollController,
          draggable: true,
          child: childSheetWidget()
      ),
      grabbing: topSheet(),
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.10,
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(positionFactor: 0.5),
        SnappingPosition.factor(
          positionFactor: 0.95,
          grabbingContentOffset: GrabbingContentOffset.bottom,
        ),
      ],
      grabbingHeight: AppValues.grabbingHeight,
      child: mapWidget(),
      onSheetMoved: (sheetPosition){
        controller.isSnap = sheetPosition.relativeToSnappingPositions > 0;
      },
    );
  }

  Widget mapWidget(){
    return SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(()=>GoogleMap(
              initialCameraPosition: initialPosition,
              mapType: MapType.terrain,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController gMapController) async{
                var position = await controller.getLastPositionLocator();
                if(position==null) {
                  showBottomSheetInfo(title: 'Terjadi kesalahan: GPS mungkin tidak aktif, cek pengaturan dan coba kembali',
                      onTapButton: (){
                        Get.back();
                        Get.back();
                      });

                  return;
                }
                controller.mapController = gMapController;

                await controller.loadInitialPosition(position);
                await controller.loadOnMapCreated(
                    latitude: position.latitude,
                    longitude: position.longitude);

              },
              markers: controller.markers.value.values.toSet(),
              onCameraMove: (position){
                controller.cameraPosition = position.target;
              },
            ),),

            Container(
              margin: const EdgeInsets.only(bottom: AppValues.padding),
              padding: const EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: AppValues.padding_4),
              decoration: boxDecorationWithRoundedCorners(borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(AppValues.radius), right: Radius.circular(AppValues.radius)
              )),
              child: Row(mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.refresh, size: AppValues.iconSize_18,),
                  AppValues.smallPadding.toInt().width,
                  Text('Muat ulang ${titleAppBar()}'),
                ],
              ),
            ).onTap((){
              controller.onClickRefreshData();
            }),
          ],
        )
    ).marginOnly(bottom: AppValues.grabbingHeight + Get.height * 0.08);
  }


  Widget topSheet(){
    return Container(
      height: AppValues.padding,
      width: Get.width,
      decoration: boxDecorationWithShadow(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppValues.radius))
      ),
      child: Column(
        children: [
          AppValues.halfPadding.toInt().height,

          Container(
            decoration: boxDecorationWithShadow(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(AppValues.largeRadius),
                  right: Radius.circular(AppValues.largeRadius),
                ),
                backgroundColor: AppColors.neutral900
            ),
            width: 60,
            height: 6,
          ),

          Text('${titleAppBar()} terdaftar').center().expand(),

          Container(
            height: 2,
            color: AppColors.neutral900,
            width: double.infinity,
          ),

        ],
      ),
    );
  }

  Widget itemData(String name,
      {String? address,
        String? phone,
        String? jarak,
        num? latitude,
        num? longitude,
      }){
    return ListTile(
      title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [Expanded(child: Text(name)),
        Text(jarak ?? ''),],),
      subtitle: Text(address ?? "Alamat tidak ditemukan"),
      trailing:
      // Row(
      //   children: [
        Icon(Icons.phone)
          .onTap((){
        UtilCall.launchCall(phone ?? "119");
      }
      ),
  // ],
  // ),
      onTap: (){
        LatLng latLng = LatLng(latitude?.toDouble() ?? 0.0,
            longitude?.toDouble() ?? 0.0);
        CameraUpdate cameraUpdate = CameraUpdate.newLatLng(latLng);
        controller.mapController.animateCamera(cameraUpdate);
        controller.sheetController.setSnappingSheetFactor(0.15);
        controller.isSnap = false;

        controller.mapController.showMarkerInfoWindow(MarkerId('$latitude,$longitude'));

      },
    );
  }



}