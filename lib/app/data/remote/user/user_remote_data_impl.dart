import 'package:dio/dio.dart';
import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/form/FormUpgradeVolunteer.dart';
import 'package:kreki119/app/data/model/form/Form_add_contact.dart';
import 'package:kreki119/app/data/model/form/Form_add_document.dart';
import 'package:kreki119/app/data/model/form/Form_notification_subscribe.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/form/form_update_location.dart';
import 'package:kreki119/app/data/model/response/app_notification_entity.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/app/data/remote/user/user_remote_data.dart';

import '../../model/response/base_response.dart';
import '../endpoint.dart';

class UserRemoteDataImpl extends BaseRemoteSource implements UserRemoteData{

  @Deprecated("old version")
  @override
  Future<BaseResponse<AppUserEntity>> loadMyProfile() {
    var endpoint = Endpoint.userInfo;

    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  @Deprecated("old version")
  Future<BaseResponse<AppUserEntity>> loadUserById(String id) {
    var endpoint = Endpoint.userById(id);

    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> postContact(FormAddContact form) {
    var endpoint = Endpoint.addContact;

    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> postSubscribeNotification(
      FormNotificationSubscribe form) {
    var endpoint = Endpoint.userSubscribeNotification;
    var dioCall = dioClient.put(endpoint, data: form.toJson(),);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  AppNotificationEntity parseAppNotification(Response<dynamic> response){
    return AppNotificationEntity.fromJson(response.data);
  }

  @override
  Future<BaseResponse> postUpdateLocation(FormUpdateLocation form) {
    var endpoint = "${Endpoint.userUpdateLocation}/${form.id}";

    var dioCall = dioClient.put(endpoint, data: form.toJson(),);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<AppUserEntity>> postUpgradeVolunteer(FormUpgradeVolunteer form) {
    var endpoint = Endpoint.userUpgradeVolunteer;

    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  BaseResponse<AppUserEntity> _parseEntity(Response<dynamic> response){
    return parseBaseEntity(response);
  }

  @Deprecated("old version")
  @override
  Future<BaseResponse<List<AppUserEntity>>> loadUsers(FormSearch form) {
    var endpoint = Endpoint.users;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserMobileEntity>> loadUserMobile(String id) {
    var endpoint = "${Endpoint.userMobileById}/$id";

    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> addDocumentVolunteer(String id, FormAddDocument formAdd) {
    var endpoint = Endpoint.addDocumentVolunteer;

    var dioCall = dioClient.post(endpoint,
      data: formAdd.toJson()
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<ContactEntity>>> loadContacts() {
    var endpoint = Endpoint.addContact;

    var dioCall = dioClient.get(endpoint,);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }


}