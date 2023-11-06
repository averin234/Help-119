import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/core/view_item/item_emergency.dart';
import 'package:kreki119/app/modules/emergency_pick/views/emergency_pick_view.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/values/text_styles.dart';
import '../../../core/widget/asset_image_view.dart';
import '../controllers/volunteer_controller.dart';

class VolunteerView extends BaseView<VolunteerController> {
  final updateController = Get.put(VolunteerController());
  late final String currentVersion;

  // static push({UserMobileEntity? user, required String userId}){
  //   Get.toNamed(Routes.VOLUNTEER, arguments: [user, userId]);
  // }

  late final PreferredSizeWidget bottom;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {

    return AppBar(
      toolbarHeight: 250,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Relawan Kreki',),
          const SizedBox(
            height: 10,
          ),
        ],),
      titleSpacing: 0,
      bottom:  PreferredSize(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(height: 250),
          child: Column(children: [
            Obx(()=>Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 50,
                          child:
                          Text("Status",style: TextStyle(fontSize: 13, color: Colors.black),),),
                        Container(
                          child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black),),
                        ),
                        Text(controller.mainController.userRole.group ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                      ],),
                      Row(children: [
                      const AssetImageView(fileName: 'logo_kreki1.png',
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                        SizedBox(
                          width: 10,
                        ),
                        const AssetImageView(fileName: 'kemenkes.png',
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      SizedBox(
                        width: 10,
                      ),
                      const AssetImageView(fileName: 'logo_averin.png',
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                      ],),
                    ],),
                  Row(children: [
                    Column(children: [
                      Obx(()=>CircleAvatar(
                        radius: AppValues.extraLargeRadius,
                        backgroundImage: controller.mainController.userMobile.photo != null ?
                        NetworkImage(controller.mainController.userMobile.photo ?? '') : null,
                      ).marginOnly(right: 10),),
                      ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                                height: 750,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child:Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 5,
                                      margin: EdgeInsets.only(left: 150, right: 150),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                    child : Container(
                                      height: 390,
                                      child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Verifikasi KTP', style: TextStyle(fontSize: 16)),
                                    ClipRRect(
                                      borderRadius: new BorderRadius.circular(10),
                                      child: Image.network(controller.mainController.userMobile.photoKtp ??'',
                                          fit: BoxFit.cover,
                                          height: 200, width: 320),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Verifikasi Sertifikat', style: TextStyle(fontSize: 16)),
                                    ClipRRect(
                                      borderRadius: new BorderRadius.circular(10),
                                      child: Image.network(controller.mainController.userMobile.photoCertificate ??'',
                                          fit: BoxFit.cover,
                                          height: 200, width: 320),),

                                  ],
                                )
                            ),
                                      ),
                                    ),
                                  ],
                                ),
                            ),
                            ignoreSafeArea: isBlank,
                            isDismissible: true,
                            enableDrag: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.green,
                          elevation: 5,  // Elevation
                          shadowColor: Colors.white, // Shadow Color
                        ),
                        child: const Text(
                          'Verifikasi',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: 70,
                            child:
                            Text("Nama",style: TextStyle(fontSize: 13, color: Colors.black),),),
                          Container(
                            child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black),),
                          ),
                          Text(controller.mainController.userMobile.fullName ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black),),
                        ],),
                        Row(children: [
                          SizedBox(
                            width: 70,
                            child:
                            Text("KTP",style: TextStyle(fontSize: 13, color: Colors.black),),),
                          Container(
                            child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black),),
                          ),
                          Text(controller.mainController.userMobile.ktp ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black),),
                        ],),
                        Row(children: [
                          SizedBox(
                            width: 70,
                            child:
                            Text("Gender",style: TextStyle(fontSize: 13, color: Colors.black),),),
                          Container(
                            child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black),),
                          ),
                          Text(controller.mainController.userMobile.gender ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black),),
                        ],),
                        Row(children: [
                          SizedBox(
                            width: 70,
                            child:
                            Text("Alamat",style: TextStyle(fontSize: 13, color: Colors.black),),),
                          Container(
                            child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black),),
                          ),
                          Text(controller.mainController.userMobile.address ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black),),
                        ],),
                        Row(children: [
                          SizedBox(
                            width: 70,
                            child:
                            Text("Kode POS",style: TextStyle(fontSize: 13, color: Colors.black),),),
                          Container(
                            child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black),),
                          ),
                          Text(controller.mainController.userMobile.cityCode ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black),),
                        ],),
                      ],),
                  ],),

                ],),
            ),),
            TabBar(
              controller: controller.tabController,
              tabs: [
                Tab(text: 'Darurat',),
                // Tab(text: 'Diterima',),
                Tab(text: 'Riwayat',)
              ],
            ),

          ],)
        ),
        preferredSize: Size(60, 60),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    updateController.checkForUpdate();
    return volunteerWidget();
  }

  Widget notVolunteerWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Anda belum menjadi relawan, \n'
            'mendaftar terlebih dahulu untuk melanjutkan',
          textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
        ).center(),
        AppValues.padding.toInt().height,
        AppButton(
          onTap: (){
            Get.toNamed(Routes.UPGRADE_VOLUNTEER);
          },
          textColor: AppColors.primary400,
          text: 'Daftar Relawan',
        )
      ],
    );
  }

  Widget requestVolunteerWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Permintaan relawan anda dalam pengajuan, \n'
            'segarkan halaman ini, untuk melihat perubahan status',
          textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
        ).center(),
        AppValues.padding.toInt().height,
        AppButton(
          onTap: (){
            controller.loadProfile();
          },
          textColor: AppColors.primary400,
          text: 'Cek Status relawan',
        )
      ],
    );
  }

  Widget volunteerWidget(){
    return Column(
      children: [
        TabBarView(
          controller: controller.tabController,
            children: [
              requestedEmergency(),
              // onGoingEmergency(),
              finishedEmergency()
            ]
        ).expand(),

        Obx(()=>controller.onGoingList.isNotEmpty?
        ItemEmergency(item: controller.onGoingList.first,
          isVolunteerView: true,
          onTap: (){
            EmergencyPickView.push(data: controller.onGoingList.first);
          },):
        Container(height: 1,)),
      ],
    );
  }

  Widget requestedEmergency(){
    return Obx(()=>controller.emergencyList.isEmpty ?
    Column(
      children: [
        SizedBox(
          height: 70,
        ),
      AssetImageView(fileName: 'volunteering.png',
        height: 80,
        fit: BoxFit.contain,
      ),
    SizedBox(
      height: 20,
    ),
    Text('Belum ada permintaan darurat di dekatmu, data permintaan terdekat akan tampil disini',
      textAlign: TextAlign.center,).center(widthFactor: 2) ],):
    ListView.separated(
      itemCount: controller.emergencyList.length,
      shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: AppValues.padding,
            vertical: AppValues.smallPadding),
        itemBuilder: (BuildContext context, int index) {
        var item = controller.emergencyList[index];

        return ItemEmergency(item: item,
          onTap: (){
            if(controller.onGoingList.isEmpty){
              EmergencyPickView.push(data: item);
            } else {
              controller.showMessage('Selesaikan permintaan darurat berlangsung dahulu');
            }
          },
        );
    }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),)
    );
  }

  Widget onGoingEmergency(){
    return Obx(()=>controller.onGoingList.isEmpty ?

    Text('Belum ada permintaan darurat berlangsung',
      textAlign: TextAlign.center,).center(widthFactor: 2):
    ListView.separated(
      itemCount: controller.onGoingList.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: AppValues.smallPadding),
      itemBuilder: (BuildContext context, int index) {
        var item = controller.onGoingList[index];

        return ItemEmergency(item: item,
          onTap: (){
            EmergencyPickView.push(data: item);
          },
        );
      }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8,),

    )
    );
  }

  Widget finishedEmergency(){
    return Obx(()=>controller.finishedList.isEmpty ?
    Column(children: [
      SizedBox(
        height: 70,
      ),
      AssetImageView(fileName: 'history.png',
      height: 80,
      fit: BoxFit.contain,
    ),
      SizedBox(
        height: 20,
      ),
    Text('Belum ada permintaan darurat terselesaikan',
      textAlign: TextAlign.center,).center(widthFactor: 2) ]):
    ListView.separated(
      itemCount: controller.finishedList.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: AppValues.smallPadding),
      itemBuilder: (BuildContext context, int index) {
        var item = controller.finishedList[index];
        return ItemEmergency(item: item,
          onTap: (){
            EmergencyPickView.push(data: item);
          },
        );
      }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8,),

    )
    );
  }
}

