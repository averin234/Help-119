import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/location_entity.dart';

LocationEntity $LocationEntityFromJson(Map<String, dynamic> json) {
	final LocationEntity locationEntity = LocationEntity();
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		locationEntity.sId = sId;
	}
	final int? nid = jsonConvert.convert<int>(json['nid']);
	if (nid != null) {
		locationEntity.nid = nid;
	}
	final int? parentNid = jsonConvert.convert<int>(json['parent_nid']);
	if (parentNid != null) {
		locationEntity.parentNid = parentNid;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		locationEntity.name = name;
	}
	final int? serial = jsonConvert.convert<int>(json['serial']);
	if (serial != null) {
		locationEntity.serial = serial;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		locationEntity.type = type;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		locationEntity.latitude = latitude;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		locationEntity.longitude = longitude;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		locationEntity.status = status;
	}
	return locationEntity;
}

Map<String, dynamic> $LocationEntityToJson(LocationEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_id'] = entity.sId;
	data['nid'] = entity.nid;
	data['parent_nid'] = entity.parentNid;
	data['name'] = entity.name;
	data['serial'] = entity.serial;
	data['type'] = entity.type;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['status'] = entity.status;
	return data;
}