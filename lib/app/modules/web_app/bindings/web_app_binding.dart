import 'package:get/get.dart';

import '../controllers/web_app_controller.dart';

class WebAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebAppController>(
      () => WebAppController(),
    );
  }
}
