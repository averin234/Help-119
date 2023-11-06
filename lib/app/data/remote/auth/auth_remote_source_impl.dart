import 'package:dio/dio.dart';
import 'package:kreki119/app/data/model/form/form_forgot_pass.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';

import '../../../core/base/base_remote_source.dart';
import '../../../data/model/form/form_complete_register.dart';
import '../../../data/model/form/form_login.dart';
import '../../model/form/Form_register.dart';
import '../../model/form/Form_update_profile.dart';
import '../../model/response/firebase_user_entity.dart';
import '../endpoint.dart';
import 'auth_remote_source.dart';

class AuthRemoteSourceImpl extends BaseRemoteSource implements AuthRemoteSource{
  @override
  Future<BaseResponse<FirebaseUserEntity>> loadCheckToken() {
    var endpoint = Endpoint.checkToken;
    var dioCall = dioClient.post(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  BaseResponse<FirebaseUserEntity> _parseEntity(Response<dynamic> response){
    return BaseResponse.fromJson(response.data);
  }

  UserMobileEntity _parseLogin(Response<dynamic> response){
    return UserMobileEntity.fromJson(response.data);
  }

  @override
  Future<BaseResponse<AppUserEntity>> loadCompleteRegister(FormCompleteRegister form) {
    var endpoint = Endpoint.completeRegister;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserMobileEntity>> loadSignIn(FormLogin form) {
    var endpoint = Endpoint.login;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> createRegister(FormRegister form) {
    var endpoint = Endpoint.register;
    var dioCall = dioClient.post(endpoint, data: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserMobileEntity>> loadGoogleSignIn(String idToken) {
    var endpoint = Endpoint.loginGoogle;
    var dioCall = dioClient.post(endpoint, data: {'authorization' : idToken });

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<BaseResponse> updateProfile(FormUpdateProfile form, String id) {
    var endpoint = Endpoint.updateProfile;

    var dioCall = dioClient.put(endpoint, queryParameters: {"id": id},
        data: form.toJson()
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> forgotPassword(FormForgotPass form) {
    var endpoint = "${Endpoint.forgotPass}/${form.email}";
    var dioCall = dioClient.post(endpoint, );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> updatePassword(String password, String id) {
    var endpoint = '${Endpoint.updatePassword}/$id';

    var formPassword = {
      "password": password
    };

    var dioCall = dioClient.put(endpoint,
        data: formPassword
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}