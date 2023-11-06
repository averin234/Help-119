import 'package:get/get.dart';

import '../modules/aid_book/bindings/aid_book_binding.dart';
import '../modules/aid_book/views/aid_book_view.dart';
import '../modules/ambulance/bindings/ambulance_binding.dart';
import '../modules/ambulance/views/ambulance_view.dart';
import '../modules/emergency_accepeed/bindings/emergency_accepeed_binding.dart';
import '../modules/emergency_accepeed/views/emergency_accepeed_view.dart';
import '../modules/emergency_create/bindings/emergency_create_binding.dart';
import '../modules/emergency_create/views/emergency_create_view.dart';
import '../modules/emergency_detail/bindings/emergency_detail_binding.dart';
import '../modules/emergency_detail/views/emergency_detail_view.dart';
import '../modules/emergency_history/bindings/emergency_history_binding.dart';
import '../modules/emergency_history/views/emergency_history_view.dart';
import '../modules/emergency_list_create/bindings/emergency_list_binding.dart';
import '../modules/emergency_list_create/views/emergency_list_view.dart';
import '../modules/emergency_pick/bindings/emergency_pick_binding.dart';
import '../modules/emergency_pick/views/emergency_pick_view.dart';
import '../modules/emergency_picks/bindings/emergency_picks_binding.dart';
import '../modules/emergency_picks/views/emergency_picks_view.dart';
import '../modules/emergency_wait/bindings/emergency_wait_binding.dart';
import '../modules/emergency_wait/views/emergency_wait_view.dart';
import '../modules/hospital/bindings/hospital_binding.dart';
import '../modules/hospital/views/hospital_view.dart';
import '../modules/informasi/bindings/informasi_binding.dart';
import '../modules/informasi/views/informasi_view.dart';
import '../modules/map_help/bindings/map_help_binding.dart';
import '../modules/map_help/views/map_help_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_edit/bindings/profile_edit_binding.dart';
import '../modules/profile_edit/views/profile_edit_view.dart';
import '../modules/psc/bindings/psc_binding.dart';
import '../modules/psc/views/psc_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/sign_up_verification/bindings/sign_up_verification_binding.dart';
import '../modules/sign_up_verification/views/sign_up_verification_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/upgrade_volunteer/bindings/upgrade_volunteer_binding.dart';
import '../modules/upgrade_volunteer/views/upgrade_volunteer_view.dart';
import '../modules/volunteer/bindings/volunteer_binding.dart';
import '../modules/volunteer/views/volunteer_view.dart';
import '../modules/volunteer_map/bindings/volunteer_map_binding.dart';
import '../modules/volunteer_map/views/volunteer_map_view.dart';
import '../modules/weather/bindings/weather_binding.dart';
import '../modules/weather/views/weather_view.dart';
import '../modules/web_app/bindings/web_app_binding.dart';
import '../modules/web_app/views/web_app_view.dart';
import '/app/modules/favorite/bindings/favorite_binding.dart';
import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/bindings/main_binding.dart';
import '/app/modules/main/views/main_view.dart';
import '/app/modules/other/bindings/other_binding.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/settings/bindings/settings_binding.dart';
import '/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_VERIFICATION,
      page: () => SignUpVerificationView(),
      binding: SignUpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_CREATE,
      page: () => EmergencyCreateView(),
      binding: EmergencyCreateBinding(),
    ),
    GetPage(
      name: _Paths.UPGRADE_VOLUNTEER,
      page: () => UpgradeVolunteerView(),
      binding: UpgradeVolunteerBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.WEB_APP,
      page: () => WebAppView(),
      binding: WebAppBinding(),
    ),
    GetPage(
      name: _Paths.MAP_HELP,
      page: () => MapHelpView(),
      binding: MapHelpBinding(),
    ),
    GetPage(
      name: _Paths.VOLUNTEER,
      page: () => VolunteerView(),
      binding: VolunteerBinding(),
    ),
    GetPage(
      name: _Paths.AID_BOOK,
      page: () => AidBookView(),
      binding: AidBookBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_WAIT,
      page: () => EmergencyWaitView(),
      binding: EmergencyWaitBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_PICK,
      page: () => EmergencyPickView(),
      binding: EmergencyPickBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_PICKS,
      page: () => EmergencyPicksView(),
      binding: EmergencyPicksBinding(),
    ),
    GetPage(
      name: _Paths.WEATHER,
      page: () => WeatherView(),
      binding: WeatherBinding(),
    ),
    GetPage(
      name: _Paths.AMBULANCE,
      page: () => AmbulanceView(),
      binding: AmbulanceBinding(),
    ),
    GetPage(
      name: _Paths.HOSPITAL,
      page: () => HospitalView(),
      binding: HospitalBinding(),
    ),
    GetPage(
      name: _Paths.PSC,
      page: () => PscView(),
      binding: PscBinding(),
    ),
    GetPage(
      name: _Paths.VOLUNTEER_MAP,
      page: () => VolunteerMapView(),
      binding: VolunteerMapBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_DETAIL,
      page: () => EmergencyDetailView(),
      binding: EmergencyDetailBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_HISTORY,
      page: () => EmergencyHistoryView(),
      binding: EmergencyHistoryBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_LIST,
      page: () => EmergencyListView(),
      binding: EmergencyListBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_ACCEPT,
      page: () => EmergencyAccepeedView(),
      binding: EmergencyAccepeedBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI_HEKP119,
      page: () => InformasiView(),
      binding: InformasiBinding(),
    ),
  ];
}
