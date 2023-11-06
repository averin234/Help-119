import 'package:get/get.dart';

import '../controllers/emergency_detail_controller.dart';

class EmergencyDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyDetailController>(
      () => EmergencyDetailController(),
    );
  }
}
