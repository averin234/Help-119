import 'dart:convert';

import 'package:kreki119/app/data/model/response/firebase_user_entity.dart';
import 'package:kreki119/app/data/model/response/my_location_entity.dart';
import 'package:kreki119/app/data/model/response/volunteer_info_entity.dart';
import 'package:kreki119/generated/json/app_user_entity.g.dart';
import 'package:kreki119/generated/json/base/json_field.dart';


@JsonSerializable()
class AppUserEntity {

	@JSONField(name: "_id")
	String? sId;
	@JSONField(name: "firebase_uid")
	String? firebaseUid;
	@JSONField(name: "is_verified")
	bool? isVerified;
	@JSONField(name: "is_sandbox")
	bool? isSandbox;
	@JSONField(name: "role_id")
	String? roleId;
	String? status;
	List<UserContact>? contacts;
	@JSONField(name: "is_deleted")
	bool? isDeleted;
	List<dynamic>? documents;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "full_name")
	String? fullName;
	String? birthdate;
	@JSONField(name: "citizen_id")
	String? citizenId;
	String? city;
	String? gender;
	String? province;
	String? address;
	@JSONField(name: "user_volunteer_type")
	String? userVolunteerType;
	@JSONField(name: "hero_category")
	String? heroCategory;
	@JSONField(name: "organization_name")
	dynamic organizationName;
	@JSONField(name: "job_type")
	String? jobType;
	@JSONField(name: "year_work_experience")
	int? yearWorkExperience;
	@JSONField(name: "working_city")
	String? workingCity;
	String? description;
	@JSONField(name: "location")
	MyLocationLocation? myLocation;
	@JSONField(name: "volunteer_info")
	VolunteerInfoEntity? volunteerInfo;
  
  AppUserEntity();

  factory AppUserEntity.fromJson(Map<String, dynamic> json) => $AppUserEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppUserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}