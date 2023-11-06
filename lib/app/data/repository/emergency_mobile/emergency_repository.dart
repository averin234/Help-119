import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/data/model/form/Form_task_follow_up.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';

import '../../model/form/Form_task.dart';
import '../../model/form/Form_task_accepted.dart';
import '../../model/form/Form_task_photo.dart';
import '../../model/form/Form_task_reject.dart';
import '../../model/response/base_response.dart';
import '../../model/response/emergency_mobile_entity.dart';

abstract class EmergencyRepository{

  Future<BaseResponse<List<EmergencyMobileEntity>>> getTaskUser();
  Future<List<EmergencyMobileEntity>> getTaskVolunteer(EmergencyStatus status);
  Future<List<EmergencyMobileEntity>> getTaskByDistance(FormLocationPlace form);
  Future<BaseResponse<EmergencyMobileEntity>> getTaskById(String id);
  Future<BaseResponse> createTaskEmergency(FormTask formTask);
  Future<BaseResponse> putAcceptedEmergency(FormTaskAccepted formTask, String id);
  Future<BaseResponse> putOnGoingEmergency(FormTaskPhoto formTask, String id);
  Future<BaseResponse> putFinishEmergency(FormTaskPhoto formTask, String id);
  Future<BaseResponse> putRejectEmergency(FormTaskReject formTask, String id);
  Future<BaseResponse> putFollowUpEmergency(FormTaskFollowUp formTask, String id);
  Future<BaseResponse> canceledEmergency(String id);
}