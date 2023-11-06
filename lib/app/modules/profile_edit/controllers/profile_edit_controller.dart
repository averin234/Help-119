import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/model/type_gender.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/city_entity.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/model/form/Form_update_profile.dart';
import '../../../data/model/response/base_response.dart';
import '../../../data/model/response/province_entity.dart';
import '../../../data/repository/location/location_repository.dart';
import '../../../data/services/geolocator/util_location.dart';
import '../../main/controllers/main_controller.dart';

class ProfileEditController extends BaseController {
  final LocationRepository repository =
      Get.find(tag: (LocationRepository).toString());
  final MainController mainController = Get.find<MainController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController =
      TextEditingController(text: "62");
  TextEditingController citizenIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final _dateOfBirth = DateTime.now().subtract(const Duration(days: 1)).obs;

  ///verification if dateOfBirth is tomorrow then it's defaultValue
  DateTime get dateOfBirth => _dateOfBirth.value;
  setDateOfBirth(DateTime date) => _dateOfBirth.value = date;

  ///data set list province
  final RxList<ProvinceEntity> _provinceData = RxList();
  List<ProvinceEntity> get provincesData => _provinceData.toList();
  setProvinceData(List<ProvinceEntity> value) => _provinceData.value = value;

  ///selected province
  final _selectedProvince = ProvinceEntity().obs;
  ProvinceEntity get selectedProvince => _selectedProvince.value;
  setSelectedProvince(ProvinceEntity val) => _selectedProvince.value = val;

  ///data set list city
  final RxList<CityEntity> _city = RxList();
  List<CityEntity> get cities => _city.toList();
  setCity(List<CityEntity> value) => _city.value = value;

  ///selected city
  final _selectedCity = CityEntity().obs;
  CityEntity get selectedCity => _selectedCity.value;
  setSelectedCity(CityEntity val) => _selectedCity.value = val;

  final _gender = TypeGender.NONE.obs;
  TypeGender get gender => _gender.value;
  set gender(TypeGender val) => _gender.value = val;

  late Position position;

  @override
  void onInit() async {
    super.onInit();

    await loadLocation();
    await loadProvincesData();

    checkIfDataExist();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TODO
  }

  Future<void> checkIfDataExist() async {
    showLoading();
    var user = await mainController.getUserMobile();
    if (!user.provinceCode.isEmptyOrNull)
      await loadProvince(user.provinceCode ?? '');
    if (!user.cityCode.isEmptyOrNull)
      await loadCity(user.provinceCode ?? '', user.cityCode ?? '');

    nameController.text = user.fullName ?? '';
    addressController.text = user.address ?? '';
    gender = TypeGender.values
        .singleWhere((element) => element.valueOutput == user.gender);
    genderController.text = TypeGender.values
        .singleWhere((element) => element.valueOutput == user.gender)
        .description;
    citizenIdController.text = user.ktp ?? '';
    phoneNumberController.text = user.phoneNumber ?? '62';
    provinceController.text = selectedProvince.name ?? '';
    cityController.text = selectedCity.name ?? '';

    hideLoading();
  }

  Future<void> loadLocation() async {
    position = await UtilLocation().determinePosition();
  }

  loadProvincesData({String? search}) async {
    callDataService(repository.getProvinces(search: search),
        onSuccess: _handleProvinceData);
  }

  loadCitiesData(String parentNid, {String? search}) async {
    callDataService(repository.getCities(parentNid, search: search),
        onSuccess: _handleCityData);
  }

  _handleProvinceData(List<ProvinceEntity> val) {
    setProvinceData(val);
    logger.d('aap, provinces: $val');
  }

  _handleCityData(List<CityEntity> value) {
    setCity(value);
    logger.d(('aap, cities: $value'));
  }

  Future<void> loadProvince(String id) async {
    callDataService(repository.getProvince(id), onSuccess: (province) async {
      setSelectedProvince(province);
      logger.d("aap, province: $province");
      provinceController.text = province.name ?? '';

      await loadCitiesData(province.id.toString());
    });
  }

  Future<void> loadCity(String provinceId, String id) async {
    callDataService(repository.getCity(provinceId, id), onSuccess: (city) {
      setSelectedCity(city);
      logger.d("aap, city: $city");
      cityController.text = city.name ?? '';
    });
  }

  onPrepareSubmitData() async {
    logger.d("aap, submit");
    if (formKey.currentState!.validate()) {
      if (citizenIdController.text.length != AppValues.citizenIdLength) {
        showErrorMessage("No ktp harus 16 digit");

        return;
      }

      if (phoneNumberController.text.length < 7 ||
          phoneNumberController.text.length > 20) {
        showErrorMessage("no handphone antara 9-13 digit");

        return;
      }

      if (phoneNumberController.text.startsWith("0")) {
        showErrorMessage('No handphone harus dimulai dengan kode negara');

        return;
      }
      onSubmit();

      return;
    }

    logger.d("aap, stateNotValidate");
  }

  onSubmit() async {
    logger.d("aap, submitPrepareData");
    FormUpdateProfile formUpdateProfile = FormUpdateProfile()
      ..fullName = nameController.text
      ..address = addressController.text
      ..gender = gender.valueOutput
      ..ktp = citizenIdController.text
      ..phoneNumber = phoneNumberController.text
      ..provinceCode = selectedProvince.id.toString()
      ..cityCode = selectedCity.id.toString()
      ..verified = true;

    callDataService(authRepo.updateProfile(formUpdateProfile),
        onSuccess: _handleVerification);
  }

  _handleVerification(BaseResponse value) async {
    if (value.code == 200) {
      var user = await getUserMobile();
      await loadUserMobile(user.id.toString());
      await mainController.loadProfile();
      Get.offAllNamed(Routes.MAIN);
    } else {
      showErrorMessage("Failed: ${value.error}");
    }
  }

  _handleRegister(BaseResponse<AppUserEntity> value) {
    logger.d("aap, handleRegister: $value");
    if (value.data != null) {
      Get.back(result: true);
    }

    if (value.error != null) {
      showErrorMessage("${value.error}");
    }
  }
}
