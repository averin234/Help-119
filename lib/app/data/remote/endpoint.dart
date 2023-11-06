import 'package:kreki119/app/core/model/type_location.dart';

import '../../../flavors/build_config.dart';


///anything without version path is new Endpoint
class Endpoint{
  static final String baseUrl = BuildConfig.instance.config.baseUrl;
  static const String version = "v1";

  //auth
  static const String checkToken = "/$version/auth/u/check-token";
  static const String completeRegister = "/$version/auth/u/complete-register";
  //auth new version
  static const String login = "/userMobile/login";
  static const String register = "/userMobile/register";
  static const String loginGoogle = "/userMobile/signinWithGoogle";
  static const String forgotPass = "/userMobile/forgotPassword";

  //location
  static String allLocation(TypeLocation type) => "/$version/locations/district/list/${type.value}";
  static String locationPlaces(String type) => "/v1/locations/places/$type";
  //location new version
  static var ambulanceDistanceList = "/ambulance/byDistance/Mobile"; // /ambulance/byDistance
  static var pscDistanceList = "/psc/byDistance/Mobile"; // /pscMobile/byDistance
  static var volunteerDistanceList = "/relawan/byDistance/Mobile"; // /volunteerMobile/byDistance
  static var hospitalDistanceList = "/faskes/byDistance/Mobile";
  static var volunteerById = '/relawanData'; // /volunteerMobile

  //user
  static const String users = "/$version/users";
  static String userById(String id) => "/$version/users/$id";
  static const String userInfo = "/$version/users/u/info";
  static String userAddContact(String id) => "/$version/users/u/$id/contact";
  static const String userUpgradeVolunteer = "/$version/users/u/upgrade-volunteer";
  ///new version
  static String get userMobileById => "/user"; //"/userMobile";
  static const String userSubscribeNotification = '/user'; // "/userMobile/update/fcm";
  static const String userUpdateLocation = "/user"; // "/userMobile/update/location";
  static const String updateProfile = "/user"; // "/userMobile/update/profile";
  static const String addDocumentVolunteer = "/relawanData"; // /volunteerMobile/addDocuments
  static const String addContact = "/contact"; // /userMobile/contact
  static const String updatePassword = "/userMobile/update/password";

  //emergency
  static const String emergencyCreate = "/$version/emergency/create";
  static const String emergencyAssignVolunteer = "/$version/emergency/assign-volunteer";
  static const String emergencyPickUp = "/$version/emergency/pick-up";
  static const String emergencyUpdateStatus = "/$version/emergency/update-status";
  static const String emergencyCancel = "/$version/emergency/cancel";
  static const String emergencyList = "/$version/emergency";
  static const String emergencyNearbyList = "/$version/emergency/nearby";
  static String emergencyById(String id) => "/$version/emergency/$id";
  ///new version
  static const String emergencyMobile = "/emergency"; // /emergencyMobile
  static const String emergencyMobileCreate = "/emergency"; // /emergency
  static const String emergencyMobileById = "/emergency"; //emergencyMobile/byId
  static const String emergencyMobileTaskVolunteer = "/emergency/getTaskVolunteer";
  static const String emergencyMobileTaskUser = "/emergency/getTaskUser";
  static const String emergencyMobileByDistance = "/emergency/byDistance/Mobile";
  static const String emergencyMobileAccepted = "/emergency/accepted";
  static const String emergencyMobileOnGoing = "/emergency/ongoing";
  static const String emergencyMobileFinish = "/emergency/finish";
  static const String emergencyMobileReject = "/emergency/reject";
  static const String emergencyMobileFollowUp = "/emergency/needFollowUp";
  static const String emergencyMobileCanceled = "/emergency/canceled";

  //assets
  static const String assetsUpload = "/$version/assets/upload";
  static String assetsById(String id) => "/$version/assets/public/$id";

  //role
  static const String role = '/roles';

}