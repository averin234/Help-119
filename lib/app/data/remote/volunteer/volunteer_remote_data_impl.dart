import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/data/model/form/Form_id.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/volunteer_entity.dart';
import 'package:kreki119/app/data/model/response/volunteer_mobile.dart';
import 'package:kreki119/app/data/remote/volunteer/volunteer_remote_data.dart';

import '../endpoint.dart';

class VolunteerRemoteDataImpl extends BaseRemoteSource implements VolunteerRemoteData{
  @override
  Future<BaseResponse<List<VolunteerEntity>>> loadVolunteerByDistance(FormLocationPlace form) {
    var endpoint = Endpoint.volunteerDistanceList;
    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<VolunteerMobile>> loadVolunteerById(FormId formId) {
    var endpoint = "${Endpoint.volunteerById}/${formId.id}";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}