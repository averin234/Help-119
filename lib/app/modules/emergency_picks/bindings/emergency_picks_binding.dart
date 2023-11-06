import 'package:get/get.dart';

import '../controllers/emergency_picks_controller.dart';

class EmergencyPicksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyPicksController>(
      () => EmergencyPicksController(),
    );
  }
}
