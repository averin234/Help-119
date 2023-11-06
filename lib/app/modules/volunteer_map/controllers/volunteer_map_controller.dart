import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:kreki119/app/core/base/base_map_controller.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/data/model/response/volunteer_entity.dart';
import 'package:kreki119/app/data/repository/volunteer/volunteer_repository.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';

import '../../../core/model/volunteer_status.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../data/model/form/form_location_place.dart';
import '../../../data/model/response/user_mobile_entity.dart';
import '../../../routes/app_pages.dart';
import '../../main/controllers/main_controller.dart';

class VolunteerMapController extends BaseMapController {


  final InAppUpdate inAppUpdate = InAppUpdate();

  get updateAvailable => null;

  Future<void> checkForUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    try {
      final updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.flexibleUpdateAllowed) {
        final latestVersion = updateInfo.availableVersionCode.toString();
        if (currentVersion != latestVersion) {
          showUpdateDialog();
        }
      }
    } catch (e) {
      print('Error checking for updates: $e');
    }
  }

  void showUpdateDialog() {
    Get.defaultDialog(
      title: 'Pembaruan Tersedia',
      content: Column(
        children: [
          AssetImageView(fileName: 'help119_update.png',
            height: 280,
            fit: BoxFit.contain,
          ),
          Text('Versi baru aplikasi tersedia. Apakah Anda ingin mengunduh pembaruan sekarang?', textAlign: TextAlign.center),
        ],
      ),

      confirm: InkWell(
        onTap: () async{
          await InAppUpdate.performImmediateUpdate();
          Get.back();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue
          ),
          child : Center(
            child : Text('Unduh Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),

    );
  }

  final VolunteerRepository repository = Get.find(tag: (VolunteerRepository).toString());
  final VolunteerRepository volunteerRepository = Get.find(tag: (VolunteerRepository).toString());
  final _data = RxList<VolunteerEntity>();
  final mainController = Get.find<MainController>();
  List<VolunteerEntity> get volunteerDataList => _data.toList();
  set volunteerDataList(List<VolunteerEntity> data) => _data(data);
  final _userMobile = UserMobileEntity().obs;
  UserMobileEntity get userMobile => _userMobile.value;
  setUserMobile(UserMobileEntity val) => _userMobile.value =val;

  @override
  void onInit() async{
    super.onInit();
    await mainController.loadUpdateLocation();
    await loadUpdateLocation();

  }

  @override
  Future<void> onReady() async {
    super.onReady();
    setUserMobile(await mainController.getUserMobile());
  }

  @override
  void onClose() {
    super.onClose();
  }


  @override
  TypeVolunteer getTypeVolunteer() {
    return TypeVolunteer.VOLUNTEER;
  }

  @override
  loadOnMapCreated({double? latitude, double? longitude}) async{
    getUserMobile().then((user) async{
      FormLocationPlace form = FormLocationPlace();
      form.latitude = latitude ?? user.latitude ?? 0;
      form.longitude = longitude?? user.longitude?? 0;

      var icon = await getBitmapByTypeVolunteer(TypeVolunteer.VOLUNTEER);

      callDataService(repository.getVolunteerByDistance(form),
          onSuccess: (response){
            var dataList = response.data;

            if(dataList!=null){
              volunteerDataList = dataList;

              if(dataList.isNotEmpty){
                for(var item in dataList){
                  logger.d("aap, mark location: (${item.latitude},${item.longitude})");
                  Marker marker = Marker(
                    markerId: MarkerId('${item.latitude},${item.longitude}'),
                    icon: icon,
                    position: LatLng(item.latitude ?? 0.0,
                        item.longitude ?? 0.0),
                    infoWindow: InfoWindow(title: item.fullName ?? 'My Psc',),
                  );

                  markers.value[item.fullName ?? 'Psc'] = marker;
                }
              }
            }
          }
      );
    });


  }

  checkVolunteerStatus() async{
    var user = await getUserMobile();
    callDataService(volunteerRepository.getVolunteerById(user.id.toString()),
        onSuccess: (response)async{
          var data = response.data;
          if(data==null){
            showConfirmDialog(Get.context, 'Anda belum jadi relawan, lanjutkan mendaftar?',
                positiveText: 'Ya, lanjutkan',
                negativeText: 'Tidak',
                onAccept: (){
                  Get.toNamed(Routes.UPGRADE_VOLUNTEER);
                }
            );
          } else {
            if(data.status == VolunteerStatus.WAITING.name){
              showMessage('Pengajuan Volunteer dalam tahap verifikasi admin');
            } else if(data.status == VolunteerStatus.ACCEPTED.name){
              if(mainController.userRole.group == 'user'){
                await mainController.loadProfile();
              }
              Get.toNamed(Routes.VOLUNTEER);
            } else if (data.status == VolunteerStatus.DEACTIVATED.name){
              showErrorMessage('Status volunteer tidak aktif, hubungi admin untuk info lebih lanjut');
            } else if(data.status == VolunteerStatus.REJECTED.name){
              showErrorMessage('Pengajuan Volunteer tidak di setujui admin');
            }
          }
        }
    );

  }
}
