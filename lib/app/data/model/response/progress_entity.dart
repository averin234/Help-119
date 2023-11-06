import 'dart:convert';

import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/progress_entity.g.dart';

@JsonSerializable()
class ProgressEntity {

	String? status;
	List<String>? photos;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "_id")
	String? sId;
  @JSONField(name: "user_id")
  AppUserEntity? userId;
  
  ProgressEntity();

  factory ProgressEntity.fromJson(Map<String, dynamic> json) => $ProgressEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProgressEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}