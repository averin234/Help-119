import 'package:get/get.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/remote/hospital/hospital_remote_data.dart';
import 'package:kreki119/app/data/model/response/hospital_entity.dart';
import 'package:kreki119/app/data/repository/hospital/hospital_repository.dart';

class HospitalRepositoryImpl extends HospitalRepository{

  final HospitalRemoteData remoteData = Get.find(tag: (HospitalRemoteData).toString());

  @override
  Future<BaseResponse<List<HospitalEntity>>> getHospitalByDistance(FormLocationPlace form) {
    return remoteData.loadHospitalByDistance(form);
  }

}