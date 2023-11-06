import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/notification_payload_entity.dart';

NotificationPayloadEntity $NotificationPayloadEntityFromJson(Map<String, dynamic> json) {
	final NotificationPayloadEntity notificationPayloadEntity = NotificationPayloadEntity();
	final String? notificationType = jsonConvert.convert<String>(json['notification_type']);
	if (notificationType != null) {
		notificationPayloadEntity.notificationType = notificationType;
	}
	final NotificationPayloadItem? item = jsonConvert.convert<NotificationPayloadItem>(json['item']);
	if (item != null) {
		notificationPayloadEntity.item = item;
	}
	return notificationPayloadEntity;
}

Map<String, dynamic> $NotificationPayloadEntityToJson(NotificationPayloadEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['notification_type'] = entity.notificationType;
	data['item'] = entity.item?.toJson();
	return data;
}

NotificationPayloadItem $NotificationPayloadItemFromJson(Map<String, dynamic> json) {
	final NotificationPayloadItem notificationPayloadItem = NotificationPayloadItem();
	final NotificationPayloadItemLocation? location = jsonConvert.convert<NotificationPayloadItemLocation>(json['location']);
	if (location != null) {
		notificationPayloadItem.location = location;
	}
	final String? currentStatus = jsonConvert.convert<String>(json['current_status']);
	if (currentStatus != null) {
		notificationPayloadItem.currentStatus = currentStatus;
	}
	final List<dynamic>? photos = jsonConvert.convertListNotNull<dynamic>(json['photos']);
	if (photos != null) {
		notificationPayloadItem.photos = photos;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		notificationPayloadItem.createdAt = createdAt;
	}
	final dynamic victimName = jsonConvert.convert<dynamic>(json['victim_name']);
	if (victimName != null) {
		notificationPayloadItem.victimName = victimName;
	}
	final dynamic emergencyDescription = jsonConvert.convert<dynamic>(json['emergency_description']);
	if (emergencyDescription != null) {
		notificationPayloadItem.emergencyDescription = emergencyDescription;
	}
	final dynamic emergencyType = jsonConvert.convert<dynamic>(json['emergency_type']);
	if (emergencyType != null) {
		notificationPayloadItem.emergencyType = emergencyType;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		notificationPayloadItem.sId = sId;
	}
	final List<dynamic>? progress = jsonConvert.convertListNotNull<dynamic>(json['progress']);
	if (progress != null) {
		notificationPayloadItem.progress = progress;
	}
	final String? userId = jsonConvert.convert<String>(json['user_id']);
	if (userId != null) {
		notificationPayloadItem.userId = userId;
	}
	final int? iV = jsonConvert.convert<int>(json['__v']);
	if (iV != null) {
		notificationPayloadItem.iV = iV;
	}
	return notificationPayloadItem;
}

Map<String, dynamic> $NotificationPayloadItemToJson(NotificationPayloadItem entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['location'] = entity.location?.toJson();
	data['current_status'] = entity.currentStatus;
	data['photos'] =  entity.photos;
	data['created_at'] = entity.createdAt;
	data['victim_name'] = entity.victimName;
	data['emergency_description'] = entity.emergencyDescription;
	data['emergency_type'] = entity.emergencyType;
	data['_id'] = entity.sId;
	data['progress'] =  entity.progress;
	data['user_id'] = entity.userId;
	data['__v'] = entity.iV;
	return data;
}

NotificationPayloadItemLocation $NotificationPayloadItemLocationFromJson(Map<String, dynamic> json) {
	final NotificationPayloadItemLocation notificationPayloadItemLocation = NotificationPayloadItemLocation();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		notificationPayloadItemLocation.type = type;
	}
	final List<double>? coordinates = jsonConvert.convertListNotNull<double>(json['coordinates']);
	if (coordinates != null) {
		notificationPayloadItemLocation.coordinates = coordinates;
	}
	return notificationPayloadItemLocation;
}

Map<String, dynamic> $NotificationPayloadItemLocationToJson(NotificationPayloadItemLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['coordinates'] =  entity.coordinates;
	return data;
}