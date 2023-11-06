import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:kreki119/app/core/view_bottom/view_add_contact.dart';
import 'package:kreki119/app/core/view_item/item_emergency.dart';
import 'package:kreki119/app/core/view_item/item_weather.dart';
import 'package:kreki119/app/core/widget/asset_image_view.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';
import 'package:ringtone_set/ringtone_set.dart';

import '../../../core/model/type_data.dart';
import '../../../core/view_bottom/view_contact.dart';
import '../../../core/view_item/item_contact.dart';
import '../../../core/view_item/item_emergency_korban.dart';
import '../../volunteer/views/volunteer_view.dart';
import '../../web_app/views/web_app_view.dart';
import '../model/aid_book.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../aid_book/views/aid_book_view.dart';

class HomeView extends BaseView<HomeController> {
  final updateController = Get.put(HomeController());

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      leading: null,
      title:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
      bottom: TabBar(
        controller: controller.tabController,
        tabs: const [
          Tab(
            text: 'Beranda',
          ),
          Tab(
            text: 'Permintaan',
          ),
          Tab(
            text: 'Buku saku',
          ),
          Tab(
            text: 'Relawan',
          ),
        ],
      ),
      actions: [
        Row(
          children: [
        IconButton(onPressed: () async{
          Get.toNamed(Routes.EMERGENCY_HISTORY);
        },
          icon: const Icon(Icons.history),
          tooltip: 'History',
        ),
            InkWell(
              onTap: () {
              Get.toNamed(Routes.EMERGENCY_HISTORY);
              },
              child : Text('History',style: cardSmallTagStyle,),),
            SizedBox(
              width: 10,
            ),
        ],),
      ],
    );
  }

  Widget badgeIcon() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        Align(
          alignment: Alignment.topRight,
          child: Icon(
            FontAwesome.warning,
            size: AppValues.iconSmallerSize,
            color: Colors.red,
          ),
        ),
        Icon(
          Icons.verified_user,
          size: AppValues.iconSize_28,
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    updateController.checkForUpdate();
    return TabBarView(
      controller: controller.tabController,
      children: [
        otherHelp(), requestedEmergency(),  AidBookView1(), relawan(),],
    );


  }
  Widget AidBookView1() {
    return RefreshIndicator(
        onRefresh: () => controller.mainController.onLoadEmergency(),
    child:
      Obx(()=> controller.aidBooks.isEmpty ?
    Container() :
    Column(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(right: 15, left: 15),
          child : Text('Buku Saku', style: descriptionTextStyle,),),
        Padding(padding: EdgeInsets.only(right: 15, left: 15),
          child:  Text('panduan untuk user yang ingin tahu tentang Gagal Jantung, Penurunan Kesadaran, Keracunan/Gigitan Ular, Tersedak, Kecelakaan lalu lintas',
            style: greyDarkContentTextStyle,),),
        Expanded(child: GridView.builder(
          itemCount: controller.aidBooks.length,
          padding: const EdgeInsets.symmetric(vertical: AppValues.padding),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppValues.padding,
            mainAxisSpacing: AppValues.padding,
            // mainAxisExtent: AppValues.heightContainerImage
          ),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.aidBooks[index];

            return itemAid(item);
          },
        ).paddingSymmetric(horizontal: AppValues.padding)) ],),),);

  }

  Widget relawan() {
    return RefreshIndicator(
      onRefresh: () => controller.mainController.onLoadEmergency(),
      child: SingleChildScrollView(child:
      Column(
        children: [
          Container(
              alignment: Alignment.center,
              child: Column(children: [
                Obx(()=>Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(() =>Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: controller.mainController.userRole.group == 'user' ? Colors.blue : (controller.mainController.userRole.group == 'Relawan' ? Colors.green : Colors.transparent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Status",
                                          style: TextStyle(fontSize: 14, color: Colors.white),
                                        ),
                                        Container(
                                          child: Text(
                                            ': ',
                                            style: TextStyle(fontSize: 14, color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          controller.mainController.userRole.group ?? 'User',
                                          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                          Row(children: [
                            const AssetImageView(fileName: 'logo_kreki1.png',
                              height: 40,
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
                      SizedBox(
                        height: 10,
                      ),
                      Obx(()=>CircleAvatar(
                        radius: AppValues.extraLargeRadius2,
                        backgroundImage: controller.mainController.userMobile.photo != null ?
                        NetworkImage(controller.mainController.userMobile.photo ?? '') : null,
                      ).marginOnly(right: 0),),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: [
                              SizedBox(
                                width: 70,
                                child:
                                Text("Nama",style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),),
                              Container(
                                child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                              Text(controller.mainController.userMobile.fullName ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                            ],),
                            Row(children: [
                              SizedBox(
                                width: 70,
                                child:
                                Text("KTP",style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),),
                              Container(
                                child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                              Text(controller.mainController.userMobile.ktp ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                            ],),
                            Row(children: [
                              SizedBox(
                                width: 70,
                                child:
                                Text("Gender",style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),),
                              Container(
                                child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                              Text(controller.mainController.userMobile.gender ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                            ],),
                            Row(children: [
                              SizedBox(
                                width: 70,
                                child:
                                Text("Alamat",style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),),
                              Container(
                                child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                              Text(controller.mainController.userMobile.address ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                            ],),
                            Row(children: [
                              SizedBox(
                                width: 70,
                                child:
                                Text("Kode POS",style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),),
                              Container(
                                child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                              Text(controller.mainController.userMobile.cityCode ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                            ],),
                            Row(children: [
                              SizedBox(
                                width: 70,
                                child:
                                Text("Email",style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),),
                              Container(
                                child: Text(': ',style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                              Text(controller.mainController.userMobile.email
                                  ?? 'User', style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                            ],),
                          ],),
                      ],),

                    ],),
                ),),
              ],)
          ),
          Obx(() => Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                if (controller.mainController.userMobile.photoKtp != null &&
                    controller.mainController.userMobile.photoKtp!.isNotEmpty)
                  Column(
                    children: [
                      Text('Verifikasi KTP', style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          controller.mainController.userMobile.photoKtp!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 320,
                        ),
                      ),
                    ],
                  )
                else
                  const AssetImageView(
                    fileName: 'belum_relawan.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                SizedBox(
                  height: 10,
                ),
                if (controller.mainController.userMobile.photoCertificate != null &&
                    controller.mainController.userMobile.photoCertificate!.isNotEmpty)
                  Column(
                    children: [
                      Text('Verifikasi Sertifikat', style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          controller.mainController.userMobile.photoCertificate!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 320,
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    "Anda Belum Menjadi Relawan Help 119",
                    textAlign: TextAlign.center,
                  ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
        ],
      ),),
    );
  }
  Widget requestedEmergency() {
    return RefreshIndicator(
      onRefresh: () => controller.mainController.onLoadEmergency(),
      child: Column(
        children: [
          // weatherWidget(),
          // SizedBox(
          //   height: 10,
          // ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        'Apakah anda butuh bantuan?',
                        style: descriptionTextStyle.copyWith(),
                      ),
                      Text(
                        'Klik tombol darurat untuk mencari pertolongan',
                        style: descriptionTextStyle.copyWith(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Obx(() => controller.mainController.emergencyList.isEmpty
                ? Column(
                    children: [
                      const AssetImageView(
                        fileName: 'help119.png',
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                      const Text(
                        'Belum ada permintaan darurat, klik tombol darurat untuk melakukan permintaan atau',
                        textAlign: TextAlign.center,
                      ).center(widthFactor: 2),
                      AppValues.padding.toInt().height,
                      AppButton(
                        onTap: () {
                          controller.mainController.onLoadEmergency();
                        },
                        textColor: AppColors.primary400,
                        text: 'Muat ulang',
                      ),
                    ],
                  )
                : ListView.builder(
              itemCount: controller.mainController.emergencyList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                  vertical: AppValues.smallPadding),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.mainController.emergencyList[index];
                // var photos = item.photos?.first ?? '';
                if (item.currentStatus == "finished") {
                  // Jika currentStatus adalah "finished", maka item akan diabaikan.
                  return SizedBox.shrink(); // Ini akan menghasilkan widget yang tidak terlihat
                } else {
                  return ItemEmergency_korban(
                    item: item,
                    onTap: () {
                      if (item.currentStatus ==
                          EmergencyStatus.WAITING.description) {
                        Get.toNamed(Routes.EMERGENCY_WAIT, arguments: item);
                      } else if (item.currentStatus == EmergencyStatus.ACCEPTED.description) {
                        Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
                      } else if (item.currentStatus == EmergencyStatus.NEED_FOLLOW_UP.description) {
                        Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
                      } else if (item.currentStatus == EmergencyStatus.ON_GOING.description) {
                        Get.toNamed(Routes.EMERGENCY_ACCEPT, arguments: item);
                      }
                    },
                  );
                }
              },
            )
            ).expand(),
          ),
        ],
      ),
    );
  }

  Widget weatherWidget() {
    return Obx(() => ItemWeather(
          item: controller.mainController.weather,
          tapWeather: () {
            controller.mainController.loadWeather();
          },
        ));
  }

  Widget headerWidget() {
    return Container(
      color: AppColors.primary400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hai, User',
                style: cardTitleStyle.copyWith(color: AppColors.textColorWhite),
              ),
              Text(
                'Apakah anda butuh bantuan?',
                style: descriptionTextStyle.copyWith(
                    color: AppColors.textColorWhite),
              ),
              Text(
                'Klik tombol darurat untuk mencari pertolongan',
                style: contentTextStyle,
              ),
            ],
          ),
          const CircleAvatar(
            radius: AppValues.circularImageSize_30,
            backgroundColor: AppColors.primary300,
            child: CircleAvatar(
              radius: AppValues.largeRadius,
              backgroundColor: AppColors.neutral100,
              child: Text(
                'U',
                style: titleStyle,
              ),
            ),
          )
        ],
      ).paddingAll(AppValues.padding),
    );
  }

  Widget otherHelp() {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10)
          ),
          child:
        weatherWidget(),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Menu Bantuan',
          style: descriptionTextStyle,
        ),
        Text(
          'Anda dapat menggunakan Menu Bantuan untuk membantu dalam keadaan darurat',
          style: greyDarkContentTextStyle,
        ),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppValues.smallPadding,
              mainAxisSpacing: AppValues.smallPadding),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          children: [
            itemHelp('PSC', 'ic_psc.png').onTap(() {
              Get.toNamed(Routes.PSC);
            }),
            itemHelp('Ambulance', 'ic_ambulance.svg').onTap(() {
              Get.toNamed(Routes.AMBULANCE);
            }),
            itemHelp('Relawan', 'ic_volunteer.svg').onTap(() {
              Get.bottomSheet(
                Container(
                    height: 250,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(0.0)),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Menu Relawan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                         InkWell(
                           onTap: () {
                             Get.back();
                             Get.toNamed(Routes.VOLUNTEER_MAP);

                           },
                           child:
                         Container(
                         padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
                         decoration: BoxDecoration(
                           color: AppColors.warning100,
                           borderRadius: BorderRadius.circular(10),
                           boxShadow: [
                             BoxShadow(
                               color: AppColors.success50,
                               spreadRadius: 2,
                               blurRadius: 4,
                               offset: Offset(0, 2), // changes position of shadow
                             ),
                           ],
                         ),
                         child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               const AssetImageView(fileName: 'relawan_sekitar.png',
                                 height: 40,
                                 fit: BoxFit.contain,
                               ),
                           SizedBox(
                             width: 20,
                           ),
                               Expanded(child:
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text('Relawan Disekitar', style: TextStyle(color: AppColors.success700, fontWeight: FontWeight.bold)),
                                   Text('Memberitahu Relawan - Relawan disekitar anda dengan Radius 5 KM. ', style: TextStyle(color: AppColors.success700, fontSize: 13)),
                                 ],),),
                         ]) ,
                       ),),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                            controller.checkVolunteerStatus();
                          },
                          child:
                        Container(
                          padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.info200,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.info100,
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const AssetImageView(fileName: 'relawan_solo.png',
                                  height: 40,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Beranda Relawan', style: TextStyle(color:  AppColors.info700, fontWeight: FontWeight.bold)),
                                    Text('Jadikan Anda Relawan atau Menjadi Relawan untuk menolong Pertolongan Darurat ', style: TextStyle(color:  AppColors.info700, fontSize: 13)),
                                  ],),),
                          ])
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        // AssetImageView(fileName: 'gunung.jpg',
                        //   width: 170,
                        //   fit: BoxFit.contain,
                        // ),
                      ],
                    )
                ),
                ignoreSafeArea: isBlank,
                isDismissible: true,
                enableDrag: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );

            }),
            itemHelp('RS & Faskes', 'ic_hospital.svg').onTap(() {
              Get.toNamed(Routes.HOSPITAL);
            }),
            itemHelp('SehatPedia', 'ic_sehatpedia.png').onTap(() {
              openUrl(
                  "https://play.google.com/store/apps/details?id=id.sehatpedia.apps&hl=en&gl=US");
            }),
            itemHelp('Informasi', 'logo_kreki.png').onTap(() {
              Get.toNamed(Routes.INFORMASI_HEKP119);
            }),
          ],
        ).marginOnly(top: AppValues.padding),
        emergencyContact(),
      ],
    ).marginAll(AppValues.padding);
  }

  Widget itemHelp(String title, String imageUrl) {
    return Container(
      decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageUrl.isEmpty
              ? const Placeholder(
                  fallbackHeight: AppValues.iconLargeSize,
                ).marginOnly(
                  left: AppValues.padding,
                  right: AppValues.padding,
                  bottom: AppValues.smallPadding)
              : AssetImageView(
                  fileName: imageUrl,
                  height: AppValues.iconHomeSize,
                  width: AppValues.iconHomeSize,
                ).center(),
          AppValues.smallPadding.toInt().height,
          Text(title)
        ],
      ).center(),
    );
  }

  Widget emergencyContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Kontak Darurat',
          style: descriptionTextStyle,
        ),
        Text(
          'Anda dapat menambahkan kontak darurat untuk membantu dalam keadaan darurat',
          style: greyDarkContentTextStyle,
        ),
        AppValues.padding.toInt().height,
        Container(
          decoration:
              boxDecorationRoundedWithShadow(AppValues.radius_12.toInt()),
          padding: const EdgeInsets.all(AppValues.smallPadding),
          child: Row(
            children: [
              Container(
                decoration: boxDecorationWithRoundedCorners(),
                child: const Icon(
                  Icons.person_add_alt_1,
                  color: AppColors.secondary500,
                ),
              ),
              AppValues.padding.toInt().width,
              Text(
                'Tambah Kontak Darurat',
                style: cardTagStyle,
              )
            ],
          ),
        ).onTap(() {
          openBottomSheet(
              ViewAddContact(onClickSubmit: controller.onAddContact));
        }),
        AppValues.padding.toInt().height,
        Obx(() => controller.contacts.isEmpty
            ? Container()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppValues.smallPadding,
                    mainAxisSpacing: AppValues.smallPadding,
                    childAspectRatio: 3 / 1),
                itemCount: controller.contacts.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                itemBuilder: (context, index) {
                  var item = controller.contacts[index];

                  return ItemContact(item: item).onTap(() {
                    openBottomSheet(ViewContact(
                      item: item,
                      onTapCall: (phone) {
                        openCall(phone);
                      },
                    ));
                  });
                }))
      ],
    ).paddingSymmetric(vertical: AppValues.padding);
  }
  Widget itemAid(AidBook item){
    final assetsAudio = AudioPlayer(playerId: 'player');
    final source = AssetSource(item.data??'');

    return Container(
      decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
      child: Stack(
        alignment: const Alignment(0,-0.25),
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AssetImageView(fileName: item.icon ?? '',
                height: AppValues.iconExtraLargerSize, width: AppValues.iconHomeSize,).center(),
              AppValues.smallPadding.toInt().height,
              Container(
                  color: AppColors.neutral100,
                  child: Text(item.name?? '', textAlign: TextAlign.center,).paddingAll(AppValues.smallPadding)
              )
            ],
          ).onTap((){onTapItem(item, assetsAudio, source);}),

          item.type == TypeData.AUDIO.value ? Obx(()=>playModeIcon(controller.playMode, item, assetsAudio, source))
              : Container()

        ],
      ),
    );
  }

  Widget playModeIcon(PlayerState state, AidBook item, AudioPlayer assetsAudio, AssetSource source){

    var iconData = Icons.circle_outlined;

    switch(state){
      case PlayerState.stopped:
        iconData = Icons.play_circle_filled_rounded;
        break;
      case PlayerState.playing:
        iconData = Icons.pause_circle_filled_rounded;
        break;
      case PlayerState.paused:
        iconData = Icons.play_circle_filled_rounded;
        break;
      case PlayerState.completed:
        iconData = Icons.play_circle_filled_rounded;
        break;
    }

    return Icon(iconData, size: AppValues.iconHomeSize,)
        .onTap((){onTapItem(item, assetsAudio, source);});

  }

  onTapItem(AidBook item, AudioPlayer assetsAudio, AssetSource source)async{
    if(item.type == TypeData.AUDIO.value){
      logger.d('aap, state: ${assetsAudio.state.name}');
      switch(assetsAudio.state){
        case PlayerState.stopped:
          await assetsAudio.play(source ,mode: PlayerMode.mediaPlayer);
          break;
        case PlayerState.playing:
          assetsAudio.pause();
          break;
        case PlayerState.paused:
          await assetsAudio.play(source ,mode: PlayerMode.mediaPlayer);
          break;
        case PlayerState.completed:
          assetsAudio.stop();
          break;
      }

      assetsAudio.onPlayerStateChanged.listen((event) {
        controller.setPlayerState(event);
        logger.d('aap, state: ${event.name}');
      });

    } else{
      WebAppView.push(url: item.data ?? '', title: item.name, isLocalFile: true);
    }
  }
}
