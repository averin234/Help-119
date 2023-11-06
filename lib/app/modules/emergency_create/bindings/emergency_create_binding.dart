import 'package:get/get.dart';

import '../controllers/emergency_create_controller.dart';

class EmergencyCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyCreateController>(
      () => EmergencyCreateController(),
    );
  }
}
