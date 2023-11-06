import 'package:kreki119/app/data/model/form/form_location_place.dart';

import '../../model/response/base_response.dart';

abstract class PlaceRemoteData{

  Future<BaseResponse<List<dynamic>>> loadAllPlace(FormLocationPlace form);
}