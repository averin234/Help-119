import 'package:kreki119/app/data/model/form/Form_add_document.dart';
import 'package:kreki119/app/data/model/form/Form_update_profile.dart';
import 'package:kreki119/app/data/model/response/app_notification_entity.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';

import '../../model/form/FormUpgradeVolunteer.dart';
import '../../model/form/Form_add_contact.dart';
import '../../model/form/Form_notification_subscribe.dart';
import '../../model/form/Form_search.dart';
import '../../model/form/form_update_location.dart';
import '../../model/response/app_user_entity.dart';
import '../../model/response/base_response.dart';
import '../../model/response/user_mobile_entity.dart';

abstract class UserRepository{
  Future<BaseResponse<List<AppUserEntity>>> getUsers(FormSearch form);
  Future<BaseResponse<AppUserEntity>> getMyProfile();
  Future<BaseResponse<AppUserEntity>> getUserById(String id);
  Future<BaseResponse> createUpdateLocation(FormUpdateLocation form);
  Future<BaseResponse> createContact(FormAddContact form);
  Future<BaseResponse> updateSubscribeNotification(FormNotificationSubscribe form);
  Future<BaseResponse<AppUserEntity>> createUpgradeVolunteer(FormUpgradeVolunteer form);
  Future<UserMobileEntity> getUserMobileById(String id);
  Future<BaseResponse> createAddDocumentVolunteer(String id, FormAddDocument formAdd);
  Future<BaseResponse<List<ContactEntity>>> getContacts();
}