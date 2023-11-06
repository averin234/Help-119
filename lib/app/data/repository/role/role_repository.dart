

import '../../model/response/role_entity.dart';

abstract class RoleRepository{

  Future<List<RoleEntity>> getAllRole();
  Future<RoleEntity> getRoleById(String id);
}