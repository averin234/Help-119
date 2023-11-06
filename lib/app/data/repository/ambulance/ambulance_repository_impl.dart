import 'package:get/get.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/ambulance_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/remote/ambulance/ambulance_remote_data.dart';
import 'package:kreki119/app/data/repository/ambulance/ambulance_repository.dart';

class AmbulanceRepositoryImpl extends AmbulanceRepository{

  final AmbulanceRemoteData remoteData = Get.find(tag: (AmbulanceRemoteData).toString());

  @override
  Future<BaseResponse<List<AmbulanceEntity>>> getAmbulanceByDistance(FormLocationPlace form) {
    return remoteData.loadAmbulanceByDistance(form);
  }

}