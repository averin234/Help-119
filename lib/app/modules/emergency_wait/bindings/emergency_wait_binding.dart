import 'package:get/get.dart';

import '../controllers/emergency_wait_controller.dart';

class EmergencyWaitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyWaitController>(
      () => EmergencyWaitController(),
    );
  }
}
