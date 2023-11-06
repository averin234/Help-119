import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/app/modules/main/controllers/main_controller.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/model/volunteer_status.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../data/model/response/app_user_entity.dart';
import '../../../data/repository/emergency_mobile/emergency_repository.dart';
import '../../../data/repository/volunteer/volunteer_repository.dart';
import '../../../routes/app_pages.dart';

class VolunteerController extends BaseController with GetSingleTickerProviderStateMixin{
  final VolunteerRepository volunteerRepository = Get.find(tag: (VolunteerRepository).toString());
  final mainController = Get.find<MainController>();


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

  final EmergencyRepository emergencyRepository =
  Get.find(tag: (EmergencyRepository).toString());

  final RxList<EmergencyMobileEntity> _emergenciesController = RxList.empty();
  List<EmergencyMobileEntity> get emergencyList => _emergenciesController.toList();

  final RxList<EmergencyMobileEntity> _onGoingController = RxList.empty();
  List<EmergencyMobileEntity> get onGoingList => _onGoingController.toList();

  final RxList<EmergencyMobileEntity> _finishedController = RxList.empty();
  List<EmergencyMobileEntity> get finishedList => _finishedController.toList();

  final _firebaseUser = AppUserEntity().obs;
  AppUserEntity get userApp => _firebaseUser.value;
  setAppUser(AppUserEntity val) => _firebaseUser.value = val;

  final _userMobile = UserMobileEntity().obs;
  UserMobileEntity get userMobile => _userMobile.value;
  setUserMobile(UserMobileEntity val) => _userMobile.value =val;

  late TabController tabController;

  final _requestVolunteer = false.obs;
  bool get requestVolunteer => _requestVolunteer.value;
  set requestVolunteer(bool val) => _requestVolunteer.value = val;

  loadRequestVolunteer() async{
    var request = await preferenceManager.getBool(PreferenceManager.keyRequestVolunteer);
    requestVolunteer = request;
  }

  final _packageName = ''.obs;
  String get packageName => _packageName.value;

  late final DeviceInfoPlugin deviceInfo;

  @override
  void onInit()async{
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
    await mainController.loadUpdateLocation();
    deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _packageName.value = packageInfo.version;

    mainController.loadProfile();
  }

  @override
  onReady()async{

    setUserMobile(await mainController.getUserMobile());

    // await mainController.loadProfile();

    loadData();
  }

  loadData()async{
    await loadDataEmergency();
    await loadDataOnGoing();
    await loadDataOnFinished();
  }

  loadProfile()async{
    var user = await getUserMobile();
    await loadUserMobile(user.id.toString());
    setUserMobile(await getUserMobile());
  }

  loadDataEmergency()async{
    var user = await getUserMobile();
    FormLocationPlace form = FormLocationPlace(
      latitude: user.latitude,
      longitude: user.longitude
    );

    callDataService(emergencyRepository.getTaskByDistance(form), onSuccess: (response){
      _emergenciesController(response);
    });
  }

  loadDataOnGoing() async{
    callDataService(emergencyRepository.getTaskVolunteer(EmergencyStatus.ACCEPTED), onSuccess: (response){

      if(response.isEmpty){
        callDataService(emergencyRepository.getTaskVolunteer(EmergencyStatus.ON_GOING), onSuccess: (response){
          _onGoingController(response);
        });

        return;
      }
      _onGoingController(response);
    });
  }


  loadDataOnFinished()async{
    callDataService(emergencyRepository.getTaskVolunteer(EmergencyStatus.FINISHED), onSuccess: (response){
      _finishedController(response);
    });
  }

  @override
  void onClose() {
    //TODO
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
