import 'package:kreki119/app/data/model/form/FormUpgradeVolunteer.dart';
import 'package:kreki119/app/data/model/form/Form_add_contact.dart';
import 'package:kreki119/app/data/model/form/Form_add_document.dart';
import 'package:kreki119/app/data/model/form/Form_notification_subscribe.dart';
import 'package:kreki119/app/data/model/form/Form_search.dart';
import 'package:kreki119/app/data/model/form/Form_update_profile.dart';
import 'package:kreki119/app/data/model/form/form_update_location.dart';
import 'package:kreki119/app/data/model/response/app_notification_entity.dart';
import 'package:kreki119/app/data/model/response/base_response.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';

import '../../model/response/app_user_entity.dart';

abstract class UserRemoteData{

  @Deprecated("")
  Future<BaseResponse<List<AppUserEntity>>> loadUsers(FormSearch form);
  @Deprecated("user loadUserMobile instead")
  Future<BaseResponse<AppUserEntity>> loadMyProfile();
  @Deprecated("user loadUserMobile instead")
  Future<BaseResponse<AppUserEntity>> loadUserById(String id);
  @Deprecated("use addDocumentVolunteer instead")
  Future<BaseResponse<AppUserEntity>> postUpgradeVolunteer(FormUpgradeVolunteer form);

  Future<BaseResponse> postUpdateLocation(FormUpdateLocation form);
  Future<BaseResponse> postContact(FormAddContact form);
  Future<BaseResponse> postSubscribeNotification(FormNotificationSubscribe form);
  Future<BaseResponse<UserMobileEntity>> loadUserMobile(String id);
  Future<BaseResponse> addDocumentVolunteer(String id, FormAddDocument formAdd);
  Future<BaseResponse<List<ContactEntity>>> loadContacts();

}