import 'package:dio/dio.dart';
import 'package:kreki119/app/core/base/base_remote_source.dart';
import 'package:kreki119/app/core/model/type_location.dart';
import 'package:kreki119/app/data/model/form/form_location.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/location_entity.dart';
import 'package:kreki119/app/data/remote/location/location_remote_data.dart';

import '../endpoint.dart';

class LocationRemoteDataImpl extends BaseRemoteSource implements LocationRemoteData{
  @override
  Future<BaseResponse<List<LocationEntity>>> loadCity(String parentNid, {String? search}) async {
    var endpoint = Endpoint.allLocation(TypeLocation.City);
    FormLocation form = FormLocation()
      ..parentNid = parentNid
      ..q = search;

    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _baseParseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<LocationEntity>>> loadProvince({String? search}) {
    var endpoint = Endpoint.allLocation(TypeLocation.Province);
    FormLocation form = FormLocation()..q = search;

    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson(),
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _baseParseEntity(response));
    } catch (e) {
      rethrow;
    }
  }

  BaseResponse<List<T>> _baseParseEntity<T>(Response<dynamic> response){
    return BaseResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse<List<LocationEntity>>> loadPlaces(String type, FormLocationPlace form) {
    var endpoint = Endpoint.allLocation(TypeLocation.City);
    FormLocation form = FormLocation()
      // ..parentNid = parentNid
      // ..q = search
    ;

    var dioCall = dioClient.get(endpoint, queryParameters: form.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _baseParseEntity(response));
    } catch (e) {
      rethrow;
    }
  }


}