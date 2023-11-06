import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/notification_payload_entity.g.dart';

@JsonSerializable()
class NotificationPayloadEntity {

	@JSONField(name: "notification_type")
	String? notificationType;
	NotificationPayloadItem? item;
  
  NotificationPayloadEntity();

  factory NotificationPayloadEntity.fromJson(Map<String, dynamic> json) => $NotificationPayloadEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationPayloadEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationPayloadItem {

	NotificationPayloadItemLocation? location;
	@JSONField(name: "current_status")
	String? currentStatus;
	List<dynamic>? photos;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "victim_name")
	dynamic victimName;
	@JSONField(name: "emergency_description")
	dynamic emergencyDescription;
	@JSONField(name: "emergency_type")
	dynamic emergencyType;
	@JSONField(name: "_id")
	String? sId;
	List<dynamic>? progress;
	@JSONField(name: "user_id")
	String? userId;
	@JSONField(name: "__v")
	int? iV;
  
  NotificationPayloadItem();

  factory NotificationPayloadItem.fromJson(Map<String, dynamic> json) => $NotificationPayloadItemFromJson(json);

  Map<String, dynamic> toJson() => $NotificationPayloadItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationPayloadItemLocation {

	String? type;
	List<double>? coordinates;
  
  NotificationPayloadItemLocation();

  factory NotificationPayloadItemLocation.fromJson(Map<String, dynamic> json) => $NotificationPayloadItemLocationFromJson(json);

  Map<String, dynamic> toJson() => $NotificationPayloadItemLocationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}