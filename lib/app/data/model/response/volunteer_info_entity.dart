import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/volunteer_info_entity.g.dart';

@JsonSerializable()
class VolunteerInfoEntity {

	String? status;
	@JSONField(name: "volunteer_type")
	String? volunteerType;
	String? category;
	@JSONField(name: "organization_name")
	String? organizationName;
	@JSONField(name: "job_type")
	String? jobType;
	@JSONField(name: "year_work_experience")
	int? yearWorkExperience;
	@JSONField(name: "working_city")
	String? workingCity;
	String? description;
	@JSONField(name: "_id")
	String? sId;
  
  VolunteerInfoEntity();

  factory VolunteerInfoEntity.fromJson(Map<String, dynamic> json) => $VolunteerInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $VolunteerInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}