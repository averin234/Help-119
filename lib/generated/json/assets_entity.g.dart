import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/assets_entity.dart';

AssetsEntity $AssetsEntityFromJson(Map<String, dynamic> json) {
	final AssetsEntity assetsEntity = AssetsEntity();
	final String? filename = jsonConvert.convert<String>(json['filename']);
	if (filename != null) {
		assetsEntity.filename = filename;
	}
	final String? pathLocation = jsonConvert.convert<String>(json['path_location']);
	if (pathLocation != null) {
		assetsEntity.pathLocation = pathLocation;
	}
	final String? originalFilename = jsonConvert.convert<String>(json['original_filename']);
	if (originalFilename != null) {
		assetsEntity.originalFilename = originalFilename;
	}
	final String? fileType = jsonConvert.convert<String>(json['file_type']);
	if (fileType != null) {
		assetsEntity.fileType = fileType;
	}
	final String? createdBy = jsonConvert.convert<String>(json['created_by']);
	if (createdBy != null) {
		assetsEntity.createdBy = createdBy;
	}
	final bool? isDeleted = jsonConvert.convert<bool>(json['is_deleted']);
	if (isDeleted != null) {
		assetsEntity.isDeleted = isDeleted;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		assetsEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		assetsEntity.updatedAt = updatedAt;
	}
	final String? deletedAt = jsonConvert.convert<String>(json['deleted_at']);
	if (deletedAt != null) {
		assetsEntity.deletedAt = deletedAt;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		assetsEntity.sId = sId;
	}
	final int? iV = jsonConvert.convert<int>(json['__v']);
	if (iV != null) {
		assetsEntity.iV = iV;
	}
	return assetsEntity;
}

Map<String, dynamic> $AssetsEntityToJson(AssetsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['filename'] = entity.filename;
	data['path_location'] = entity.pathLocation;
	data['original_filename'] = entity.originalFilename;
	data['file_type'] = entity.fileType;
	data['created_by'] = entity.createdBy;
	data['is_deleted'] = entity.isDeleted;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['deleted_at'] = entity.deletedAt;
	data['_id'] = entity.sId;
	data['__v'] = entity.iV;
	return data;
}