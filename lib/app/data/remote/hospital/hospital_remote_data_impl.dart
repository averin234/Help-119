import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/hospital_entity.dart';

import '../endpoint.dart';
import 'hospital_remote_data.dart';

class HospitalRemoteDataImpl extends BaseRemoteSource implements HospitalRemoteData{
  @override
  Future<BaseResponse<List<HospitalEntity>>> loadHospitalByDistance(FormLocationPlace form) {
    var endpoint = Endpoint.hospitalDistanceList;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}