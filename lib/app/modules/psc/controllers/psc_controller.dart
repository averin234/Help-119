import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_map_controller.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/data/model/response/psc_entity.dart';
import 'package:kreki119/app/data/repository/psc/psc_repository.dart';

import '../../../data/model/form/form_location_place.dart';

class PscController extends BaseMapController {

  final PscRepository repository = Get.find(tag: (PscRepository).toString());

  final _data = RxList<PscEntity>();
  List<PscEntity> get pscDataList => _data.toList();
  set pscDataList(List<PscEntity> data) => _data(data);

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
    return TypeVolunteer.PSC;
  }

  @override
  loadOnMapCreated({double? latitude, double? longitude}) async{
    getUserMobile().then((user)async{
      FormLocationPlace form = FormLocationPlace();
      form.latitude = latitude ?? user.latitude ?? 0;
      form.longitude = longitude ?? user.longitude ?? 0;

      getBitmapByTypeVolunteer(TypeVolunteer.PSC).then((icon) {
        callDataService(repository.getPscByDistance(form),
            onSuccess: (response){
              var dataList = response.data;

              if(dataList!=null){
                pscDataList = dataList;

                if(dataList.isNotEmpty){
                  for(var item in dataList){
                    Marker marker = Marker(
                      markerId: MarkerId('${item.latitude},${item.longitude}'),
                      icon: icon,
                      position: LatLng(item.latitude?.toDouble() ?? 0.0,
                          item.longitude?.toDouble() ?? 0.0),
                      infoWindow: InfoWindow(title: item.fullName ?? 'My Psc',),
                    );

                    markers.value[item.fullName ?? 'Psc'] = marker;
                  }
                }
              }
            }
        );
      });
    }, onError: (error){
      logger.d("aap, error: $error");
    });


  }
}
