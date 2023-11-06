import 'package:get/get.dart';

import '../controllers/volunteer_controller.dart';

class VolunteerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerController>(
      () => VolunteerController(),
    );
  }
}
