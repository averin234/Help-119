import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/emergency_entity.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';

import 'package:kreki119/app/data/model/response/my_location_entity.dart';

import 'package:kreki119/app/data/model/response/progress_entity.dart';


EmergencyEntity $EmergencyEntityFromJson(Map<String, dynamic> json) {
	final EmergencyEntity emergencyEntity = EmergencyEntity();
	final MyLocationLocation? location = jsonConvert.convert<MyLocationLocation>(json['location']);
	if (location != null) {
		emergencyEntity.location = location;
	}
	final String? currentStatus = jsonConvert.convert<String>(json['current_status']);
	if (currentStatus != null) {
		emergencyEntity.currentStatus = currentStatus;
	}
	final List<String>? photos = jsonConvert.convertListNotNull<String>(json['photos']);
	if (photos != null) {
		emergencyEntity.photos = photos;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		emergencyEntity.createdAt = createdAt;
	}
	final String? victimName = jsonConvert.convert<String>(json['victim_name']);
	if (victimName != null) {
		emergencyEntity.victimName = victimName;
	}
	final String? emergencyDescription = jsonConvert.convert<String>(json['emergency_description']);
	if (emergencyDescription != null) {
		emergencyEntity.emergencyDescription = emergencyDescription;
	}
	final String? emergencyType = jsonConvert.convert<String>(json['emergency_type']);
	if (emergencyType != null) {
		emergencyEntity.emergencyType = emergencyType;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		emergencyEntity.sId = sId;
	}
	final List<ProgressEntity>? progress = jsonConvert.convertListNotNull<ProgressEntity>(json['progress']);
	if (progress != null) {
		emergencyEntity.progress = progress;
	}
	final AppUserEntity? userId = jsonConvert.convert<AppUserEntity>(json['user_id']);
	if (userId != null) {
		emergencyEntity.userId = userId;
	}
	final int? iV = jsonConvert.convert<int>(json['__v']);
	if (iV != null) {
		emergencyEntity.iV = iV;
	}
	final double? distance = jsonConvert.convert<double>(json['distance']);
	if (distance != null) {
		emergencyEntity.distance = distance;
	}
	return emergencyEntity;
}

Map<String, dynamic> $EmergencyEntityToJson(EmergencyEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['location'] = entity.location?.toJson();
	data['current_status'] = entity.currentStatus;
	data['photos'] =  entity.photos;
	data['created_at'] = entity.createdAt;
	data['victim_name'] = entity.victimName;
	data['emergency_description'] = entity.emergencyDescription;
	data['emergency_type'] = entity.emergencyType;
	data['_id'] = entity.sId;
	data['progress'] =  entity.progress?.map((v) => v.toJson()).toList();
	data['user_id'] = entity.userId?.toJson();
	data['__v'] = entity.iV;
	data['distance'] = entity.distance;
	return data;
}