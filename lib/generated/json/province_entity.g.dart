import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/province_entity.dart';

ProvinceEntity $ProvinceEntityFromJson(Map<String, dynamic> json) {
	final ProvinceEntity provinceEntity = ProvinceEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		provinceEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		provinceEntity.name = name;
	}
	final String? altName = jsonConvert.convert<String>(json['alt_name']);
	if (altName != null) {
		provinceEntity.altName = altName;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		provinceEntity.latitude = latitude;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		provinceEntity.longitude = longitude;
	}
	return provinceEntity;
}

Map<String, dynamic> $ProvinceEntityToJson(ProvinceEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['alt_name'] = entity.altName;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}