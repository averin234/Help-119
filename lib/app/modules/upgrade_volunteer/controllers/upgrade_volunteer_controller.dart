import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/core/model/type_image.dart';
import 'package:kreki119/app/core/model/type_job.dart';
import 'package:kreki119/app/core/model/volunteer_status.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/model/form/FormUpgradeVolunteer.dart';
import 'package:kreki119/app/data/model/form/Form_add_document.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/repository/asset/asset_repository.dart';
import 'package:kreki119/app/data/services/storage/util_storage.dart';
import 'package:kreki119/app/modules/main/controllers/main_controller.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/utils/date_util.dart';
import '../../../data/model/response/location_entity.dart';
import '../../../data/repository/location/location_repository.dart';

class UpgradeVolunteerController extends BaseController {

  final MainController mainController = Get.find();

  final AssetRepository assetRepository = Get.find(tag: (AssetRepository).toString());
  final LocationRepository locRepository = Get.find(tag: (LocationRepository).toString());

  TextEditingController jobController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressDomicileController = TextEditingController();
  TextEditingController addressOfficeController = TextEditingController();
  TextEditingController citizenController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController institutionController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController certificateExpired = TextEditingController();

  final _job = TypeJob.NONE.obs;
  TypeJob get jobType => _job.value;
  setJob(TypeJob val) => _job.value = val;


  final _dateOfBirth = DateTime.now().subtract(const Duration(days: 1)).obs;
  ///verification if dateOfBirth is tomorrow then it's defaultValue
  DateTime get dateOfBirth => _dateOfBirth.value;
  setDateOfBirth(DateTime date) => _dateOfBirth.value = date;

  ///data set list province
  final RxList<LocationEntity> _province = RxList();
  List<LocationEntity> get provinces => _province.toList();
  setProvince(List<LocationEntity> value) => _province.value = value;
  ///selected province
  final _selectedProvince = LocationEntity().obs;
  LocationEntity get selectedProvince => _selectedProvince.value;
  setSelectedProvince(LocationEntity val)=> _selectedProvince.value = val;

  ///data set list city
  final RxList<LocationEntity>_city = RxList();
  List<LocationEntity> get cities => _city.toList();
  setCity(List<LocationEntity> value) => _city.value = value;
  ///selected city
  final _selectedCity = LocationEntity().obs;
  LocationEntity get selectedCity => _selectedCity.value;
  setSelectedCity(LocationEntity val) => _selectedCity.value = val;

  final _certificateImage = ''.obs;
  String get certificateImage => _certificateImage.value;
  setCertificateImage(String val) => _certificateImage.value = val;
  final _certificateImageFile = XFile('').obs;
  XFile get certificateImageFile => _certificateImageFile.value;
  final _certificateUploadPath = ''.obs;
  String get certificateUploadPath => _certificateUploadPath.value;

  final _citizenImage = ''.obs;
  String get citizenImage => _citizenImage.value;
  setCitizenImage(String val) => _citizenImage.value=val;
  final _citizenImageFile = XFile('').obs;
  XFile get citizenImageFile =>_citizenImageFile.value;
  final _citizenUploadPath = ''.obs;
  String get citizenUploadPath => _citizenUploadPath.value;

  final _userData = AppUserEntity().obs;
  AppUserEntity get userData => _userData.value;

  final formKey = GlobalKey<FormState>();

  final _certificateExp = DateTime.now().subtract(const Duration(days: 1)).obs;
  ///verification if dateOfBirth is tomorrow then it's defaultValue
  DateTime get certificateExp => _certificateExp.value;
  setCertificateExp(DateTime date) => _certificateExp.value = date;

  FormUpgradeVolunteer form = FormUpgradeVolunteer();
  FormAddDocument formAdd = FormAddDocument();

  @override
  void onInit() async{
    super.onInit();

    loadProvinceData();

    var user = await getUserMobile();
    citizenController.text = user.ktp ?? '';
  }


  @override
  void onClose() {
    //TODO
  }


  void addImage(TypeImage typeImage, {required ImageSource takeBy}) async{

    if(typeImage == TypeImage.CITIZEN){
      XFile? citizenFile = await ImagePicker().pickImage(source: takeBy);

      if(citizenFile!=null){
        _citizenImageFile.value = citizenFile;
        _citizenImage.value = citizenFile.path;
      }
    }

    if(typeImage == TypeImage.CERTIFICATE){
      XFile? certificateFile = await ImagePicker().pickImage(source: takeBy);

      if(certificateFile!=null){
        _certificateImageFile.value = certificateFile;
        _certificateImage.value = certificateFile.path;
      }
    }

  }

  uploadCitizenThenCertificateThenSubmit()async{

    showLoading();

    var user = await getUserMobile();

    var upload = await UtilStorage.uploadVolunteerFile(citizenImage, user.id.toString(),
        TypeImage.CITIZEN);

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
          showMessage('Success upload');
          var url = await event.ref.getDownloadURL();
          _citizenUploadPath.value = url;
          formAdd.photoKtp = url;
          hideLoading();

          uploadCertificateThenSubmit();
          break;
        case TaskState.canceled:
          showMessage("Cancel upload");
          hideLoading();
          break;
        case TaskState.error:
          showErrorMessage("Error upload");
          hideLoading();
          break;
      }
    });
  }

  uploadCertificateThenSubmit()async{
    showLoading();

    var user = await getUserMobile();

    var upload = await UtilStorage.uploadVolunteerFile(certificateImage, user.id.toString(),
        TypeImage.CERTIFICATE);


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
          _certificateUploadPath.value = url;
          formAdd.photoCertificate = url;
          hideLoading();
          submitData();
          break;
        case TaskState.canceled:
          showErrorMessage("Cancel upload, try again submit form");
          hideLoading();
          break;
        case TaskState.error:
          showErrorMessage("Error upload, try again submit form");
          hideLoading();
          break;
      }
    });
  }

  Future<bool> checkCameraPermission() async{
     var cameraStatus = await Permission.camera.request();
     if(cameraStatus.isPermanentlyDenied){
       showErrorMessage("Permission denied, you must change this permission in setting manually");
     }

     return cameraStatus.isGranted;

  }

  onPrepareSubmitData(){
    if(formKey.currentState!.validate()){

      if(citizenImage.isEmpty){
        showErrorMessage('pilih ktp dahulu');

        return;
      }
      if(certificateImage.isEmpty){
        showErrorMessage('pilih sertifikat dahulu');

        return;
      }

      uploadCitizenThenCertificateThenSubmit();

      return;
    }

    logger.d("aap, stateNotValidate");
  }

  submitData()async{
    var user = await getUserMobile();

    if(citizenUploadPath.isEmpty){
      showErrorMessage('Gagal unggah Foto Ktp, ulangi kembali');

      return;
    }
    if(certificateUploadPath.isEmpty){
      showErrorMessage('Gagal unggah sertifikat, ulangi kembali');

      return;
    }

    formAdd.fullName = user.fullName;
    formAdd.email = user.email;
    formAdd.phoneNumber = user.phoneNumber;
    formAdd.photoKtp ??= citizenUploadPath;
    formAdd.photoCertificate ??= certificateUploadPath;
    formAdd.identityNumber = user.ktp;
    formAdd.address = user.address;
    formAdd.birthdate = DateUtil.parseFromDate(dateTime: dateOfBirth);
    formAdd.addressDomicile = addressDomicileController.text;
    formAdd.addressOffice = addressOfficeController.text;
    formAdd.status = VolunteerStatus.WAITING.name;

    logger.d("aap, form: ${json.encode(formAdd)}");

    callDataService(userRepo.createAddDocumentVolunteer(user.id.toString(),
        formAdd), onSuccess: (response) async{
      if(response.code! >= 200 && response.code! < 300){
        var user = await getUserMobile();
        loadUserMobile(user.id.toString()).then((value){
          mainController.loadProfile().then((value){
            hideLoading();
            Get.offAndToNamed(Routes.MAIN);
          });
        });
      }
    });

  }

  _handleUpgradeVolunteer(BaseResponse<AppUserEntity> val){
    var user = val.data;

    if(user!=null){
      Get.offAllNamed(Routes.MAIN);
      showMessage("Berhasil menjadi relawan");
      hideLoading();
    }
  }

  Future<String> uploadImage(String path, TypeImage typeImage)async{
    String result = '';
    await callDataService(assetRepository.uploadImageData(path), onSuccess: (val){
      var asset = val.data;
      if(asset!=null){
        if(typeImage == TypeImage.CITIZEN){
          _citizenUploadPath.value = asset.pathLocation.toString();
        }
        if(typeImage == TypeImage.CERTIFICATE){
          _certificateUploadPath.value = asset.pathLocation.toString();
        }

        result = asset.sId ?? '';
      }
    });

    return result;
  }

  loadProvinceData({String? search}) async{
    callDataService(locRepository.getProvinces(search: search),
        // onSuccess: _handleProvince
    );
  }

  loadCity(String parentNid, {String? search}) async{
    callDataService(locRepository.getCities(parentNid, search: search),
        // onSuccess: _handleCity
    );
  }

  _handleProvince(BaseResponse<List<LocationEntity>> value){
    setProvince(value.data ?? []);
  }

  _handleCity(BaseResponse<List<LocationEntity>> value){
    setCity(value.data ?? []);
  }


  Future<bool> checkStoragePermission() async{
    var storageStatus = await Permission.storage.request();
    if(storageStatus.isPermanentlyDenied){
      showErrorMessage("Permission denied, you must change this permission in setting manually");
    }

    return storageStatus.isGranted;

  }

  Future<bool> checkMediaStoragePermission() async{
    var storageStatus = await Permission.manageExternalStorage.request();
    if(storageStatus.isPermanentlyDenied){
      showErrorMessage("Permission denied, you must change this permission in setting manually");
    }

    return storageStatus.isGranted;
  }

}
