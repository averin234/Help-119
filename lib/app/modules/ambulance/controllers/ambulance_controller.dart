import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_map_controller.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/ambulance_entity.dart';
import 'package:kreki119/app/data/repository/ambulance/ambulance_repository.dart';
import 'package:nb_utils/nb_utils.dart';

class AmbulanceController extends BaseMapController {

  final AmbulanceRepository repository = Get.find(tag: (AmbulanceRepository).toString());

  final _data = RxList<AmbulanceEntity>();
  List<AmbulanceEntity> get ambulanceDataList => _data.toList();
  set ambulanceDataList(List<AmbulanceEntity> data) => _data(data);

  @override
  void onInit() async{
    super.onInit();

    await loadUpdateLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  @override
  TypeVolunteer getTypeVolunteer() {
    return TypeVolunteer.AMBULANCE;
  }

  @override
  loadOnMapCreated({double? latitude, double? longitude}) async{

    getUserMobile().then((user)async{
      FormLocationPlace form = FormLocationPlace();
      form.latitude = latitude ?? 0;
      form.longitude = longitude ?? 0;

      getBitmapByTypeVolunteer(TypeVolunteer.AMBULANCE).then((icon) {
        callDataService(repository.getAmbulanceByDistance(form),
            onSuccess: (response){
              var dataList = response.data;

              if(dataList!=null){
                ambulanceDataList = dataList;

                if(dataList.isNotEmpty){
                  for(var item in dataList){
                    Marker marker = Marker(
                      markerId: MarkerId('${item.latitude},${item.longitude}'),
                      icon: icon,
                      position: LatLng(item.latitude ?? 0.0, item.longitude ?? 0.0),
                      infoWindow: InfoWindow(title: item.name ?? 'Ambulance',),
                    );

                    markers.value[item.name ?? 'Ambulans'] = marker;
                  }
                }
              }
            }
        );
      }, onError: (error){
        logger.d("aap, error: $error");
      }
      );
    });



  }
}
