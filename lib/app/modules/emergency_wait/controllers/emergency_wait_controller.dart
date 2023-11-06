import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/data/model/form/form_update_emergency.dart';
import 'package:kreki119/app/data/model/response/emergency_entity.dart';
import 'package:kreki119/app/data/repository/emergency_mobile/emergency_repository.dart';
import 'package:kreki119/app/modules/main/controllers/main_controller.dart';

import '../../../data/model/response/emergency_mobile_entity.dart';
import '../../../routes/app_pages.dart';


class EmergencyWaitController extends BaseController {

  final MainController mainController = Get.find<MainController>();
  final EmergencyRepository repository = Get.find(tag: (EmergencyRepository).toString());

  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final _emergency = EmergencyMobileEntity().obs;
  EmergencyMobileEntity get emergency => _emergency.value;

  late GoogleMapController mapController;
  final markers = RxMap<String, Marker>().obs;

  @override
  void onInit() {
    super.onInit();

    var emergencyData = Get.arguments;
    if(emergencyData!=null){
      emergencyData is EmergencyMobileEntity;
      _emergency.value = emergencyData;
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

    var icon = await getBitmapByTypeVolunteer(null);

    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    final marker = Marker(
        markerId: const MarkerId('My Place'),
        position: myPos,
        infoWindow: const InfoWindow(title: 'My Place',),
        icon: icon
    );

    markers.value["MyPlace"] = marker;

  }

  updateStats({required EmergencyStatus status, String? description}){
    callDataService(repository.canceledEmergency(emergency.id.toString()),
      onSuccess: (response){
        if(response.code == 200){
          mainController.onLoadEmergency();
          Get.until((route) => Get.currentRoute == Routes.MAIN);
        }

        if(response.error !=null){
          showErrorMessage('${response.error}');
        }

      }
    );
  }
}
