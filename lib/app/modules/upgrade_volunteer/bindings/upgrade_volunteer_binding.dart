import 'package:get/get.dart';

import '../controllers/upgrade_volunteer_controller.dart';

class UpgradeVolunteerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradeVolunteerController>(
      () => UpgradeVolunteerController(),
    );
  }
}
