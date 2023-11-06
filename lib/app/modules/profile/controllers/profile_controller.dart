import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/model/form/Form_update_profile.dart';
import 'package:kreki119/app/modules/main/controllers/main_controller.dart';
import 'package:kreki119/app/modules/main/model/menu_code.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../data/services/storage/util_storage.dart';

class ProfileController extends BaseController {

  final mainController = Get.find<MainController>();


  final _packageName = ''.obs;
  String get packageName => _packageName.value;

  late final DeviceInfoPlugin deviceInfo;


  @override
  void onInit() async{
    super.onInit();

    deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _packageName.value = packageInfo.version;

    mainController.loadProfile();

  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TODO
  }

  onSignOut()async{
    await preferenceManager.setString(PreferenceManager.keyToken, '');
    await preferenceManager.setString(PreferenceManager.keyUser, '');
    await preferenceManager.setString(PreferenceManager.keyRole, '');

    mainController.onMenuSelected(MenuCode.HOME);

    Get.offAllNamed(Routes.SIGN_IN);
  }

  updatePassword(String pass) {
    finish(Get.context!);
    callDataService(authRepo.updatePassword(pass),
      onSuccess: (response){
        if(response.code==null){
          if(response.code! >= 300){
            showErrorMessage("Failed: ${response.message}");
          }

          return;
        }

        showMessage("${response.message}");
      }
    );
  }

  onChooseImage()async{
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    showLoading();
    var user = await getUserMobile();
    var upload = await UtilStorage.uploadProfileImage(image.path, user.id.toString());

    upload.snapshotEvents.listen((event) async{
      switch(event.state){
        case TaskState.paused:
          showMessage('Upload pause');
          hideLoading();
          break;
        case TaskState.running:
          var progress = event.bytesTransferred / event.totalBytes;
          logger.d('progress: ${progress*100}');
          break;
        case TaskState.success:
          var url = await event.ref.getDownloadURL();
          updateProfilePhoto(url);
          hideLoading();
          break;
        case TaskState.canceled:
          hideLoading();
          break;
        case TaskState.error:
          showErrorMessage('Error, Failed to upload try again later');
          hideLoading();
          break;
      }
    });
  }

  updateProfilePhoto(String url){
    FormUpdateProfile form = FormUpdateProfile()..photo = url;
    callDataService(authRepo.updateProfile(form),
      onSuccess: (response)async{

        if(response.code! >=200 && response.code! < 300){
          mainController.loadProfile();
          showMessage('${response.message}');
        }else {
          if(response.message==null) return;
          showErrorMessage('${response.message}');
        }

      }
    );
  }

}

