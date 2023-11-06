import 'package:get/get.dart';
import 'package:kreki119/app/data/model/response/assets_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/repository/asset/asset_repository.dart';

import '../../remote/asset/asset_remote_data.dart';

class AssetRepositoryImpl extends AssetRepository{

  final AssetRemoteData remoteData =
      Get.find(tag: (AssetRemoteData).toString());

  @override
  Future<BaseResponse<AssetsEntity>> getImageById(String id) {
    return remoteData.loadImageById(id);
  }

  @override
  Future<BaseResponse<AssetsEntity>> uploadImageData(String path) {
    return remoteData.uploadImageData(path);
  }

}