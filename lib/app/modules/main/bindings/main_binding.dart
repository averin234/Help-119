import 'package:get/get.dart';
import 'package:kreki119/app/modules/main/controllers/bottom_nav_controller.dart';

import '../../sign_up_verification/controllers/sign_up_verification_controller.dart';
import '/app/modules/favorite/controllers/favorite_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/other/controllers/other_controller.dart';
import '/app/modules/settings/controllers/settings_controller.dart';
import '../../aid_book/controllers/aid_book_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(
          () => BottomNavController(),
      fenix: true,
    );
    Get.lazyPut<OtherController>(
      () => OtherController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<AidBookController>(
            () => AidBookController(),
        fenix: true
    );
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
      fenix: true,
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
      fenix: true,
    );
    Get.lazyPut<ProfileController>(
            () => ProfileController(),
      fenix: true,
    );

    Get.lazyPut<SignUpVerificationController>(
            () => SignUpVerificationController(),
      fenix: true
    );
  }
}
