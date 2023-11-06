import 'dart:convert';

import 'package:kreki119/generated/json/assets_entity.g.dart';
import 'package:kreki119/generated/json/base/json_field.dart';

@JsonSerializable()
class AssetsEntity {

	String? filename;
	@JSONField(name: "path_location")
	String? pathLocation;
	@JSONField(name: "original_filename")
	String? originalFilename;
	@JSONField(name: "file_type")
	String? fileType;
	@JSONField(name: "created_by")
	String? createdBy;
	@JSONField(name: "is_deleted")
	bool? isDeleted;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "deleted_at")
	String? deletedAt;
	@JSONField(name: "_id")
	String? sId;
	@JSONField(name: "__v")
	int? iV;
  
  AssetsEntity();

  factory AssetsEntity.fromJson(Map<String, dynamic> json) => $AssetsEntityFromJson(json);

  Map<String, dynamic> toJson() => $AssetsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}