import 'package:get/get.dart';

import '../controllers/volunteer_map_controller.dart';

class VolunteerMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerMapController>(
      () => VolunteerMapController(),
    );
  }
}
