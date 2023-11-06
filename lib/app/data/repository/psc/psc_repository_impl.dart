import 'package:get/get.dart';
import 'package:kreki119/app/data/model/form/form_location_place.dart';
import 'package:kreki119/app/data/model/response/psc_entity.dart';
import 'package:kreki119/app/data/remote/psc/psc_remote_data.dart';
import 'package:kreki119/app/data/repository/psc/psc_repository.dart';

import '../../model/response/base_response.dart';

class PscRepositoryImpl extends PscRepository{

  final PscRemoteData remoteData = Get.find(tag: (PscRemoteData).toString());

  @override
  Future<BaseResponse<List<PscEntity>>> getPscByDistance(FormLocationPlace form) {
    return remoteData.loadPscByDistance(form);
  }
}