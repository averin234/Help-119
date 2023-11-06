import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/firebase_user_entity.dart';

import 'package:kreki119/app/data/model/response/my_location_entity.dart';

import 'package:kreki119/app/data/model/response/volunteer_info_entity.dart';


AppUserEntity $AppUserEntityFromJson(Map<String, dynamic> json) {
	final AppUserEntity appUserEntity = AppUserEntity();
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		appUserEntity.sId = sId;
	}
	final String? firebaseUid = jsonConvert.convert<String>(json['firebase_uid']);
	if (firebaseUid != null) {
		appUserEntity.firebaseUid = firebaseUid;
	}
	final bool? isVerified = jsonConvert.convert<bool>(json['is_verified']);
	if (isVerified != null) {
		appUserEntity.isVerified = isVerified;
	}
	final bool? isSandbox = jsonConvert.convert<bool>(json['is_sandbox']);
	if (isSandbox != null) {
		appUserEntity.isSandbox = isSandbox;
	}
	final String? roleId = jsonConvert.convert<String>(json['role_id']);
	if (roleId != null) {
		appUserEntity.roleId = roleId;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		appUserEntity.status = status;
	}
	final List<UserContact>? contacts = jsonConvert.convertListNotNull<UserContact>(json['contacts']);
	if (contacts != null) {
		appUserEntity.contacts = contacts;
	}
	final bool? isDeleted = jsonConvert.convert<bool>(json['is_deleted']);
	if (isDeleted != null) {
		appUserEntity.isDeleted = isDeleted;
	}
	final List<dynamic>? documents = jsonConvert.convertListNotNull<dynamic>(json['documents']);
	if (documents != null) {
		appUserEntity.documents = documents;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		appUserEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		appUserEntity.updatedAt = updatedAt;
	}
	final String? fullName = jsonConvert.convert<String>(json['full_name']);
	if (fullName != null) {
		appUserEntity.fullName = fullName;
	}
	final String? birthdate = jsonConvert.convert<String>(json['birthdate']);
	if (birthdate != null) {
		appUserEntity.birthdate = birthdate;
	}
	final String? citizenId = jsonConvert.convert<String>(json['citizen_id']);
	if (citizenId != null) {
		appUserEntity.citizenId = citizenId;
	}
	final String? city = jsonConvert.convert<String>(json['city']);
	if (city != null) {
		appUserEntity.city = city;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		appUserEntity.gender = gender;
	}
	final String? province = jsonConvert.convert<String>(json['province']);
	if (province != null) {
		appUserEntity.province = province;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		appUserEntity.address = address;
	}
	final String? userVolunteerType = jsonConvert.convert<String>(json['user_volunteer_type']);
	if (userVolunteerType != null) {
		appUserEntity.userVolunteerType = userVolunteerType;
	}
	final String? heroCategory = jsonConvert.convert<String>(json['hero_category']);
	if (heroCategory != null) {
		appUserEntity.heroCategory = heroCategory;
	}
	final dynamic organizationName = jsonConvert.convert<dynamic>(json['organization_name']);
	if (organizationName != null) {
		appUserEntity.organizationName = organizationName;
	}
	final String? jobType = jsonConvert.convert<String>(json['job_type']);
	if (jobType != null) {
		appUserEntity.jobType = jobType;
	}
	final int? yearWorkExperience = jsonConvert.convert<int>(json['year_work_experience']);
	if (yearWorkExperience != null) {
		appUserEntity.yearWorkExperience = yearWorkExperience;
	}
	final String? workingCity = jsonConvert.convert<String>(json['working_city']);
	if (workingCity != null) {
		appUserEntity.workingCity = workingCity;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		appUserEntity.description = description;
	}
	final MyLocationLocation? myLocation = jsonConvert.convert<MyLocationLocation>(json['location']);
	if (myLocation != null) {
		appUserEntity.myLocation = myLocation;
	}
	final VolunteerInfoEntity? volunteerInfo = jsonConvert.convert<VolunteerInfoEntity>(json['volunteer_info']);
	if (volunteerInfo != null) {
		appUserEntity.volunteerInfo = volunteerInfo;
	}
	return appUserEntity;
}

Map<String, dynamic> $AppUserEntityToJson(AppUserEntity entity) {
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
	data['birthdate'] = entity.birthdate;
	data['citizen_id'] = entity.citizenId;
	data['city'] = entity.city;
	data['gender'] = entity.gender;
	data['province'] = entity.province;
	data['address'] = entity.address;
	data['user_volunteer_type'] = entity.userVolunteerType;
	data['hero_category'] = entity.heroCategory;
	data['organization_name'] = entity.organizationName;
	data['job_type'] = entity.jobType;
	data['year_work_experience'] = entity.yearWorkExperience;
	data['working_city'] = entity.workingCity;
	data['description'] = entity.description;
	data['location'] = entity.myLocation?.toJson();
	data['volunteer_info'] = entity.volunteerInfo?.toJson();
	return data;
}