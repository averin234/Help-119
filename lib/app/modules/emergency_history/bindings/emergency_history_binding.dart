import 'package:get/get.dart';

import '../controllers/emergency_history_controller.dart';

class EmergencyHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyHistoryController>(
      () => EmergencyHistoryController(),
    );
  }
}
