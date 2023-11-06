import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/volunteer_entity.dart';
import 'package:kreki119/app/data/model/response/volunteer_mobile.dart';

import '../../model/form/Form_id.dart';
import '../../model/response/base_response.dart';

abstract class VolunteerRemoteData{

  Future<BaseResponse<VolunteerMobile>> loadVolunteerById(FormId formId);
  Future<BaseResponse<List<VolunteerEntity>>> loadVolunteerByDistance(FormLocationPlace form);
}