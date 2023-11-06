import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/notification_mobile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NotificationMobileEntity {
	String? pesan;
	String? currentStatus;
	String? idEmergency;
	String? customSound;



	NotificationMobileEntity();

	factory NotificationMobileEntity.fromJson(Map<String, dynamic> json) => $NotificationMobileEntityFromJson(json);

	Map<String, dynamic> toJson() => $NotificationMobileEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}