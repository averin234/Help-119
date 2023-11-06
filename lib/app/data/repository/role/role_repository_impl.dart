import 'dart:convert';

import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/model/response/role_entity.dart';
import 'package:kreki119/app/data/repository/role/role_repository.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/data/remote/role/role_remote_data.dart';

class RoleRepositoryImpl extends RoleRepository{

  final RoleRemoteData remoteData = Get.find(tag: (RoleRemoteData).toString());
  final PreferenceManager preferenceManager = Get.find(tag: (PreferenceManager).toString());

  @override
  Future<List<RoleEntity>> getAllRole() async{
    var localData = await preferenceManager.getString(PreferenceManager.keyRole);
    if(localData.isEmpty){
      var response = await remoteData.loadAllRole();
      var data = response.data;
      preferenceManager.setString(PreferenceManager.keyRole, json.encode(data));
    }

    return await getLocalRole();
  }

  @override
  Future<RoleEntity> getRoleById(String id) async{
    var dataList = await getAllRole();

    return dataList.firstWhere((element) => element.id == id, orElse:()=> RoleEntity());
  }


  Future<List<RoleEntity>> getLocalRole() async{
    var localData = await preferenceManager.getString(PreferenceManager.keyRole);
    var data = json.decode(localData) as List;
    var dataList = data.map((e) => RoleEntity.fromJson(e)).toList();

    return localData.isNotEmpty ? dataList : [];
  }

}