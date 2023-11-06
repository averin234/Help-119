import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/core/utils/call_util.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:kreki119/app/core/view_bottom/view_add_description.dart';
import 'package:kreki119/app/core/view_bottom/view_emergency_status.dart';
import 'package:kreki119/app/core/widget/asset_image_rounded.dart';
import 'package:kreki119/app/core/widget/asset_image_view.dart';
import 'package:kreki119/app/core/widget/icon_text_widgets.dart';
import 'package:kreki119/app/data/model/response/emergency_entity.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../data/model/response/emergency_mobile_entity.dart';
import '../controllers/emergency_pick_controller.dart';

class EmergencyPickView extends BaseView<EmergencyPickController> {

  static push({EmergencyMobileEntity? data}){
    Get.toNamed(Routes.EMERGENCY_PICK, arguments: data);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar();
  }

  @override
  Widget body(BuildContext context) {
    return SlidingUpPanel(
      minHeight: AppValues.minPanelHeight,
        maxHeight: 600,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppValues.largeRadius)),
      panel: contentWidget(),
      isDraggable: true,
      body: mapViewWidget(),
    );
  }

  mapViewWidget(){
    return Obx(()=>GoogleMap(
      initialCameraPosition: initialPosition,
      mapType: MapType.terrain,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController gMapController) async{
        controller.mapController = gMapController;
        logger.d('aap, onMapCreated');
        controller.loadInitialPosition();
      },
      markers: controller.markers.value.values.toSet(),
    ).marginOnly(bottom: AppValues.marginBottomMaps),);
  }

  contentWidget(){
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Informasi Korban',style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            callEmergency(),
            AppValues.largePadding.toInt().width,

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Pelapor :', style: cardSmallTagStyle),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Obx(()=>Text(controller.emergency.fullName ?? 'Anonim', style: cardSmallTagStyle),),
                    ],),),
              SizedBox(
                height: 10,
              ),
                Text('Nama Korban :', style: cardSmallTagStyle),
              Container(
                width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Obx(()=>IconTextWidget(fileName: 'ic_marker_victim.svg',value: controller.emergency.namaKorban ?? 'Anonim', )),],),),

                AppValues.padding_4.toInt().height,

              ],
            ).expand()
          ],
        ),
        Text('Foto kejadian :', style: cardSmallTagStyle),
        SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            controller.emergency.photo!,
            fit: BoxFit.cover,
            height: 180,
            width: 320,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Deskripsi Kejadian :', style: cardSmallTagStyle),

        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child:
          Obx(()=>Text(controller.emergency.keterangan?? 'Tidak ada deskripsi' , style: cardSmallTagStyle,)),),
        // controller.emergency.photo == null ? Container(height: 1,) : AssetImageRounded(pathImage: controller.emergency.photo ?? '', isFromNetwork: true,)
        SizedBox(
          height: 20,
        ),
        AppButton(
          height: AppValues.defaultButtonHeight,
          width: double.infinity,
          color: AppColors.primary400,
          child: const Text('Tindaklanjuti permintaan', style: whiteText13,),
          onTap: (){
            onClickFollowUp(controller.emergency);
          },
        ),
      ],
    ).paddingAll(AppValues.padding);
  }

  Widget callEmergency(){
    return
      SizedBox(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: AppValues.extraLargeRadius4,
                  backgroundImage: controller.emergency.imageProfilePasien != null ?
                  NetworkImage(controller.emergency.imageProfilePasien ?? '') : null,
                ),
                const CircleAvatar(
                  radius: AppValues.radius,
                  backgroundColor: AppColors.colorPrimarySwatch,
                  child: Icon(Icons.call_outlined, size: AppValues.iconSmallSize,),
                )
              ],
            ).onTap((){
              UtilCall.launchCall(controller.emergency.phoneNumber ?? '');
            }),
            AppValues.smallPadding.toInt().height,

            // Obx(()=>Text(controller.emergency.fullName ?? 'Anonim', style: boldTitleNeutralColorStyle,
            //   textAlign: TextAlign.center, maxLines: 1,)),
          ],
        ),
      );
  }

  onClickFollowUp(EmergencyMobileEntity emergency){
    if(emergency.currentStatus == EmergencyStatus.WAITING.description){
      openBottomSheetConfirmation(
          title: 'Konfirmasi Tindak lanjut',
          description: 'Kamu menerima permintaan ${emergency.fullName ?? 'anonim'}',
              // ' untuk menuju lokasi sejauh ${emergency ?? 0}Km',
          onAccept: (){
            openBottomSheet(ViewAddDescription(onClickSubmit: (desc){
              if(desc.isEmpty) return;
              controller.pickUpStats(desc);
            }));
          });
    } else if(emergency.currentStatus == EmergencyStatus.ACCEPTED.description){
      openBottomSheet(ViewEmergencyStatus(onPickStatus: (value){
        Get.back();
        switch(value){
          case EmergencyStatus.ON_GOING:
            controller.updateStats(status: value, description: 'Sedang dalam penanganan');
            Get.back();
            break;
          case EmergencyStatus.NEED_FOLLOW_UP:
            onClickChooseEmergency(value, 'Tindak lanjut penanganan terkait');
            break;
          case EmergencyStatus.SCAM:
            onClickChooseEmergency(value, 'Tindak lanjut dalam tidak ada tanda kejadian (scam)');
            break;
          case EmergencyStatus.REJECTED:
            onClickChooseEmergency(value, 'Tindak lanjut tolak penanganan');
            break;
          default:
            toast('not defined emergency');
        }
      }));
    } else if(emergency.currentStatus == EmergencyStatus.ON_GOING.description){
      onClickChooseEmergency(EmergencyStatus.FINISHED, 'Tindak lanjut dalam penanganan');
    }
  }

  onClickChooseEmergency(EmergencyStatus value, String title){
    openBottomSheet(ViewAddDescription(onClickSubmit: (description){
      controller.updateStats(status: value, description: description);
      Get.back();
    },
      title: title,
    ));
  }
}
