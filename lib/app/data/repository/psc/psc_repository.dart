import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/psc_entity.dart';

import '../../model/response/base_response.dart';

abstract class PscRepository{
  Future<BaseResponse<List<PscEntity>>> getPscByDistance(FormLocationPlace form);
}