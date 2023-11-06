import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/data/model/response/hospital_entity.dart';
import 'package:kreki119/app/data/repository/hospital/hospital_repository.dart';

import '../../../core/base/base_map_controller.dart';
import '../../../data/model/form/form_location_place.dart';

class HospitalController extends BaseMapController {

  final HospitalRepository repository = Get.find(tag: (HospitalRepository).toString());

  final _data = RxList<HospitalEntity>();
  List<HospitalEntity> get hospitalDataList => _data.toList();
  set hospitalDataList(List<HospitalEntity> value) => _data(value);

  final _selectedHospital = ''.obs;
  String get selectedHospital => _selectedHospital.value;
  set selectedHospital(String val) => _selectedHospital.value = val;

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
    return TypeVolunteer.HOSPITAL;
  }

  @override
  loadOnMapCreated({double? latitude, double? longitude}) async{
    getUserMobile().then((user)async{
      FormLocationPlace form = FormLocationPlace();
      form.latitude = latitude ?? user.latitude ??  0;
      form.longitude = longitude ?? user.longitude ?? 0;

      getBitmapByTypeVolunteer(TypeVolunteer.HOSPITAL).then((icon){
        callDataService(repository.getHospitalByDistance(form),
            onSuccess: (response){
              var dataList = response.data;

              if(dataList!=null){
                hospitalDataList = dataList;
                if(dataList.isNotEmpty){
                  for(var item in dataList){
                    Marker marker = Marker(
                      markerId: MarkerId('${item.latitude},${item.longitude}'),
                      icon: icon,
                      position: LatLng(item.latitude?.toDouble() ?? 0.0,
                          item.longitude?.toDouble() ?? 0.0),
                      infoWindow: InfoWindow(title: item.name ?? 'My Hospital',),
                    );

                    markers.value[item.name ?? 'Hospital'] = marker;
                  }
                }
              }
            }, onError: (error){
              logger.d("aap, error: $error");
            }
        );
      });


    });

  }

}
