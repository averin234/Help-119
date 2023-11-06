import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/city_entity.dart';

CityEntity $CityEntityFromJson(Map<String, dynamic> json) {
	final CityEntity cityEntity = CityEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		cityEntity.id = id;
	}
	final String? provinceId = jsonConvert.convert<String>(json['province_id']);
	if (provinceId != null) {
		cityEntity.provinceId = provinceId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		cityEntity.name = name;
	}
	final String? altName = jsonConvert.convert<String>(json['alt_name']);
	if (altName != null) {
		cityEntity.altName = altName;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		cityEntity.latitude = latitude;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		cityEntity.longitude = longitude;
	}
	return cityEntity;
}

Map<String, dynamic> $CityEntityToJson(CityEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['province_id'] = entity.provinceId;
	data['name'] = entity.name;
	data['alt_name'] = entity.altName;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}