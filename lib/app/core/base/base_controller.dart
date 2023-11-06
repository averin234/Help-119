import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/core/utils/debouncer.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/app/data/repository/role/role_repository.dart';
import 'package:kreki119/app/data/services/geolocator/util_location.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../data/local/preference/preference_manager.dart';
import '../../data/model/form/form_update_location.dart';
import '/app/core/model/page_state.dart';
import '/app/network/exceptions/api_exception.dart';
import '/app/network/exceptions/app_exception.dart';
import '/app/network/exceptions/json_format_exception.dart';
import '/app/network/exceptions/network_exception.dart';
import '/app/network/exceptions/not_found_exception.dart';
import '/app/network/exceptions/service_unavailable_exception.dart';
import '/app/network/exceptions/unauthorize_exception.dart';
import '/flavors/build_config.dart';
import '../../data/model/response/app_user_entity.dart';
import '../../data/repository/auth/auth_repository.dart';
import '../../data/repository/user/user_repository.dart';

abstract class BaseController extends GetxController {
  final Logger logger = BuildConfig.instance.config.logger;

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final AuthRepository authRepo = Get.find(tag: (AuthRepository).toString());
  final UserRepository userRepo = Get.find(tag: (UserRepository).toString());
  final PreferenceManager preferenceManager = Get.find(tag: (PreferenceManager).toString());
  final RoleRepository roleRepository = Get.find(tag: (RoleRepository).toString());

  final logoutController = false.obs;


  //Reload the page
  final _refreshController = false.obs;
  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;
  PageState get pageState => _pageSateController.value;
  updatePageState(PageState state) => _pageSateController(state);
  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);
  hideLoading() => resetPageState();

  final _messageController = ''.obs;
  String get message => _messageController.value;
  showMessage(String msg) {
    _messageController(msg);

    Debouncer().run(() {
      _messageController('');
    });
  }

  final _errorMessageController = ''.obs;
  String get errorMessage => _errorMessageController.value;
  showErrorMessage(String msg) {
    _errorMessageController(msg);
    Debouncer().run(() {
      _errorMessageController('');
    });
  }

  final _successMessageController = ''.obs;
  String get successMessage => _successMessageController.value;
  showSuccessMessage(String msg) {
    _successMessageController(msg);
    Debouncer().run(() {
      _successMessageController('');
    });
  }

  loadUserProfile({
    Function()? onSuccessNext,
    Function(BaseResponse<AppUserEntity> val)? onCheckSuccess,
    Function(Exception ex)? onErrorCheck}){callDataService(userRepo.getMyProfile(),
      onSuccess: onSuccessNext == null ? onCheckSuccess : (BaseResponse<AppUserEntity> val){
      onSuccessNext();
      }
      ,onError: onErrorCheck);
  }

  Future<String> getRoleById(String idRole) async{
    var role = await roleRepository.getRoleById(idRole);

    return role.group ?? '';
  }


  Future<Position?> getLastPositionLocator() async{
    try{
      logger.d("aap, determinePosition");

      return await UtilLocation().determinePosition().catchError((error){
        logger.d('aap, error: $error');
      });
    }catch(error){
      logger.d("aap, error: $error");

      return await Geolocator.getLastKnownPosition();
    }
  }

  Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(String fileName) async {
    String assetName = 'assets/images/$fileName';
    String svgString = await DefaultAssetBundle.of(Get.context!).loadString(assetName);
    //Draws string representation of svg to DrawableRoot
    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, 'svgRoot: $assetName');
    ui.Picture picture = svgDrawableRoot.toPicture(size: const Size(140, 140));
    ui.Image image = await picture.toImage(140, 140);

    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes?.buffer.asUint8List() ?? ByteData(AppValues.defaultByteData).buffer.asUint8List());
  }

  Future<BitmapDescriptor> getBitmapByTypeVolunteer(TypeVolunteer? type)async {

    String fileName = 'ic_marker_victim.svg';

    switch(type){
      case TypeVolunteer.VOLUNTEER:
        fileName = 'ic_marker_user.svg';
        break;
      case TypeVolunteer.AMBULANCE:
        fileName = 'ic_marker_ambulance.svg';
        break;
      case TypeVolunteer.HOSPITAL:
        fileName = 'ic_marker_hospital.svg';
        break;
      case TypeVolunteer.PSC:
        fileName = 'ic_marker_volunteer.svg';
        break;
      default:
        fileName = 'ic_marker_victim.svg';
    }

    return await bitmapDescriptorFromSvgAsset(fileName);
  }


  // ignore: long-parameter-list
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();
      updatePageState(PageState.SUCCESS);

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message ?? 'Timeout exception');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on SocketException catch (exception){
      _exception = exception;
      showErrorMessage(exception.osError?.message ?? exception.message);
    } on HandshakeException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
      showErrorMessage(error.toString());
    }

    updatePageState(PageState.FAILED);

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }


  /// helper to check if textField is empty or null
  /// this function is provide with error message
  bool getValidationData(String? text){
    if(text == null){
      showErrorMessage('Data harus diisi');

      return false;
    }

    if(text.isEmpty){
      showErrorMessage('Data harus diisi');

      return false;
    }

    return true;
  }


  Future<void> loadUpdateLocation()async{

    var position = await getLastPositionLocator();

    if(position!=null){
      var user = await getUserMobile();
      FormUpdateLocation form = FormUpdateLocation();
      form.latitude = position.latitude.toString();
      form.longitude = position.longitude.toString();
      form.id = user.id;

      callDataService(userRepo.createUpdateLocation(form), onSuccess: (BaseResponse response)async{
        if(response.code == 200){
          logger.d('aap, success update Location');
          await loadUserMobile(user.id.toString());
        }
      });
    } else {
      logger.d('aap, location null');
    }
  }

  Future<void> loadUserMobile(String id) async {
    callDataService(userRepo.getUserMobileById(id), onSuccess: (userData)async{
      var userMap = json.encode(userData);
      preferenceManager.setString(PreferenceManager.keyUser, userMap);
      logger.d('user, save: $userMap');
    });
  }

  Future<UserMobileEntity> getUserMobile() async{
    var user = await preferenceManager.getString(PreferenceManager.keyUser);
    var userMap = json.decode(user);
    logger.d('user: $userMap');
    var userMobile = UserMobileEntity.fromJson(userMap);

    return userMobile;
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => logger.d(match.group(0)));
  }

  @override
  void onClose() {
    _messageController.close();
    _errorMessageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }

  showBottomSheetInfo({required String title, String? textButton = 'Ok', required Function() onTapButton}){
    showBottomSheetOrDialog(context: Get.context!,
        bottomSheetDialog: BottomSheetDialog.BottomSheet,
        child: Container(
          padding: const EdgeInsets.all(AppValues.padding),
          decoration: boxDecorationWithRoundedCorners(borderRadius: const BorderRadius.vertical(top: Radius.circular(AppValues.radius_6))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title),
              AppValues.smallPadding.toInt().height,
              AppButton(
                text: textButton ?? 'Ok',
                onTap: onTapButton,
              )

            ],
          ),
        )
    );
  }

}
