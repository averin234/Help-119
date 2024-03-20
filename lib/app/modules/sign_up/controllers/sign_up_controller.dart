import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/data/model/form/Form_register.dart';
import 'package:kreki119/app/data/model/form/form_login.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/services/auth/email_auth.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../generated/json/firebase_user_entity.g.dart';
import '../../../data/local/preference/preference_manager.dart';
import '../../../data/model/response/firebase_user_entity.dart';
import '../../../data/model/response/user_mobile_entity.dart';
import '../../../data/repository/auth/auth_repository.dart';
import '../../../data/services/auth/firebase_user_provider.dart';
import '../../../routes/app_pages.dart';

class SignUpController extends BaseController {

  final AuthRepository repository = Get.find(tag: (AuthRepository).toString());

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TODO
  }

  signUpByEmail() async{
    showLoading();
    if(passController.text != rePassController.text){
      hideLoading();
      showErrorMessage("confirm password must be same");

      return;
    }

    if(!getValidationData(emailController.text)) return;
    if(!getValidationData(passController.text)) return;

    FormRegister form = FormRegister()
    ..email = emailController.text
    ..password = passController.text
    ..fullName = emailController.text.splitBefore("@");

    callDataService(authRepo.getRegister(form), onSuccess: (value){
      if(value.code! >= 200 && value.code! < 300 || value.statusCode! >=200 && value.statusCode! < 300) {
        loginUser(emailController.text, passController.text);
      } else {
        showErrorMessage('Error create user');
      }
    });

    var user = await createAccountWithEmail(emailController.text, passController.text);

    hideLoading();

    if(user!=null){
      var tokenResult = await user.getIdTokenResult(true);
      if(tokenResult.token!=null){
        callDataService(repository.getCheckToken(), onSuccess: _handleSignIn);

      }
    }
  }


  loginUser(String email, String password){

    if(!getValidationData(email)) return;
    if(!getValidationData(password)) return;

    FormLogin form = FormLogin()
      ..email = email
      ..password = password;
    callDataService(authRepo.getLogin(form), onSuccess: handleLogin);
  }

  handleLogin(UserMobileEntity val)async{

    if(val.accessToken.toString().isNotEmpty){
      preferenceManager.setString(PreferenceManager.keyToken, val.accessToken.toString())
          .then((value)async{
        loadUserMobile(val.id.toString()).then((value)async{
          if(val.verified == false){
            Get.toNamed(Routes.SIGN_UP_VERIFICATION);

            return;
          }
          Get.offAllNamed(Routes.MAIN, arguments: true);
        });
      });
    } else {

      if(val.message!=null){
        showErrorMessage('Failed: ${val.message}');
      } else {
        showErrorMessage('Failed login: Error code ${val.code}');
      }
    }

  }

  _handleSignIn(BaseResponse<FirebaseUserEntity> value)async{
    logger.d("userToken: ${$FirebaseUserEntityToJson(value.data!)}");
    await currentUser?.user?.getIdTokenResult(true);

    Get.offAllNamed(Routes.MAIN);
  }

  goToSignInView(){
    Get.back();
  }

  setUpdateData(){
    //TODO
  }
}
