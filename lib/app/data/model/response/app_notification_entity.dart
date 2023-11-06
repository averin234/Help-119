import 'dart:convert';

import 'package:kreki119/generated/json/app_notification_entity.g.dart';
import 'package:kreki119/generated/json/base/json_field.dart';

@JsonSerializable()
class AppNotificationEntity {

	int? successCount;
	int? failureCount;
  String? fcm;
	List<dynamic>? errors;
  
  AppNotificationEntity();

  factory AppNotificationEntity.fromJson(Map<String, dynamic> json) => $AppNotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppNotificationEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}