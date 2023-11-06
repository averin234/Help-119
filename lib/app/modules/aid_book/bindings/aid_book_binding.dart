import 'package:get/get.dart';

import '../controllers/aid_book_controller.dart';

class AidBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AidBookController>(
      () => AidBookController(),
    );
  }
}
