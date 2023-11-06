import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/psc_entity.dart';
import 'package:kreki119/app/data/model/response/hospital_entity.dart';

import '../../model/response/base_response.dart';

abstract class PscRemoteData{

  Future<BaseResponse<List<PscEntity>>> loadPscByDistance(FormLocationPlace form);
}