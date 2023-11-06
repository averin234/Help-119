import 'package:get/get.dart';
import 'package:kreki119/app/data/local/preference/preference_manager.dart';
import 'package:kreki119/app/data/model/form/FormUpgradeVolunteer.dart';
import 'package:kreki119/app/data/model/form/Form_add_contact.dart';
import 'package:kreki119/app/data/model/form/Form_add_document.dart';
import 'package:kreki119/app/data/model/form/Form_notification_subscribe.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/form/Form_update_profile.dart';
import 'package:kreki119/app/data/model/form/form_update_location.dart';
import 'package:kreki119/app/data/model/response/app_notification_entity.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';
import 'package:kreki119/app/data/remote/user/user_remote_data.dart';
import 'package:kreki119/app/data/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  final UserRemoteData remoteData = Get.find(tag: (UserRemoteData).toString());

  @override
  Future<BaseResponse> createContact(FormAddContact form) {
    return remoteData.postContact(form);
  }

  @override
  Future<BaseResponse> updateSubscribeNotification(FormNotificationSubscribe form) {
    return remoteData.postSubscribeNotification(form);
  }

  @override
  Future<BaseResponse> createUpdateLocation(FormUpdateLocation form) {
    return remoteData.postUpdateLocation(form);
  }

  @override
  Future<BaseResponse<AppUserEntity>> createUpgradeVolunteer(FormUpgradeVolunteer form) {
    return remoteData.postUpgradeVolunteer(form);
  }

  @override
  Future<BaseResponse<AppUserEntity>> getMyProfile() {
    return remoteData.loadMyProfile();
  }

  @override
  Future<BaseResponse<AppUserEntity>> getUserById(String id) {
    return remoteData.loadUserById(id);
  }

  @override
  Future<BaseResponse<List<AppUserEntity>>> getUsers(FormSearch form) {
    return remoteData.loadUsers(form);
  }

  @override
  Future<UserMobileEntity> getUserMobileById(String id) async{
    var response = await remoteData.loadUserMobile(id);

    var data = response.data;

    return data?? UserMobileEntity();
  }

  @override
  Future<BaseResponse> createAddDocumentVolunteer(String id, FormAddDocument formAdd) {
    return remoteData.addDocumentVolunteer(id, formAdd);
  }

  @override
  Future<BaseResponse<List<ContactEntity>>> getContacts() {
    return remoteData.loadContacts();
  }


}