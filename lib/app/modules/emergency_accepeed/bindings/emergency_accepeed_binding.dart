import 'package:get/get.dart';

import '../controllers/emergency_accepeed_controller.dart';

class EmergencyAccepeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyAccepeedController>(
      () => EmergencyAccepeedController(),
    );
  }
}
