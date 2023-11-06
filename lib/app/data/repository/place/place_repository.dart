import '../../model/form/form_location_place.dart';
import '../../model/response/base_response.dart';

abstract class PlaceRepository{

  Future<BaseResponse<List<dynamic>>> getAllPlace(FormLocationPlace form);
}