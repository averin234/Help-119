import 'package:dio/dio.dart';
import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/response/assets_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/remote/asset/asset_remote_data.dart';

import '../endpoint.dart';

class AssetRemoteDataImpl extends BaseRemoteSource implements AssetRemoteData{

  @override
  Future<BaseResponse<AssetsEntity>> uploadImageData(String path) async{
    var endpoint = Endpoint.assetsUpload;
    String fileName = path.split('/').last;

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename:fileName),
    });

    var dioCall = dioClient.post(endpoint, data: formData);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<AssetsEntity>> loadImageById(String id) {
    var endpoint = Endpoint.assetsById(id);
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}