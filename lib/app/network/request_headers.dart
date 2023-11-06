import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/services/auth/firebase_user_provider.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final PreferenceManager preferenceManager = Get.find(tag: (PreferenceManager).toString());

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      // options.responseType = ResponseType.plain;
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {

    var token = await preferenceManager.getString(PreferenceManager.keyToken);
    Map<String, String> customHeaders = {};

    if(token.isNotEmpty){
      customHeaders = {'Authorization' : 'Bearer $token'};
    }

    return customHeaders;
  }
}
