import 'package:kreki119/app/data/model/form/form_complete_register.dart';
import 'package:kreki119/app/data/model/form/form_forgot_pass.dart';
import 'package:kreki119/app/data/model/form/form_login.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/sign_in_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';

import '../../model/form/Form_register.dart';
import '../../model/form/Form_update_profile.dart';
import '../../model/response/base_response.dart';
import '../../model/response/firebase_user_entity.dart';

abstract class AuthRemoteSource{

  Future<BaseResponse<FirebaseUserEntity>> loadCheckToken();

  Future<BaseResponse<UserMobileEntity>> loadSignIn(FormLogin form);

  Future<BaseResponse<UserMobileEntity>> loadGoogleSignIn(String idToken);

  Future<BaseResponse<AppUserEntity>> loadCompleteRegister(FormCompleteRegister form);

  Future<BaseResponse> createRegister(FormRegister form);

  Future<BaseResponse> updateProfile(FormUpdateProfile form, String id);

  Future<BaseResponse> forgotPassword(FormForgotPass form);

  Future<BaseResponse> updatePassword(String password, String id);
}