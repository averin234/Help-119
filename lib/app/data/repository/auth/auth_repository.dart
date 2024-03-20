import 'package:kreki119/app/data/model/form/form_forgot_pass.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/sign_in_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';

import '../../../data/model/form/form_complete_register.dart';
import '../../../data/model/form/form_login.dart';
import '../../model/form/Form_register.dart';
import '../../model/form/Form_update_profile.dart';
import '../../model/response/firebase_user_entity.dart';

abstract class AuthRepository{
  Future<BaseResponse<FirebaseUserEntity>> getCheckToken();
  Future<BaseResponse<AppUserEntity>> getCompleteRegister(FormCompleteRegister form);

  Future<UserMobileEntity> getLogin(FormLogin form);
  Future<BaseResponse> getRegister(FormRegister form);
  Future<UserMobileEntity> getLoginGoogle(String idToken);
  Future<UserMobileEntity> getLoginApple(String idToken);
  Future<BaseResponse> updateProfile(FormUpdateProfile form);
  Future<BaseResponse> postForgotPass(FormForgotPass form);
  Future<BaseResponse> updatePassword(String password);
}