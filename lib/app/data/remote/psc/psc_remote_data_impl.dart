import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/psc_entity.dart';
import 'package:kreki119/app/data/remote/psc/psc_remote_data.dart';

import '../endpoint.dart';

class PscRemoteDataImpl extends BaseRemoteSource implements PscRemoteData{
  @override
  Future<BaseResponse<List<PscEntity>>> loadPscByDistance(FormLocationPlace form) {
    var endpoint = Endpoint.pscDistanceList;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}