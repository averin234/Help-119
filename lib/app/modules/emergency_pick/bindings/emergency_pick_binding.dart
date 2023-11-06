import 'package:get/get.dart';

import '../controllers/emergency_pick_controller.dart';

class EmergencyPickBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyPickController>(
      () => EmergencyPickController(),
    );
  }
}
