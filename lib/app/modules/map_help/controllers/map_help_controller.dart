import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';

class MapHelpController extends BaseController {

  late GoogleMapController mapController;
  final markers = RxMap<String, Marker>().obs;

  final _user = RxList<AppUserEntity>.empty();
  List<AppUserEntity> get users => _user.toList();

  final ScrollController scrollController = ScrollController();


  @override
  void onInit() async{
    super.onInit();
    //TODO
  }


  @override
  void onReady() {
    super.onReady();
  }


  loadInitialPosition() async{
    var user = await getUserMobile();
    var position = await getLastPositionLocator();
    var myPos = LatLng(position?.latitude ?? user.latitude ??  0.0 ,
        position?.longitude ?? user.longitude ?? 0.0
    );
    CameraPosition cameraPosition = CameraPosition(target: myPos, zoom: 14);

    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    final marker = Marker(
        markerId: const MarkerId('My Place'),
        position: myPos,
      infoWindow: const InfoWindow(title: 'My Place',),
      icon: await bitmapDescriptorFromSvgAsset('ic_marker_victim.svg')
    );

    markers.value["MyPlace"] = marker;
  }

  loadUserData() async{

    var type = Get.arguments[2];

    if(type!=null){
      type as TypeVolunteer;
      var icon = await getBitmapByTypeVolunteer(type);

      FormSearch form = FormSearch()
        ..filterBy = "user_volunteer_type"
        ..value = type.value;

      callDataService(userRepo.getUsers(form), onSuccess: (value){
        var users = value.data;

        if(users!=null){
          _user(users);

          for(var item in users){
            Marker marker = Marker(
              markerId: MarkerId(item.sId??''),
              icon: icon,
              position: LatLng(item.myLocation?.coordinates?[1] ?? 0.0, item.myLocation?.coordinates?[0] ?? 0.0),
              infoWindow: InfoWindow(title: item.fullName ?? 'My Place',),
            );

            markers.value[item.fullName ?? 'User'] = marker;
          }
        }

      });
    }
  }


  @override
  void onClose() {
    //TODO
  }
}
