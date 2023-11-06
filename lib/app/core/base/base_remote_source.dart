import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:kreki119/app/data/model/response/app_notification_entity.dart';
import 'package:kreki119/app/data/services/auth/firebase_user_provider.dart';

import '/app/network/dio_provider.dart';
import '/app/network/error_handlers.dart';
import '/app/network/exceptions/base_exception.dart';
import '/flavors/build_config.dart';
import '../../data/model/response/base_response.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;
  Dio get dioHttp => DioProvider.httpDio;

  final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      ///block for error
      if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {
        //TODO
      }
      if(response.statusCode == HttpStatus.unauthorized){
        //refresh token
        logger.d("aap, tokenRequest");
        await currentUser?.user?.getIdTokenResult(true).then((value) async{
          return await api;
        });
      }

      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);

      logger.e(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }

  BaseResponse<T> parseBaseEntity<T>(Response<dynamic> response){
    return BaseResponse.fromJson(response.data);
  }

  BaseResponse<List<T>> parseBaseListEntity<T>(Response<dynamic> response){
    return BaseResponse.fromJson(response.data);
  }
}
