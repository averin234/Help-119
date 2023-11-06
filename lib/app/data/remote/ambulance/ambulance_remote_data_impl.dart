import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/ambulance_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/remote/ambulance/ambulance_remote_data.dart';

import '../endpoint.dart';

class AmbulanceRemoteDataImpl extends BaseRemoteSource implements AmbulanceRemoteData{

  @override
  Future<BaseResponse<List<AmbulanceEntity>>> loadAmbulanceByDistance(FormLocationPlace form) {
    var endpoint = Endpoint.ambulanceDistanceList;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}