import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/place_entity.dart';
import 'package:kreki119/app/data/model/response/hero_category_entity.dart';

import 'package:kreki119/app/data/model/response/my_location_entity.dart';

import 'package:kreki119/app/data/model/response/place_detail_entity.dart';


PlaceEntity $PlaceEntityFromJson(Map<String, dynamic> json) {
	final PlaceEntity placeEntity = PlaceEntity();
	final bool? isDeleted = jsonConvert.convert<bool>(json['is_deleted']);
	if (isDeleted != null) {
		placeEntity.isDeleted = isDeleted;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		placeEntity.sId = sId;
	}
	final HeroCategoryEntity? category = jsonConvert.convert<HeroCategoryEntity>(json['category']);
	if (category != null) {
		placeEntity.category = category;
	}
	final double? distance = jsonConvert.convert<double>(json['distance']);
	if (distance != null) {
		placeEntity.distance = distance;
	}
	final MyLocationLocation? location = jsonConvert.convert<MyLocationLocation>(json['location']);
	if (location != null) {
		placeEntity.location = location;
	}
	final PlaceDetailEntity? data = jsonConvert.convert<PlaceDetailEntity>(json['data']);
	if (data != null) {
		placeEntity.data = data;
	}
	return placeEntity;
}

Map<String, dynamic> $PlaceEntityToJson(PlaceEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['is_deleted'] = entity.isDeleted;
	data['_id'] = entity.sId;
	data['category'] = entity.category?.toJson();
	data['distance'] = entity.distance;
	data['location'] = entity.location?.toJson();
	data['data'] = entity.data?.toJson();
	return data;
}