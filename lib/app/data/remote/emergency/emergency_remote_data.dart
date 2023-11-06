import 'package:kreki119/app/data/model/form/Form_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_pick_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/response/emergency_entity.dart';

import '../../model/form/form_update_emergency.dart';
import '../../model/response/base_response.dart';

abstract class EmergencyRemoteData{

  Future<BaseResponse<EmergencyEntity>> postEmergency(FormEmergency form);
  Future<BaseResponse<EmergencyEntity>> postAssignVolunteer(FormPickEmergency form);
  Future<BaseResponse<EmergencyEntity>> postEmergencyPickUp(FormPickEmergency form);
  Future<BaseResponse<EmergencyEntity>> updateEmergency(FormUpdateEmergency form);
  Future<BaseResponse<EmergencyEntity>> cancelEmergency(FormUpdateEmergency form);
  Future<BaseResponse<List<EmergencyEntity>>> loadEmergencies(FormSearch form);
  Future<BaseResponse<List<EmergencyEntity>>> loadEmergenciesNearby(FormSearch form);
  Future<BaseResponse<EmergencyEntity>> loadEmergencyById(String id);

}