import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/psc_entity.dart';

import '../../model/response/base_response.dart';
import '../../model/response/hospital_entity.dart';

abstract class HospitalRemoteData{

  Future<BaseResponse<List<HospitalEntity>>> loadHospitalByDistance(FormLocationPlace form);
}