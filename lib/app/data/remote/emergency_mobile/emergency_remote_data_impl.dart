import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/form/Form_id.dart';
import 'package:kreki119/app/data/model/form/Form_task.dart';
import 'package:kreki119/app/data/model/form/Form_task_accepted.dart';
import 'package:kreki119/app/data/model/form/Form_task_follow_up.dart';
import 'package:kreki119/app/data/model/form/Form_task_photo.dart';
import 'package:kreki119/app/data/model/form/Form_task_reject.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';
import 'package:kreki119/app/data/remote/emergency_mobile/emergency_remote_data.dart';

import '../endpoint.dart';

class EmergencyRemoteDataImpl extends BaseRemoteSource implements EmergencyRemoteData{
  @override
  Future<BaseResponse> canceledEmergency(String id) {
    var endpoint = "${Endpoint.emergencyMobileCanceled}/$id";
    FormId formId = FormId()..id = id;
    var dioCall = dioClient.put(endpoint,);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmergencyMobileEntity>> loadTaskById(String id) {
    var endpoint = "${Endpoint.emergencyMobile}/$id";
    FormId formId = FormId()..id = id;
    var dioCall = dioClient.get(endpoint, queryParameters: formId.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<EmergencyMobileEntity>>> loadTaskUser() {
    var endpoint = Endpoint.emergencyMobileTaskUser;
    var dioCall = dioClient.get(endpoint,);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<EmergencyMobileEntity>>> loadTaskVolunteer() {
    var endpoint = Endpoint.emergencyMobileTaskVolunteer;
    var dioCall = dioClient.get(endpoint,);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> postTaskEmergency(FormTask formTask) {
    var endpoint = Endpoint.emergencyMobileCreate;
    var dioCall = dioClient.post(endpoint, data: formTask.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> putAcceptedEmergency(FormTaskAccepted formTask, String id) {
    var endpoint = "${Endpoint.emergencyMobileAccepted}/$id";
    FormId formId = FormId()..id = id;
    var dioCall = dioClient.put(endpoint,
        data: formTask.toJson()
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> putFinishEmergency(FormTaskPhoto formTask, String id) {
    var endpoint = "${Endpoint.emergencyMobileFinish}/$id";
    FormId formId = FormId()..id = id;
    var dioCall = dioClient.put(endpoint,
        data: formTask.toJson()
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> putOnGoingEmergency(FormTaskPhoto formTask, String id) {
    var endpoint = "${Endpoint.emergencyMobileOnGoing}/$id";
    FormId formId = FormId()..id = id;
    var dioCall = dioClient.put(endpoint,
        data: formTask.toJson()
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> putRejectEmergency(FormTaskReject formTask, String id) {
    var endpoint = "${Endpoint.emergencyMobileReject}/$id";
    FormId formId = FormId()..id = id;
    var dioCall = dioClient.put(endpoint,
        data: formTask.toJson()
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<BaseResponse<List<EmergencyMobileEntity>>> loadAllEmergency() {
    var endpoint = Endpoint.emergencyMobile;
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> putFollowUpEmergency(FormTaskFollowUp formTask, String id) {
    var endpoint = "${Endpoint.emergencyMobileFollowUp}/$id";
    FormId formId = FormId()..id = id;
    var dioCall = dioClient.put(endpoint,
        data: formTask.toJson()
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<EmergencyMobileEntity>>> loadByLocation(FormLocationPlace form) {
    var endpoint = Endpoint.emergencyMobileByDistance;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }


}