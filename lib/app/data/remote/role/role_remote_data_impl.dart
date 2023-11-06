import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/role_entity.dart';
import 'package:kreki119/app/data/remote/role/role_remote_data.dart';

import '../../../core/base/base_remote_source.dart';
import '../endpoint.dart';

class RoleRemoteDataImpl extends BaseRemoteSource implements RoleRemoteData{

  @override
  Future<BaseResponse<List<RoleEntity>>> loadAllRole() {
    var endpoint = Endpoint.role;

    var dioCall = dioClient.get(endpoint,);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => parseBaseListEntity(response));
    } catch (e) {
      rethrow;
    }
  }

}