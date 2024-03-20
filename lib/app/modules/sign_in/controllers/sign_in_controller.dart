import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/data/model/form/form_forgot_pass.dart';
import 'package:kreki119/app/data/services/auth/auth_util.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/local/preference/preference_manager.dart';
import '../../../data/model/form/form_login.dart';
import '../../../data/model/response/user_mobile_entity.dart';
import '../../../data/repository/auth/auth_repository.dart';
import '../../../data/services/auth/firebase_user_provider.dart';


class SignInController extends BaseController {

  final AuthRepository repository = Get.find(tag: (AuthRepository).toString());
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final resetEmailController = TextEditingController();

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

  signInEmail() async{
    if(currentUser?.loggedIn==true){
      await signOut();
    }

    loginUser(emailController.text, passController.text);
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

  Future<void> signInApple() async {
    if (currentUser?.loggedIn == true) {
      await signInWithApple();
    }
    showLoading();
    try {
      final UserCredential userCredential = await appleSignIn();
      final User? user = userCredential.user;
      if (user != null) {
        var tokenResult = await user.getIdTokenResult();
        await callDataService(authRepo.getLoginApple(tokenResult.token.toString()),
            onSuccess: handleLogin);
      }
      hideLoading();
      
    } catch (error) {
      hideLoading();
      showErrorMessage(error.toString());
      print(error.toString());
    }
  }

  signInGoogle()async{
    if(currentUser?.loggedIn==true){
      signOutWithGoogle();
    }

    showLoading();
    signInWithGoogle().then((user) async{
      if(user!=null){
        var tokenResult = await user.getIdTokenResult(true);

        callDataService(authRepo.getLoginGoogle(tokenResult.token.toString()),
            onSuccess: handleLogin);
      }
      hideLoading();
    }, onError: (error){
      hideLoading();
      showErrorMessage(error.toString());
    });


  }

  goToSignUpMode(){
    Get.toNamed(Routes.SIGN_UP);
  }

  forgotPassword()async{

    if(resetEmailController.text.isEmpty){
      showErrorMessage("please fill email field first");

      return;
    }

    if(!resetEmailController.text.isEmail){
      showErrorMessage("field data must be email");

      return;
    }

    FormForgotPass form = FormForgotPass(email: resetEmailController.text);

    callDataService(repository.postForgotPass(form), onSuccess: (response){
      if(response.message != null){
        showMessage("${response.message}");
      }
    });
  }
}
