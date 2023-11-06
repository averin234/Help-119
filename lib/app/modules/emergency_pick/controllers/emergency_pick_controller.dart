
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/data/model/form/Form_pick_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_task_accepted.dart';
import 'package:kreki119/app/data/model/form/Form_task_follow_up.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';
import 'package:kreki119/app/data/repository/asset/asset_repository.dart';
import 'package:kreki119/app/data/repository/user/user_repository.dart';
import 'package:kreki119/app/data/services/geolocator/util_location.dart';
import 'package:kreki119/app/modules/volunteer/controllers/volunteer_controller.dart';

import '../../../core/model/emergency_status.dart';
import '../../../data/model/form/Form_task_photo.dart';
import '../../../data/model/form/Form_task_reject.dart';
import '../../../data/model/response/assets_entity.dart';
import '../../../data/repository/emergency_mobile/emergency_repository.dart';
import '../../../routes/app_pages.dart';
import '../../main/controllers/main_controller.dart';

class EmergencyPickController extends BaseController {
  final MainController mainController = Get.find<MainController>();
  final EmergencyRepository repository = Get.find(tag: (EmergencyRepository).toString());
  final UserRepository userRepository = Get.find(tag: (UserRepository).toString());
  final AssetRepository assetsRepo = Get.find(tag: (AssetRepository).toString());

  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final _emergency = EmergencyMobileEntity().obs;
  EmergencyMobileEntity get emergency => _emergency.value;

  final _photosData = RxList<AssetsEntity>.empty();
  List<AssetsEntity> get photosData => _photosData.toList();

  late GoogleMapController mapController;
  final markers = RxMap<String, Marker>().obs;

  @override
  void onInit() async{
    super.onInit();

    var emergencyData = Get.arguments;
    if(emergencyData!=null){
      emergencyData as EmergencyMobileEntity;

      logger.d('aap, emergency: $emergencyData');
      _emergency.value = emergencyData;

      // var photos = emergencyData.photos;
      //
      // if(photos!=null){
      //   if(photos.isNotEmpty){
      //     List<AssetsEntity> assetList = List.empty();
      //     for(var item in photos){
      //       callDataService(assetsRepo.getImageById(item), onSuccess: (response){
      //         var photoData = response.data;
      //
      //         if(photoData!=null){
      //           assetList.add(photoData);
      //         }
      //       });
      //     }
      //     _photosData(assetList);
      //   }
      // }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



  loadInitialPosition() async{
    var position = await getLastPositionLocator();
    var myPos = LatLng(position?.latitude ?? 0.0 , position?.longitude ?? 0.0);
    CameraPosition cameraPosition = CameraPosition(target: myPos, zoom: 14);

    var icon = await getBitmapByTypeVolunteer(TypeVolunteer.VOLUNTEER);

    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    final marker = Marker(
        markerId: const MarkerId('My Place'),
        position: myPos,
        infoWindow: const InfoWindow(title: 'My Place',),
        icon: icon
    );

    markers.value["MyPlace"] = marker;


    loadVictimMarker(myPos);

  }

  loadVictimMarker(LatLng initialPos)async{

    var emergency = Get.arguments;
    emergency as EmergencyMobileEntity;

    var victimPos = LatLng(double.parse(emergency.latitudePasien.toString()),
        double.parse(emergency.longitudePasien.toString()));

    var icon = await getBitmapByTypeVolunteer(null);
    final marker2 = Marker(
        markerId: MarkerId(emergency.id ?? ''),
        position: victimPos,
        infoWindow: InfoWindow(title: '${emergency.fullName}',),
        icon: icon
    );

    markers.value["Victim Position"] = marker2;

    LatLngBounds bounds = await UtilLocation.getBoundsMap(initialPos, victimPos);
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    mapController.animateCamera(cameraUpdate);
  }
  
  pickUpStats(String desc)async{
    FormPickEmergency form = FormPickEmergency(
      emergencyId: emergency.id ?? '',
      userId: mainController.userMobile.id ?? '',
    );
    var user = await getUserMobile();
    FormTaskAccepted formTask = FormTaskAccepted(
      idRelawan: user.id,
      latitudeRelawan: user.latitude,
      longitudeRelawan: user.longitude,
      fcmRelawan: user.fcm,
      keterangan: desc
    );

    callDataService(repository.putAcceptedEmergency(formTask, emergency.id.toString()),
      onSuccess: (val){
        if(val.code==200){
          var volunteerController = Get.find<VolunteerController>();
          volunteerController.loadData();

          Get.until((route) => Get.currentRoute == Routes.VOLUNTEER);
        }

        if(val.error != null){
          showErrorMessage("Failed: ${val.error}");
        }
      }
    );
  }

  updateStats({required EmergencyStatus status, String? description})async{
    var canceledMessage = status == EmergencyStatus.CANCELED ?  'user canceled emergency' : 'no-stats';
    var user = await getUserMobile();

    switch(status){
      case EmergencyStatus.WAITING:
        break;
      case EmergencyStatus.ACCEPTED:
        break;
      case EmergencyStatus.REJECTED:
        FormTaskReject formTask = FormTaskReject(
            keterangan: '$description'
        );
        callDataService(repository.putRejectEmergency(formTask, emergency.id.toString()),
            onSuccess: _handleStat
        );
        break;
      case EmergencyStatus.ON_GOING:
        FormTaskPhoto formTask = FormTaskPhoto(
            photobyRelawan: ''
        );
        callDataService(repository.putOnGoingEmergency(formTask, emergency.id.toString()),
          onSuccess: _handleStat
        );
        break;
      case EmergencyStatus.FINISHED:
        FormTaskPhoto formTask = FormTaskPhoto(
            photobyRelawan: ''
        );
        callDataService(repository.putFinishEmergency(formTask, emergency.id.toString()),
            onSuccess: _handleStat
        );
        break;
      case EmergencyStatus.CANCELED:
        callDataService(repository.canceledEmergency(emergency.id.toString()),
            onSuccess: _handleStat
        );
        break;
      case EmergencyStatus.SCAM:
        // TODO: Handle this case.
        break;
      case EmergencyStatus.NEED_FOLLOW_UP:
        FormTaskFollowUp formTask = FormTaskFollowUp(
            keterangan: '$description'
        );
        callDataService(repository.putFollowUpEmergency(formTask, emergency.id.toString()),
            onSuccess: _handleStat
        );
        break;
    }
  }

  _handleStat(BaseResponse response){
    if(response.code! >= 200 && response.code! < 300){
      var volunteerController = Get.find<VolunteerController>();
      volunteerController.loadData();

      Get.until((route) => Get.currentRoute == Routes.VOLUNTEER);
    }
  }
}
