import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/firebase_user_entity.dart';
import 'package:kreki119/app/data/model/response/error_entity.dart';


FirebaseUserEntity $FirebaseUserEntityFromJson(Map<String, dynamic> json) {
	final FirebaseUserEntity firebaseUserEntity = FirebaseUserEntity();
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		firebaseUserEntity.sId = sId;
	}
	final String? firebaseUid = jsonConvert.convert<String>(json['firebase_uid']);
	if (firebaseUid != null) {
		firebaseUserEntity.firebaseUid = firebaseUid;
	}
	final bool? isVerified = jsonConvert.convert<bool>(json['is_verified']);
	if (isVerified != null) {
		firebaseUserEntity.isVerified = isVerified;
	}
	final bool? isSandbox = jsonConvert.convert<bool>(json['is_sandbox']);
	if (isSandbox != null) {
		firebaseUserEntity.isSandbox = isSandbox;
	}
	final String? roleId = jsonConvert.convert<String>(json['role_id']);
	if (roleId != null) {
		firebaseUserEntity.roleId = roleId;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		firebaseUserEntity.status = status;
	}
	final List<UserContact>? contacts = jsonConvert.convertListNotNull<UserContact>(json['contacts']);
	if (contacts != null) {
		firebaseUserEntity.contacts = contacts;
	}
	final bool? isDeleted = jsonConvert.convert<bool>(json['is_deleted']);
	if (isDeleted != null) {
		firebaseUserEntity.isDeleted = isDeleted;
	}
	final List<dynamic>? documents = jsonConvert.convertListNotNull<dynamic>(json['documents']);
	if (documents != null) {
		firebaseUserEntity.documents = documents;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		firebaseUserEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		firebaseUserEntity.updatedAt = updatedAt;
	}
	final String? fullName = jsonConvert.convert<String>(json['full_name']);
	if (fullName != null) {
		firebaseUserEntity.fullName = fullName;
	}
	return firebaseUserEntity;
}

Map<String, dynamic> $FirebaseUserEntityToJson(FirebaseUserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_id'] = entity.sId;
	data['firebase_uid'] = entity.firebaseUid;
	data['is_verified'] = entity.isVerified;
	data['is_sandbox'] = entity.isSandbox;
	data['role_id'] = entity.roleId;
	data['status'] = entity.status;
	data['contacts'] =  entity.contacts?.map((v) => v.toJson()).toList();
	data['is_deleted'] = entity.isDeleted;
	data['documents'] =  entity.documents;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['full_name'] = entity.fullName;
	return data;
}

UserContact $UserContactFromJson(Map<String, dynamic> json) {
	final UserContact userContact = UserContact();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userContact.name = name;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phone_number']);
	if (phoneNumber != null) {
		userContact.phoneNumber = phoneNumber;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userContact.email = email;
	}
	final bool? isDefault = jsonConvert.convert<bool>(json['is_default']);
	if (isDefault != null) {
		userContact.isDefault = isDefault;
	}
	return userContact;
}

Map<String, dynamic> $UserContactToJson(UserContact entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['phone_number'] = entity.phoneNumber;
	data['email'] = entity.email;
	data['is_default'] = entity.isDefault;
	return data;
}