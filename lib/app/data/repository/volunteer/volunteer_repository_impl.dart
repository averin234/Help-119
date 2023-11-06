import 'package:get/get.dart';
import 'package:kreki119/app/data/model/form/Form_id.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/volunteer_entity.dart';
import 'package:kreki119/app/data/model/response/volunteer_mobile.dart';
import 'package:kreki119/app/data/remote/volunteer/volunteer_remote_data.dart';
import 'package:kreki119/app/data/repository/volunteer/volunteer_repository.dart';

class VolunteerRepositoryImpl extends VolunteerRepository{

  final VolunteerRemoteData remoteData = Get.find(tag: (VolunteerRemoteData).toString());

  @override
  Future<BaseResponse<List<VolunteerEntity>>> getVolunteerByDistance(FormLocationPlace form) {
    return remoteData.loadVolunteerByDistance(form);
  }

  @override
  Future<BaseResponse<VolunteerMobile>> getVolunteerById(String id) {
    FormId formId = FormId(id: id);

    return remoteData.loadVolunteerById(formId);
  }

}