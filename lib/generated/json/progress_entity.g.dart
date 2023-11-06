import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/progress_entity.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';


ProgressEntity $ProgressEntityFromJson(Map<String, dynamic> json) {
	final ProgressEntity progressEntity = ProgressEntity();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		progressEntity.status = status;
	}
	final List<String>? photos = jsonConvert.convertListNotNull<String>(json['photos']);
	if (photos != null) {
		progressEntity.photos = photos;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		progressEntity.updatedAt = updatedAt;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		progressEntity.sId = sId;
	}
	final AppUserEntity? userId = jsonConvert.convert<AppUserEntity>(json['user_id']);
	if (userId != null) {
		progressEntity.userId = userId;
	}
	return progressEntity;
}

Map<String, dynamic> $ProgressEntityToJson(ProgressEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['photos'] =  entity.photos;
	data['updated_at'] = entity.updatedAt;
	data['_id'] = entity.sId;
	data['user_id'] = entity.userId?.toJson();
	return data;
}