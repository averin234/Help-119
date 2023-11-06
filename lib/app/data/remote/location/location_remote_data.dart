import 'package:kreki119/app/data/model/form/form_location_place.dart';

import '../../model/response/base_response.dart';
import '../../model/response/location_entity.dart';

abstract class LocationRemoteData{

  Future<BaseResponse<List<LocationEntity>>> loadProvince({String? search});
  Future<BaseResponse<List<LocationEntity>>> loadCity( String parentNid, {String? search});
  Future<BaseResponse<List<LocationEntity>>> loadPlaces(String type, FormLocationPlace form);


}