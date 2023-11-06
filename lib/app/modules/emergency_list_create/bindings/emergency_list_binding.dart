import 'package:get/get.dart';

import '../controllers/emergency_list_controller.dart';

class EmergencyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyListController>(
      () => EmergencyListController(),
    );
  }
}
