

import 'package:kreki119/app/data/model/response/assets_entity.dart';

import '../../model/response/base_response.dart';

abstract class AssetRepository{

  Future<BaseResponse<AssetsEntity>> uploadImageData(String path);
  Future<BaseResponse<AssetsEntity>> getImageById(String id);

}