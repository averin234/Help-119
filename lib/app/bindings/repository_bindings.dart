import 'package:get/get.dart';
import 'package:kreki119/app/data/repository/ambulance/ambulance_repository.dart';
import 'package:kreki119/app/data/repository/ambulance/ambulance_repository_impl.dart';
import 'package:kreki119/app/data/repository/asset/asset_repository.dart';
import 'package:kreki119/app/data/repository/asset/asset_repository_impl.dart';
import 'package:kreki119/app/data/repository/auth/auth_repository.dart';
import 'package:kreki119/app/data/repository/auth/auth_repository_impl.dart';
import 'package:kreki119/app/data/repository/emergency_mobile/emergency_repository.dart';
import 'package:kreki119/app/data/repository/hospital/hospital_repository.dart';
import 'package:kreki119/app/data/repository/hospital/hospital_repository_impl.dart';
import 'package:kreki119/app/data/repository/location/location_repository.dart';
import 'package:kreki119/app/data/repository/place/place_repository.dart';
import 'package:kreki119/app/data/repository/place/place_repository_impl.dart';
import 'package:kreki119/app/data/repository/psc/psc_repository.dart';
import 'package:kreki119/app/data/repository/role/role_repository.dart';
import 'package:kreki119/app/data/repository/role/role_repository_impl.dart';
import 'package:kreki119/app/data/repository/user/user_repository.dart';
import 'package:kreki119/app/data/repository/user/user_repository_impl.dart';
import 'package:kreki119/app/data/repository/volunteer/volunteer_repository.dart';
import 'package:kreki119/app/data/repository/volunteer/volunteer_repository_impl.dart';

import '../data/repository/emergency_mobile/emergency_repository_impl.dart';
import '../data/repository/location/location_repository_impl.dart';
import '../data/repository/psc/psc_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(),
        tag: (AuthRepository).toString(),
        fenix: true);
    Get.lazyPut<LocationRepository>(() => LocationRepositoryImpl(),
        tag: (LocationRepository).toString(),
        fenix: true);
    Get.lazyPut<PlaceRepository>(() => PlaceRepositoryImpl(),
        tag: (PlaceRepository).toString(),
        fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(),
        tag: (UserRepository).toString(),
        fenix: true);
    Get.lazyPut<EmergencyRepository>(() => EmergencyRepositoryImpl(),
        tag: (EmergencyRepository).toString(),
        fenix: true);
    Get.lazyPut<AssetRepository>(() => AssetRepositoryImpl(),
        tag: (AssetRepository).toString(),
        fenix: true);
    Get.lazyPut<RoleRepository>(() => RoleRepositoryImpl(),
        tag: (RoleRepository).toString(),
        fenix: true);

    Get.lazyPut<AmbulanceRepository>(() => AmbulanceRepositoryImpl(),
        tag: (AmbulanceRepository).toString(),
        fenix: true);

    Get.lazyPut<HospitalRepository>(() => HospitalRepositoryImpl(),
        tag: (HospitalRepository).toString(),
        fenix: true);

    Get.lazyPut<PscRepository>(() => PscRepositoryImpl(),
        tag: (PscRepository).toString(),
        fenix: true);

    Get.lazyPut<VolunteerRepository>(() => VolunteerRepositoryImpl(),
        tag: (VolunteerRepository).toString(),
        fenix: true);
  }
}
