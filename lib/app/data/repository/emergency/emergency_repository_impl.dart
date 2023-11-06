import 'package:get/get.dart';
import 'package:kreki119/app/data/model/form/Form_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_pick_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/form/form_update_emergency.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/emergency_entity.dart';
import 'package:kreki119/app/data/remote/emergency/emergency_remote_data.dart';
import 'package:kreki119/app/data/repository/emergency/emergency_repository.dart';
import 'package:kreki119/flavors/build_config.dart';
import 'package:logger/logger.dart';


class EmergencyRepositoryImpl extends EmergencyRepository{

  final EmergencyRemoteData remoteData =
      Get.find(tag: (EmergencyRemoteData).toString());

  @override
  Future<BaseResponse<EmergencyEntity>> createAssignVolunteer(FormPickEmergency form) {
    return remoteData.postAssignVolunteer(form);
  }

  @override
  Future<BaseResponse<EmergencyEntity>> createEmergency(FormEmergency form) {
    return remoteData.postEmergency(form);
  }

  @override
  Future<BaseResponse<EmergencyEntity>> createEmergencyPickUp(FormPickEmergency form) {
    return remoteData.postEmergencyPickUp(form);
  }

  @override
  Future<BaseResponse<List<EmergencyEntity>>> getEmergencies(FormSearch form) async{
    Logger logger = BuildConfig.instance.config.logger;
    BaseResponse<List<EmergencyEntity>> baseResponse = BaseResponse(data: []);

    if(form.filterBy == "user_id._id"){
      List<EmergencyEntity> emergencies = [];
      logger.d('aap, emergency: ${form.value}');

      FormSearch formSearchAll = FormSearch();
      var dataResponse = await remoteData.loadEmergencies(formSearchAll);
      var data = dataResponse.data;

      if(data!=null){
        var dataList = data.where((element) => element.userId?.sId == form.value).toList();
        logger.d('aap. emergency List: $dataList');
        emergencies.addAll(dataList);
        baseResponse.data = emergencies;
      }

      logger.d('aap, emergency: ${baseResponse.data}');

      return baseResponse;
    }

    return remoteData.loadEmergencies(form);
  }

  @override
  Future<BaseResponse<EmergencyEntity>> getEmergencyById(String id) {
    return remoteData.loadEmergencyById(id);
  }

  @override
  Future<BaseResponse<List<EmergencyEntity>>> getEmergenciesNearby(FormSearch form) {
    return remoteData.loadEmergenciesNearby(form);
  }

  @override
  Future<BaseResponse<EmergencyEntity>> editEmergencyStatus(FormUpdateEmergency form) {
    return remoteData.updateEmergency(form);
  }

  @override
  Future<BaseResponse<EmergencyEntity>> cancelEmergency(FormUpdateEmergency form) {
    return remoteData.cancelEmergency(form);
  }



}