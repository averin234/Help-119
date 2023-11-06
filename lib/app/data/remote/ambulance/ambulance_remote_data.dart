import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/ambulance_entity.dart';

import '../../model/response/base_response.dart';

abstract class AmbulanceRemoteData{

  Future<BaseResponse<List<AmbulanceEntity>>> loadAmbulanceByDistance(FormLocationPlace form);
}