import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/form/Form_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_pick_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/form/form_update_emergency.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/emergency_entity.dart';
import 'package:kreki119/app/data/remote/emergency/emergency_remote_data.dart';

import '../endpoint.dart';

class EmergencyRemoteDataImpl extends BaseRemoteSource implements EmergencyRemoteData{

  @override
  Future<BaseResponse<List<EmergencyEntity>>> loadEmergencies(FormSearch form) {
    var endpoint = Endpoint.emergencyList;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmergencyEntity>> loadEmergencyById(String id) {
    var endpoint = Endpoint.emergencyById(id);
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmergencyEntity>> postAssignVolunteer(FormPickEmergency form) {
    var endpoint = Endpoint.emergencyAssignVolunteer;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmergencyEntity>> postEmergency(FormEmergency form) {
    var endpoint = Endpoint.emergencyCreate;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmergencyEntity>> postEmergencyPickUp(FormPickEmergency form) {
    var endpoint = Endpoint.emergencyPickUp;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<EmergencyEntity>>> loadEmergenciesNearby(FormSearch form) {
    var endpoint = Endpoint.emergencyNearbyList;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmergencyEntity>> updateEmergency(FormUpdateEmergency form) {
    var endpoint = Endpoint.emergencyUpdateStatus;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmergencyEntity>> cancelEmergency(FormUpdateEmergency form) {
    var endpoint = Endpoint.emergencyCancel;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}