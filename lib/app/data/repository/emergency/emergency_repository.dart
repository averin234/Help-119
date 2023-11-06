
import 'package:kreki119/app/core/model/emergency_status.dart';

import '../../model/form/Form_emergency.dart';
import '../../model/form/Form_pick_emergency.dart';
import '../../model/form/Form_search.dart';
import '../../model/form/form_update_emergency.dart';
import '../../model/response/base_response.dart';
import '../../model/response/emergency_entity.dart';

abstract class EmergencyRepository{

  Future<BaseResponse<EmergencyEntity>> createEmergency(FormEmergency form);
  Future<BaseResponse<EmergencyEntity>> createAssignVolunteer(FormPickEmergency form);
  Future<BaseResponse<EmergencyEntity>> createEmergencyPickUp(FormPickEmergency form);
  Future<BaseResponse<EmergencyEntity>> editEmergencyStatus(FormUpdateEmergency form);
  Future<BaseResponse<EmergencyEntity>> cancelEmergency(FormUpdateEmergency form);
  Future<BaseResponse<List<EmergencyEntity>>> getEmergencies(FormSearch form);
  Future<BaseResponse<List<EmergencyEntity>>> getEmergenciesNearby(FormSearch form);
  Future<BaseResponse<EmergencyEntity>> getEmergencyById(String id);

}