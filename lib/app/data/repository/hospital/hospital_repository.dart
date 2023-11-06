import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/hospital_entity.dart';

import '../../model/response/base_response.dart';

abstract class HospitalRepository{

  Future<BaseResponse<List<HospitalEntity>>> getHospitalByDistance(FormLocationPlace form);
}