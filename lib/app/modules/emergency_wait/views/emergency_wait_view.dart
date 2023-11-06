import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/core/widget/asset_image_view.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/emergency_wait_controller.dart';

class EmergencyWaitView extends BaseView<EmergencyWaitController> {


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.arrow_back
      ).onTap((){
        Get.back();
        showConfirmDialog(Get.context, 'Batalkan panggilan darurat? ',
            onAccept: (){
              controller.updateStats(status: EmergencyStatus.CANCELED);
            }
        );
        controller.mainController.onLoadEmergency();
        Get.back();
      }),
    );
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
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: AppColors.info500,
          //   ),
          //   child: Row(
          //     children: [
          //       CircularProgressIndicator(
          //         backgroundColor: Colors.white,
          //         color: Colors.grey[110],
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Text('Sedang Mencari Relawan', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Mencari bantuan \nterdekat', style: primaryTextStyle(),),
              AppButton(
                onTap: (){
                  //TODO: made something to reCall again
                  toast('mencari pertolongan');
                },
                text: 'Ulangi',
                textColor: AppColors.neutral50,
                color: AppColors.secondary400,
              ),
              AppButton(
                onTap: (){
                  showConfirmDialog(Get.context, 'Batalkan panggilan darurat? ',
                      onAccept: (){
                        controller.updateStats(status: EmergencyStatus.CANCELED);
                        Get.back();
                      }
                  );
                },
                text: 'Batalkan',
                textColor: AppColors.neutral50,
                color: AppColors.error500,
              )
            ],
          ),

          AppValues.largePadding.toInt().height,
          Text('Info', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Selagi menunggu relawan datang anda bisa pencegahan pertama dengan Klik tombol (Panduan pertolongan) atau juga menghubungin langsung nomor 119'),
          // controller.emergency.photo == null ? Container(height: 1,) : AssetImageRounded(pathImage: controller.emergency.photo ?? '', isFromNetwork: true,)
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(isCallMode: false).expand(),
              AppValues.padding.toInt().width,
              button(isCallMode: true).expand()
            ],
          )
        ],
      ),
    );
  }

  Widget button({required bool isCallMode}){
    return Container(
      height: AppValues.heightEmergencyButton,
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding_4, vertical: AppValues.smallPadding),
      decoration: boxDecorationWithRoundedCorners(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(AppValues.largeRadius),
            right: Radius.circular(AppValues.largeRadius),),
        backgroundColor: isCallMode ? AppColors.error100 : AppColors.secondary100,
      ),
      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: isCallMode ? AppColors.error300 : AppColors.secondary600,
            child: AssetImageView(fileName: isCallMode ? 'ic_call.svg' : 'ic_help.svg',
              color: Colors.white).marginAll(AppValues.padding_4),
          ),
          AppValues.padding.toInt().width,
          Text(isCallMode ? 'Panggil 119' : 'Panduan \npertolongan',
            style: secondaryTextStyle(weight: FontWeight.bold,
              color: isCallMode ? AppColors.error300 : AppColors.secondary600,),)

        ],
      )
    ).onTap((){
      isCallMode ? openCall('119') : Get.toNamed(Routes.AID_BOOK, arguments: true);
    });
  }

}
