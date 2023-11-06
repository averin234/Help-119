import 'package:get/get.dart';
import 'package:kreki119/app/data/remote/ambulance/ambulance_remote_data.dart';
import 'package:kreki119/app/data/remote/ambulance/ambulance_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/asset/asset_remote_data.dart';
import 'package:kreki119/app/data/remote/asset/asset_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/auth/auth_remote_source.dart';
import 'package:kreki119/app/data/remote/auth/auth_remote_source_impl.dart';
import 'package:kreki119/app/data/remote/emergency_mobile/emergency_remote_data.dart';
import 'package:kreki119/app/data/remote/emergency_mobile/emergency_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/hospital/hospital_remote_data.dart';
import 'package:kreki119/app/data/remote/location/location_remote_data.dart';
import 'package:kreki119/app/data/remote/location/location_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/place/place_remote_data.dart';
import 'package:kreki119/app/data/remote/place/place_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/psc/psc_remote_data.dart';
import 'package:kreki119/app/data/remote/psc/psc_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/role/role_remote_data.dart';
import 'package:kreki119/app/data/remote/role/role_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/user/user_remote_data.dart';
import 'package:kreki119/app/data/remote/user/user_remote_data_impl.dart';
import 'package:kreki119/app/data/remote/volunteer/volunteer_remote_data.dart';
import 'package:kreki119/app/data/remote/volunteer/volunteer_remote_data_impl.dart';

import '../data/remote/hospital/hospital_remote_data_impl.dart';


class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AuthRemoteSource>(() => AuthRemoteSourceImpl(),
        tag: (AuthRemoteSource).toString(),
        fenix: true
    );
    Get.lazyPut<LocationRemoteData>(() => LocationRemoteDataImpl(),
        tag: (LocationRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<PlaceRemoteData>(() => PlaceRemoteDataImpl(),
        tag: (PlaceRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<UserRemoteData>(() => UserRemoteDataImpl(),
      tag: (UserRemoteData).toString(),
      fenix: true
    );
    Get.lazyPut<EmergencyRemoteData>(() => EmergencyRemoteDataImpl(),
        tag: (EmergencyRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<AssetRemoteData>(() => AssetRemoteDataImpl(),
        tag: (AssetRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<RoleRemoteData>(() => RoleRemoteDataImpl(),
        tag: (RoleRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<AmbulanceRemoteData>(() => AmbulanceRemoteDataImpl(),
        tag: (AmbulanceRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<HospitalRemoteData>(() => HospitalRemoteDataImpl(),
        tag: (HospitalRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<PscRemoteData>(() => PscRemoteDataImpl(),
        tag: (PscRemoteData).toString(),
        fenix: true
    );
    Get.lazyPut<VolunteerRemoteData>(() => VolunteerRemoteDataImpl(),
        tag: (VolunteerRemoteData).toString(),
        fenix: true
    );
  }
}
