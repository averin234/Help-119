import 'package:get/get.dart';

import '../controllers/sign_up_verification_controller.dart';

class SignUpVerificationBinding extends Bindings {
  @override
  void dependencies() {


    Get.lazyPut<SignUpVerificationController>(
      () => SignUpVerificationController(),
    );
  }
}
