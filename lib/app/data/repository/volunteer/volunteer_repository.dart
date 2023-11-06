import 'package:kreki119/app/data/model/response/volunteer_mobile.dart';

import '../../model/form/form_location_place.dart';
import '../../model/response/base_response.dart';
import '../../model/response/volunteer_entity.dart';


abstract class VolunteerRepository{

  Future<BaseResponse<VolunteerMobile>> getVolunteerById(String id);
  Future<BaseResponse<List<VolunteerEntity>>> getVolunteerByDistance(FormLocationPlace form);
}