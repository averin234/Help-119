import 'dart:convert';

import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/my_location_entity.dart';
import 'package:kreki119/app/data/model/response/progress_entity.dart';
import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/emergency_entity.g.dart';

@JsonSerializable()
class EmergencyEntity {

	MyLocationLocation? location;
	@JSONField(name: "current_status")
	String? currentStatus;
	List<String>? photos;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "victim_name")
	String? victimName;
	@JSONField(name: "emergency_description")
	String? emergencyDescription;
	@JSONField(name: "emergency_type")
	String? emergencyType;
	@JSONField(name: "_id")
	String? sId;
	List<ProgressEntity>? progress;
	@JSONField(name: "user_id")
	AppUserEntity? userId;
	@JSONField(name: "__v")
	int? iV;
	double? distance;
  
  EmergencyEntity();

  factory EmergencyEntity.fromJson(Map<String, dynamic> json) => $EmergencyEntityFromJson(json);

  Map<String, dynamic> toJson() => $EmergencyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}