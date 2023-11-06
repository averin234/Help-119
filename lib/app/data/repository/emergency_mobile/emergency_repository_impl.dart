import 'package:get/get.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/core/model/volunteer_status.dart';
import 'package:kreki119/app/data/model/form/Form_task.dart';
import 'package:kreki119/app/data/model/form/Form_task_accepted.dart';
import 'package:kreki119/app/data/model/form/Form_task_follow_up.dart';
import 'package:kreki119/app/data/model/form/Form_task_photo.dart';
import 'package:kreki119/app/data/model/form/Form_task_reject.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';
import 'package:kreki119/app/data/remote/emergency_mobile/emergency_remote_data.dart';
import 'package:kreki119/app/data/repository/emergency_mobile/emergency_repository.dart';

class EmergencyRepositoryImpl extends EmergencyRepository{

  final EmergencyRemoteData remoteData = Get.find(tag: (EmergencyRemoteData).toString());

  @override
  Future<BaseResponse> canceledEmergency(String id) {
    return remoteData.canceledEmergency(id);
  }

  @override
  Future<BaseResponse> createTaskEmergency(FormTask formTask) {
    return remoteData.postTaskEmergency(formTask);
  }

  @override
  Future<BaseResponse<EmergencyMobileEntity>> getTaskById(String id) {
    return remoteData.loadTaskById(id);
  }

  @override
  Future<BaseResponse<List<EmergencyMobileEntity>>> getTaskUser({EmergencyStatus? status}) {
    return remoteData.loadTaskUser();
  }

  @override
  Future<List<EmergencyMobileEntity>> getTaskVolunteer(EmergencyStatus status) async{

    var response = await remoteData.loadTaskVolunteer();

    var data = response.data;

    if(data == null){
      var responseVolunteer = await remoteData.loadTaskVolunteer();

      return responseVolunteer.data ?? [];
    }

    return data.where((element) => element.currentStatus == status.description).toList();
  }

  @override
  Future<BaseResponse> putAcceptedEmergency(FormTaskAccepted formTask, String id) async {
    return remoteData.putAcceptedEmergency(formTask, id);
  }

  @override
  Future<BaseResponse> putFinishEmergency(FormTaskPhoto formTask, String id) {
    return remoteData.putFinishEmergency(formTask, id);
  }

  @override
  Future<BaseResponse> putOnGoingEmergency(FormTaskPhoto formTask, String id) {
    return remoteData.putOnGoingEmergency(formTask, id);
  }

  @override
  Future<BaseResponse> putRejectEmergency(FormTaskReject formTask, String id) {
    return remoteData.putRejectEmergency(formTask, id);
  }

  @override
  Future<BaseResponse> putFollowUpEmergency(FormTaskFollowUp formTask, String id) {
    return remoteData.putFollowUpEmergency(formTask, id);
  }

  @override
  Future<List<EmergencyMobileEntity>> getTaskByDistance(FormLocationPlace form)async {

    var response = await remoteData.loadByLocation(form);
    var data = response.data;

    return data?.where((element) => element.currentStatus == EmergencyStatus.WAITING.description).toList() ?? [];
  }

}