import 'package:audioplayers/audioplayers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/app/modules/main/controllers/main_controller.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/model/type_data.dart';
import '../../../core/model/volunteer_status.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../data/model/form/Form_add_contact.dart';
import '../../../data/model/form/Form_update_profile.dart';
import '../../../data/model/response/contact_entity.dart';
import '../../../data/repository/emergency_mobile/emergency_repository.dart';
import '../../../data/repository/volunteer/volunteer_repository.dart';
import '../../../data/services/storage/util_storage.dart';
import '../../../network/exceptions/api_exception.dart';
import '../../../network/exceptions/base_api_exception.dart';
import '../../../network/exceptions/base_exception.dart';
import '../../../routes/app_pages.dart';
import '../../home/model/aid_book.dart';

class EmergencyListController extends BaseController with GetSingleTickerProviderStateMixin{

  final InAppUpdate inAppUpdate = InAppUpdate();

  get updateAvailable => null;

  Future<void> checkForUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    try {
      final updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.flexibleUpdateAllowed) {
        final latestVersion = updateInfo.availableVersionCode.toString();
        if (currentVersion != latestVersion) {
          showUpdateDialog();
        }
      }
    } catch (e) {
      print('Error checking for updates: $e');
    }
  }

  void showUpdateDialog() {
    Get.defaultDialog(
      title: 'Pembaruan Tersedia',
      content: Column(
        children: [
          AssetImageView(fileName: 'help119_update.png',
            height: 280,
            fit: BoxFit.contain,
          ),
          Text('Versi baru aplikasi tersedia. Apakah Anda ingin mengunduh pembaruan sekarang?', textAlign: TextAlign.center),
        ],
      ),

      confirm: InkWell(
        onTap: () async{
          await InAppUpdate.performImmediateUpdate();
          Get.back();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue
          ),
          child : Center(
            child : Text('Unduh Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),

    );
  }
  final mainController = Get.find<MainController>();
  final EmergencyRepository emergencyRepository =
  Get.find(tag: (EmergencyRepository).toString());

  final _aidBooks = RxList<AidBook>.empty();
  List<AidBook> get aidBooks => _aidBooks.toList();

  final _playMode = PlayerState.stopped.obs;
  PlayerState get playMode => _playMode.value;
  setPlayerState(PlayerState state) => _playMode.value = state;

  final VolunteerRepository volunteerRepository = Get.find(tag: (VolunteerRepository).toString());
  final _packageName = ''.obs;
  String get packageName => _packageName.value;
  final RxList<EmergencyMobileEntity> _finishedController = RxList.empty();
  List<EmergencyMobileEntity> get finishedList => _finishedController.toList();
  final _contact = RxList<ContactEntity>();
  List<ContactEntity> get contacts => _contact.toList();
  final _userMobile = UserMobileEntity().obs;
  UserMobileEntity get userMobile => _userMobile.value;
  set contacts(List<ContactEntity> data) => _contact(data);
  setUserMobile(UserMobileEntity val) => _userMobile.value =val;

  late TabController tabController;

  @override
  onInit()async{
    tabController = TabController(length: 4, vsync: this);
    mainController.loadProfile();
    loadDataContact();
    setUserMobile(await mainController.getUserMobile());
    await mainController.onLoadEmergency();
    await mainController.loadProfile();
    await loadUpdateLocation();
    super.onInit();
    loadData();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _packageName.value = packageInfo.version;
    await mainController.loadUpdateLocation();
  }


  onRefreshPage() {
    //TODO
  }

  onLoadNextPage() {
    logger.i("On load next");

  }
  loadDataOnFinished()async{
    callDataService(emergencyRepository.getTaskVolunteer(EmergencyStatus.FINISHED), onSuccess: (response){
      _finishedController(response);
    });
  }
  @override
  onReady()async{

    setUserMobile(await mainController.getUserMobile());

    await mainController.loadProfile();
    await mainController.loadAllData();

    loadData();
    loadDatabook();
  }

  loadData()async{
    await loadDataOnFinished();
  }

  loadDataContact()async{
    callDataService(userRepo.getContacts(),
        onSuccess: (response){
          var data = response.data;

          if(data != null){
            contacts = data;
          }
        }
    );
  }

  loadDatabook(){
    List<AidBook> books = [];
    AidBook aidBook = AidBook(
        name: 'Voice BHD',
        data: 'audios/emergency_docs.mp3',
        type: TypeData.AUDIO.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook);

    AidBook aidBook1 = AidBook(
        name: 'Gagal jantung',
        data: 'assets/raw/hearthattack.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook1);

    AidBook aidBook2 = AidBook(
        name: 'Penurunan Kesadaran',
        data: 'assets/raw/ams.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook2);

    AidBook aidBook3 = AidBook(
        name: 'Keracunan/Gigitan ular',
        data: 'assets/raw/toxinology.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook3);

    AidBook aidBook4 = AidBook(
        name: 'Tersedak',
        data: 'assets/raw/choking.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook4);

    AidBook aidBook5 = AidBook(
        name: 'Kecelakaan lalu lintas',
        data: 'assets/raw/accident.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook5);

    _aidBooks(books);
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
  onAddContact(String name, String email, String phone) async{
    FormAddContact form = FormAddContact()
      ..name = name
      ..email = email
      ..phoneNumber = phone;

    callDataService(userRepo.createContact(form),
        onSuccess: (response)async{
          if(response.message != null){
            finish(Get.context!);
            showMessage("${response.message}");

            showMessage("");

            await loadDataContact();
          }

        },
        onError: (Exception exception){
          if(exception is ApiException){
            toast("${exception.status}: ${exception.message}");
          } else if (exception is BaseException){
            toast(exception.message);
          } else if (exception is BaseApiException){
            toast("${exception.status}: ${exception.message}");
          } else {
            toast(exception.toString());
          }
        }
    );

  }

  checkVolunteerStatus() async{
    var user = await getUserMobile();
    callDataService(volunteerRepository.getVolunteerById(user.id.toString()),
        onSuccess: (response)async{
          var data = response.data;
          if(data==null){
            showConfirmDialog(Get.context, 'Anda belum jadi relawan, lanjutkan mendaftar?',
                positiveText: 'Ya, lanjutkan',
                negativeText: 'Tidak',
                onAccept: (){
                  Get.toNamed(Routes.UPGRADE_VOLUNTEER);
                }
            );
          } else {
            if(data.status == VolunteerStatus.WAITING.name){
              showMessage('Pengajuan Volunteer dalam tahap verifikasi admin');
            } else if(data.status == VolunteerStatus.ACCEPTED.name){
              if(mainController.userRole.group == 'user'){
                await mainController.loadProfile();
              }
              Get.toNamed(Routes.VOLUNTEER);
            } else if (data.status == VolunteerStatus.DEACTIVATED.name){
              showErrorMessage('Status volunteer tidak aktif, hubungi admin untuk info lebih lanjut');
            } else if(data.status == VolunteerStatus.REJECTED.name){
              showErrorMessage('Pengajuan Volunteer tidak di setujui admin');
            }
          }
        }
    );

  }

}
