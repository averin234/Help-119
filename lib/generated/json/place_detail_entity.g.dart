import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/place_detail_entity.dart';

PlaceDetailEntity $PlaceDetailEntityFromJson(Map<String, dynamic> json) {
	final PlaceDetailEntity placeDetailEntity = PlaceDetailEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		placeDetailEntity.name = name;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		placeDetailEntity.phone = phone;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		placeDetailEntity.address = address;
	}
	return placeDetailEntity;
}

Map<String, dynamic> $PlaceDetailEntityToJson(PlaceDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['phone'] = entity.phone;
	data['address'] = entity.address;
	return data;
}