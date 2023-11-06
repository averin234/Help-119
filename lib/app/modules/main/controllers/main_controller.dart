
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/utils/date_util.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/model/form/Form_notification_subscribe.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/form/form_update_location.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/app/data/repository/emergency_mobile/emergency_repository.dart';
import 'package:kreki119/app/data/repository/role/role_repository.dart';
import 'package:kreki119/app/data/services/messaging/util_fcm.dart';
import 'package:kreki119/app/data/services/weather/util_weather.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather/weather.dart';

import '../../../data/model/response/role_entity.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '../../../data/repository/place/place_repository.dart';

class MainController extends BaseController {

  final _selectedMenuCodeController = MenuCode.HOME.obs;
  MenuCode get  selectedMenuCode => _selectedMenuCodeController.value;
  final lifeCardUpdateController = false.obs;

  final EmergencyRepository emergencyRepository =
  Get.find(tag: (EmergencyRepository).toString());

  final PlaceRepository repo = Get.find(tag: (PlaceRepository).toString());

  final _latitude = 0.toDouble().obs;
  double get latitude => _latitude.value;
  final _longitude = 0.toDouble().obs;
  double get longitude => _longitude.value;

  final _userMobile = UserMobileEntity().obs;
  UserMobileEntity get userMobile => _userMobile.value;
  set userMobile(UserMobileEntity val) => _userMobile.value = val;

  final _userRole = RoleEntity().obs;
  RoleEntity get userRole => _userRole.value;
  setUserRole(RoleEntity role) => _userRole.value = role;

  final RxList<EmergencyMobileEntity> _emergenciesController = RxList.empty();
  List<EmergencyMobileEntity> get emergencyList => _emergenciesController.toList();

  final _weather = Weather(UtilWeather.baseEmptyWeather()).obs;
  Weather get weather => _weather.value;
  set weather(Weather val) => _weather.value = val;

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }


  @override
  void onInit(){
    super.onInit();

    // loadAllData();


  }

  @override
  void onReady() async{
    // loadAllData();

    if(Get.arguments != null){
      await loadWeather(forceRefresh: true);
    }

  }


  loadAllData() async{
    // getLastPositionLocator().then((position) async{
    //   if(position!=null){
    //     //TODO: change on logic to get weather data
    //     _weather.value = await UtilWeather.onLoadWeather(position.latitude, position.longitude);
    //   }
    // });
    await onLoadEmergency();
    await loadProfile();
    await loadUpdateLocation();
  }

  loadWeather({bool forceRefresh =false})async{
    getLastPositionLocator().then((position) async{
      if(position!=null){

        if(forceRefresh){
          showLoading();
          UtilWeather.loadWeather(position.latitude, position.longitude)
              .then((value) => hideLoading());
        }

        var mustCheck = await checkLoadWeather();
        logger.d("aap, mustCheck: $mustCheck");

        if(mustCheck) {
          showLoading();
          UtilWeather.loadWeather(position.latitude, position.longitude)
              .then((value) => hideLoading());
        } else {
          showMessage('maksimal muat ulang cuaca setiap 10 menit, coba lagi kembali');
        }

        weather = await UtilWeather.getWeather();
      }
    });
  }

  Future<Weather> getWeather() async{
    var weatherData = getJSONAsync(PreferenceManager.keyWeather,defaultValue: UtilWeather.baseEmptyWeather());

    return Weather(weatherData);
  }

  ///return true if weather must be loaded
  Future<bool> checkLoadWeather()async{
    var weather = await UtilWeather.getWeather();
    logger.d("aap, weather: ${weather.date}");
    logger.d("aap, weather isAfterMinutes: ${weather.date?.isAfterMinutes(10)}");

    if(weather.areaName == null) return true;

    if(weather.date?.isAfterMinutes(10) == true) return true;


    return false;
  }

  loadDataFcm() async{
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if(fcmToken!=null){
      updateFcmToServer(fcmToken);
    }
  }

  Future<void> loadProfile() async{
    var user = await getUserMobile();
    await loadUserMobile(user.id.toString());

    if(user.verified == false){
      Get.offAllNamed(Routes.SIGN_UP_VERIFICATION);

      return;
    }

    callDataService(roleRepository.getRoleById(user.idRole.toString()),
      onSuccess: (val){
        setUserRole(val);
      }
    );


    userMobile = await getUserMobile();
  }

  updateFcmToServer(String fcmToken)async{
    var user = await getUserMobile();

    FormNotificationSubscribe form = FormNotificationSubscribe(
        fcm: fcmToken,
      id: user.id
    );
    callDataService(userRepo.updateSubscribeNotification(form), onSuccess: (response)async{
      if(response.code! >=200 && response.code! < 300){
        loadUserMobile(user.id.toString());
      }
    });
  }

  initializeThenCheckFcmToken()async{
    var notificationSetting = await UtilFcm().settingFcm();
    logger.d("aap, fcmStats: ${notificationSetting.authorizationStatus}");

    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {
          updateFcmToServer(fcmToken);
    })
        .onError((err) {
      logger.d('error get fcmToken');
    });
  }


  onLoadEmergency() async{
    callDataService(emergencyRepository.getTaskUser(), onSuccess: (val){
      _emergenciesController(val.data);
    });
  }



}
