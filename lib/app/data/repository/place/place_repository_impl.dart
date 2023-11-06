import 'package:get/get.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/remote/place/place_remote_data.dart';
import 'package:kreki119/app/data/repository/place/place_repository.dart';

class PlaceRepositoryImpl extends PlaceRepository{
  final PlaceRemoteData remoteData = Get.find(tag: (PlaceRemoteData).toString());

  @override
  Future<BaseResponse<List>> getAllPlace(FormLocationPlace form) {
    return remoteData.loadAllPlace(form);
  }

}