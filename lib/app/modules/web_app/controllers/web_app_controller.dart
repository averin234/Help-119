import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebAppController extends BaseController {

  late WebViewController webController;

  @override
  void onInit() {
    super.onInit();

    bool hasLocalFile = Get.arguments ?? false;
    String? title = Get.parameters['title'];
    String url = Get.parameters['url'] ?? '';

    webController = WebViewController();

    if(hasLocalFile){
      webController.loadFlutterAsset(url);
    } else {
      webController.loadRequest(Uri.parse(url));
    }

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TODO
  }
}
