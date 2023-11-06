import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/data/model/form/Form_emergency.dart';
import 'package:kreki119/app/data/model/form/Form_task.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/app/data/repository/asset/asset_repository.dart';
import 'package:kreki119/app/data/repository/emergency_mobile/emergency_repository.dart';
import 'package:kreki119/app/modules/main/controllers/main_controller.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';

import '../../../core/model/emergency_status.dart';
import '../../../core/model/type_data.dart';
import '../../../core/model/volunteer_status.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../data/model/form/Form_add_contact.dart';
import '../../../data/model/form/Form_update_profile.dart';
import '../../../data/model/response/contact_entity.dart';
import '../../../data/model/response/emergency_mobile_entity.dart';
import '../../../data/repository/volunteer/volunteer_repository.dart';
import '../../../data/services/storage/util_storage.dart';
import '../../../network/exceptions/api_exception.dart';
import '../../../network/exceptions/base_api_exception.dart';
import '../../../network/exceptions/base_exception.dart';
import '../../home/model/aid_book.dart';

class EmergencyCreateController extends BaseController {
  var selectedOption = RxString("Saya Segera ketempat kejadian");

  List<String> dropdownOptions = [
    "Saya Segera ketempat kejadian",
    "Hubungi Telpon Saya, untuk keperluan apa saja yang saya harus di bawa",
    "Saya dan Team Relawan Segera kesana",
  ];


  final mainController = Get.find<MainController>();

  final AssetRepository assetRepository = Get.find(
      tag: (AssetRepository).toString());
  final EmergencyRepository emergencyRepository = Get.find(
      tag: (EmergencyRepository).toString());

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dropdownController = TextEditingController();

  final _emergencyImage = ''.obs;

  String get emergencyImage => _emergencyImage.value;

  set emergencyImage(String val) => _emergencyImage.value = val;
  final _emergencyImageFile = XFile('').obs;

  XFile get emergencyImageFile => _emergencyImageFile.value;

  set emergencyImageFile(XFile val) => _emergencyImageFile.value = val;

  //use this after upload to api
  final _emergencyUploadPath = ''.obs;

  String get emergencyUploadPath => _emergencyUploadPath.value;

  set emergencyUploadPath(String val) => _emergencyUploadPath.value = val;

  final formKey = GlobalKey<FormState>();

  final _isSubmit = false.obs;

  bool get isSubmit => _isSubmit.value;

  set isSubmit(bool value) => _isSubmit.value = value;

  // Variabel untuk menyimpan nilai terpilih dari dropdown


  addPhoto() async {
    XFile? photoFile = await ImagePicker().pickImage(
        source: ImageSource.camera);

    if (photoFile != null) {
      emergencyImageFile = photoFile;
      emergencyImage = photoFile.path;
    }
  }

  @override
  void onInit() async {
    super.onInit();

    var user = await getUserMobile();
    if (user.fcm.isEmptyOrNull) {
      await mainController.loadDataFcm();
    }

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

  @override
  Future<void> onReady() async {
    super.onReady();
    setUserMobile(await mainController.getUserMobile());

    await mainController.loadProfile();
    await mainController.loadAllData();

    loadData();
    loadDatabook(
    );
    //TODO
  }

  @override
  void onClose() {
    //TODO
  }


  submitData() async {
    if (formKey.currentState!.validate()) {
      var location = await getLastPositionLocator();
      if (location == null) {
        showErrorMessage(
            "mohon aktifkan lokasi di pengaturan untuk melanjutkan");

        return;
      }

      if (emergencyImage.isEmpty) {
        showErrorMessage('pilih foto terlebih dahulu');

        return;
      }

      showLoading();

      var user = await getUserMobile();

      var upload = await UtilStorage.uploadEmergencyImage(
          emergencyImage, user.id.toString());

      upload.snapshotEvents.listen((event) async {
        switch (event.state) {
          case TaskState.paused:
            showMessage('Upload pause');
            hideLoading();
            break;
          case TaskState.running:
            var progress = event.bytesTransferred / event.totalBytes;
            logger.d('progress: ${progress * 100}');
            break;
          case TaskState.success:
            showMessage('Success upload');
            var url = await event.ref.getDownloadURL();
            submitPhotoAndData(location, user, url);
            hideLoading();
            break;
          case TaskState.canceled:
            submitPhotoAndData(location, user, '');
            hideLoading();
            break;
          case TaskState.error:
            submitPhotoAndData(location, user, '');
            hideLoading();
            break;
        }
      });
    }
  }

  submitPhotoAndData(Position location, UserMobileEntity user,
      String photoFile) {
    FormTask formTask = FormTask(namaKorban: nameController.text,
        latitudePasien: location.latitude,
        longitudePasien: location.longitude,
        fcmPasien: user.fcm,
        keterangan: descriptionController.text,
        photobyUser: photoFile
    );

    isSubmit = true;

    callDataService(
        emergencyRepository.createTaskEmergency(formTask), onSuccess: (value) {
      if (value.code! >= 200 && value.code! < 300) {
        mainController.onLoadEmergency();

        // Get.toNamed(Routes.EMERGENCY_LIST);
        Get.back();
        isSubmit = false;
      }
    });
  }


  // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


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
          Text(
              'Versi baru aplikasi tersedia. Apakah Anda ingin mengunduh pembaruan sekarang?',
              textAlign: TextAlign.center),
        ],
      ),

      confirm: InkWell(
        onTap: () async {
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
          child: Center(
            child: Text('Unduh Sekarang', style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),

    );
  }


  final _aidBooks = RxList<AidBook>.empty();

  List<AidBook> get aidBooks => _aidBooks.toList();

  final _playMode = PlayerState.stopped.obs;

  PlayerState get playMode => _playMode.value;

  setPlayerState(PlayerState state) => _playMode.value = state;

  final VolunteerRepository volunteerRepository = Get.find(
      tag: (VolunteerRepository).toString());
  final _packageName = ''.obs;

  String get packageName => _packageName.value;
  final RxList<EmergencyMobileEntity> _finishedController = RxList.empty();

  List<EmergencyMobileEntity> get finishedList => _finishedController.toList();
  final _contact = RxList<ContactEntity>();

  List<ContactEntity> get contacts => _contact.toList();
  final _userMobile = UserMobileEntity().obs;

  UserMobileEntity get userMobile => _userMobile.value;

  set contacts(List<ContactEntity> data) => _contact(data);

  setUserMobile(UserMobileEntity val) => _userMobile.value = val;

  late TabController tabController;


  onRefreshPage() {
    //TODO
  }

  onLoadNextPage() {
    logger.i("On load next");
  }

  loadDataOnFinished() async {
    callDataService(
        emergencyRepository.getTaskVolunteer(EmergencyStatus.FINISHED),
        onSuccess: (response) {
          _finishedController(response);
        });
  }


  loadData() async {
    await loadDataOnFinished();
  }

  loadDataContact() async {
    callDataService(userRepo.getContacts(),
        onSuccess: (response) {
          var data = response.data;

          if (data != null) {
            contacts = data;
          }
        }
    );
  }

  loadDatabook() {
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


  onChooseImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    showLoading();
    var user = await getUserMobile();
    var upload = await UtilStorage.uploadProfileImage(
        image.path, user.id.toString());

    upload.snapshotEvents.listen((event) async {
      switch (event.state) {
        case TaskState.paused:
          showMessage('Upload pause');
          hideLoading();
          break;
        case TaskState.running:
          var progress = event.bytesTransferred / event.totalBytes;
          logger.d('progress: ${progress * 100}');
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

  updateProfilePhoto(String url) {
    FormUpdateProfile form = FormUpdateProfile()
      ..photo = url;
    callDataService(authRepo.updateProfile(form),
        onSuccess: (response) async {
          if (response.code! >= 200 && response.code! < 300) {
            mainController.loadProfile();
            showMessage('${response.message}');
          } else {
            if (response.message == null) return;
            showErrorMessage('${response.message}');
          }
        }
    );
  }

  onAddContact(String name, String email, String phone) async {
    FormAddContact form = FormAddContact()
      ..name = name
      ..email = email
      ..phoneNumber = phone;

    callDataService(userRepo.createContact(form),
        onSuccess: (response) async {
          if (response.message != null) {
            finish(Get.context!);
            showMessage("${response.message}");

            showMessage("");

            await loadDataContact();
          }
        },
        onError: (Exception exception) {
          if (exception is ApiException) {
            toast("${exception.status}: ${exception.message}");
          } else if (exception is BaseException) {
            toast(exception.message);
          } else if (exception is BaseApiException) {
            toast("${exception.status}: ${exception.message}");
          } else {
            toast(exception.toString());
          }
        }
    );
  }

  checkVolunteerStatus() async {
    var user = await getUserMobile();
    callDataService(volunteerRepository.getVolunteerById(user.id.toString()),
        onSuccess: (response) async {
          var data = response.data;
          if (data == null) {
            showConfirmDialog(
                Get.context, 'Anda belum jadi relawan, lanjutkan mendaftar?',
                positiveText: 'Ya, lanjutkan',
                negativeText: 'Tidak',
                onAccept: () {
                  Get.toNamed(Routes.UPGRADE_VOLUNTEER);
                }
            );
          } else {
            if (data.status == VolunteerStatus.WAITING.name) {
              showMessage('Pengajuan Volunteer dalam tahap verifikasi admin');
            } else if (data.status == VolunteerStatus.ACCEPTED.name) {
              if (mainController.userRole.group == 'user') {
                await mainController.loadProfile();
              }
              Get.toNamed(Routes.VOLUNTEER);
            } else if (data.status == VolunteerStatus.DEACTIVATED.name) {
              showErrorMessage(
                  'Status volunteer tidak aktif, hubungi admin untuk info lebih lanjut');
            } else if (data.status == VolunteerStatus.REJECTED.name) {
              showErrorMessage('Pengajuan Volunteer tidak di setujui admin');
            }
          }
        }
    );
  }
}
