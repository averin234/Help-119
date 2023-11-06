import 'package:kreki119/app/data/model/form/Form_task.dart';
import 'package:kreki119/app/data/model/form/Form_task_accepted.dart';
import 'package:kreki119/app/data/model/form/Form_task_follow_up.dart';
import 'package:kreki119/app/data/model/form/Form_task_photo.dart';
import 'package:kreki119/app/data/model/form/Form_task_reject.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';

import '../../model/response/base_response.dart';

abstract class EmergencyRemoteData{

  Future<BaseResponse<List<EmergencyMobileEntity>>> loadAllEmergency();
  Future<BaseResponse<List<EmergencyMobileEntity>>> loadTaskUser();
  Future<BaseResponse<List<EmergencyMobileEntity>>> loadTaskVolunteer();
  Future<BaseResponse<EmergencyMobileEntity>> loadTaskById(String id);
  Future<BaseResponse<List<EmergencyMobileEntity>>> loadByLocation(FormLocationPlace form);
  Future<BaseResponse> postTaskEmergency(FormTask formTask);
  Future<BaseResponse> putAcceptedEmergency(FormTaskAccepted formTask, String id);
  Future<BaseResponse> putOnGoingEmergency(FormTaskPhoto formTask, String id);
  Future<BaseResponse> putFinishEmergency(FormTaskPhoto formTask, String id);
  Future<BaseResponse> putRejectEmergency(FormTaskReject formTask, String id);
  Future<BaseResponse> putFollowUpEmergency(FormTaskFollowUp formTask, String id);
  Future<BaseResponse> canceledEmergency(String id);




}