import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/remote/place/place_remote_data.dart';

import '../../../core/base/base_remote_source.dart';
import '../endpoint.dart';

class PlaceRemoteDataImpl extends BaseRemoteSource implements PlaceRemoteData{
  @override
  Future<BaseResponse<List>> loadAllPlace(FormLocationPlace form) {
    var endpoint = Endpoint.locationPlaces('hospital');

    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}