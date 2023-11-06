import 'package:get/get.dart';

import '../controllers/psc_controller.dart';

class PscBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PscController>(
      () => PscController(),
    );
  }
}
