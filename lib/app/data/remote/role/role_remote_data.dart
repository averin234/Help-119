import 'package:kreki119/app/data/model/response/role_entity.dart';

import '../../model/response/base_response.dart';

abstract class RoleRemoteData{

  Future<BaseResponse<List<RoleEntity>>> loadAllRole();
}