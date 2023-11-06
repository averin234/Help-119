import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/web_app_controller.dart';

class WebAppView extends BaseView<WebAppController> {

  static push({String? title, required String url, bool? isLocalFile = false}){
    Get.toNamed(Routes.WEB_APP, parameters: {"title": title ?? '', "url": url,}, arguments: isLocalFile);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(Get.parameters['title'] ?? 'Web'),
    );
  }

  @override
  Widget body(BuildContext context) {
    return WebViewWidget(controller: controller.webController);
  }

}
