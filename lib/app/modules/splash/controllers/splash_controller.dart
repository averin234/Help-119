import 'dart:async';

import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/routes/app_pages.dart';

class SplashController extends BaseController {

  final count = 0.obs;
  @override
  void onInit() async{
    super.onInit();

    var token = await preferenceManager.getString(PreferenceManager.keyToken);
    bool isLogin = token.isNotEmpty;

    Timer(const Duration(seconds: 7), (){
      isLogin ?
      Get.offAllNamed(Routes.MAIN):
      Get.offAndToNamed(Routes.SIGN_IN);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    count.close();
  }
  void increment() => count.value++;

}
