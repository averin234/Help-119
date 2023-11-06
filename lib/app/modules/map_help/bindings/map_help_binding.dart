import 'package:get/get.dart';

import '../controllers/map_help_controller.dart';

class MapHelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapHelpController>(
      () => MapHelpController(),
    );
  }
}
