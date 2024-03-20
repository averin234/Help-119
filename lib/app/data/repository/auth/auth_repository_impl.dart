
import 'dart:convert';

import 'package:get/get.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/model/form/Form_register.dart';
import 'package:kreki119/app/data/model/form/form_forgot_pass.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/sign_in_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/generated/json/user_mobile_entity.g.dart';

import '../../../data/model/form/form_complete_register.dart';
import '../../../data/model/form/form_login.dart';
import '../../model/form/Form_update_profile.dart';
import '../../model/response/firebase_user_entity.dart';
import '../../remote/auth/auth_remote_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteSource remoteData = Get.find(tag: (AuthRemoteSource).toString());
  final PreferenceManager preferenceManager = Get.find(tag: (PreferenceManager).toString());

  @override
  Future<BaseResponse<FirebaseUserEntity>> getCheckToken() {
    return remoteData.loadCheckToken();
  }

  @override
  Future<BaseResponse<AppUserEntity>> getCompleteRegister(FormCompleteRegister form) {
    return remoteData.loadCompleteRegister(form);
  }

  @override
  Future<UserMobileEntity> getLogin(FormLogin form) async{
    var response = await remoteData.loadSignIn(form);
    var data = response.data;
    data?.code = response.code;
    var userMap = json.encode(response.data);
    preferenceManager.setString(PreferenceManager.keyUser, userMap);
    preferenceManager.setString(PreferenceManager.keyToken, data?.accessToken?? '');

    return data ?? UserMobileEntity();
  }

  @override
  Future<BaseResponse> getRegister(FormRegister form) {
    return remoteData.createRegister(form);
  }

  @override
  Future<UserMobileEntity> getLoginGoogle(String idToken) async{
    var response = await remoteData.loadGoogleSignIn(idToken);
    var data = response.data;
    data?.code = response.code;
    var userMap = json.encode(response.data);
    preferenceManager.setString(PreferenceManager.keyUser, userMap);
    preferenceManager.setString(PreferenceManager.keyToken, data?.accessToken?? '');

    return data ?? UserMobileEntity();
  }

  @override
  Future<BaseResponse> updateProfile(FormUpdateProfile form,) async{
    var user = await preferenceManager.getString(PreferenceManager.keyUser);
    var userData = UserMobileEntity.fromJson(json.decode(user));

    return remoteData.updateProfile(form, userData.id.toString());
  }

  @override
  Future<BaseResponse> postForgotPass(FormForgotPass form) {
    return remoteData.forgotPassword(form);
  }

  @override
  Future<BaseResponse> updatePassword(String password) async{
    var user = await preferenceManager.getString(PreferenceManager.keyUser);
    var userData = UserMobileEntity.fromJson(json.decode(user));

    return remoteData.updatePassword(password, userData.id.toString());
  }

  @override
  Future<UserMobileEntity> getLoginApple(String idToken) async{
    var response = await remoteData.loadGoogleSignIn(idToken);
    var data = response.data;
    data?.code = response.code;
    var userMap = json.encode(response.data);
    preferenceManager.setString(PreferenceManager.keyUser, userMap);
    preferenceManager.setString(PreferenceManager.keyToken, data?.accessToken?? '');

    return data ?? UserMobileEntity();
  }
}