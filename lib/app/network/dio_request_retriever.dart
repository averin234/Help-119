import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '/app/data/local/preference/preference_manager.dart';
import '/app/network/dio_provider.dart';
import '../data/services/auth/firebase_user_provider.dart';

class DioRequestRetriever {
  final dioClient = DioProvider.tokenClient;
  final RequestOptions requestOptions;

  final PreferenceManager _preferenceManager =
      getx.Get.find(tag: (PreferenceManager).toString());

  DioRequestRetriever({required this.requestOptions});

  Future<Response<T>> retry<T>() async {
    var header = await getCustomHeaders();

    return await dioClient.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(headers: header, method: requestOptions.method),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {

    var token = await _preferenceManager.getString(PreferenceManager.keyToken);

    var customHeaders = {'content-type': 'application/json'};

    if(token.trim().isNotEmpty){
      customHeaders.addAll({
        'Authorization' : 'Bearer $token'
      });
    }

    return customHeaders;
  }
}
