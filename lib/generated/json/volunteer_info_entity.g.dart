import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/volunteer_info_entity.dart';

VolunteerInfoEntity $VolunteerInfoEntityFromJson(Map<String, dynamic> json) {
	final VolunteerInfoEntity volunteerInfoEntity = VolunteerInfoEntity();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		volunteerInfoEntity.status = status;
	}
	final String? volunteerType = jsonConvert.convert<String>(json['volunteer_type']);
	if (volunteerType != null) {
		volunteerInfoEntity.volunteerType = volunteerType;
	}
	final String? category = jsonConvert.convert<String>(json['category']);
	if (category != null) {
		volunteerInfoEntity.category = category;
	}
	final String? organizationName = jsonConvert.convert<String>(json['organization_name']);
	if (organizationName != null) {
		volunteerInfoEntity.organizationName = organizationName;
	}
	final String? jobType = jsonConvert.convert<String>(json['job_type']);
	if (jobType != null) {
		volunteerInfoEntity.jobType = jobType;
	}
	final int? yearWorkExperience = jsonConvert.convert<int>(json['year_work_experience']);
	if (yearWorkExperience != null) {
		volunteerInfoEntity.yearWorkExperience = yearWorkExperience;
	}
	final String? workingCity = jsonConvert.convert<String>(json['working_city']);
	if (workingCity != null) {
		volunteerInfoEntity.workingCity = workingCity;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		volunteerInfoEntity.description = description;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		volunteerInfoEntity.sId = sId;
	}
	return volunteerInfoEntity;
}

Map<String, dynamic> $VolunteerInfoEntityToJson(VolunteerInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['volunteer_type'] = entity.volunteerType;
	data['category'] = entity.category;
	data['organization_name'] = entity.organizationName;
	data['job_type'] = entity.jobType;
	data['year_work_experience'] = entity.yearWorkExperience;
	data['working_city'] = entity.workingCity;
	data['description'] = entity.description;
	data['_id'] = entity.sId;
	return data;
}