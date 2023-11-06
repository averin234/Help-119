import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/hero_category_entity.dart';

HeroCategoryEntity $HeroCategoryEntityFromJson(Map<String, dynamic> json) {
	final HeroCategoryEntity heroCategoryEntity = HeroCategoryEntity();
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		heroCategoryEntity.sId = sId;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		heroCategoryEntity.icon = icon;
	}
	final int? staticIcon = jsonConvert.convert<int>(json['staticIcon']);
	if (staticIcon != null) {
		heroCategoryEntity.staticIcon = staticIcon;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		heroCategoryEntity.title = title;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		heroCategoryEntity.type = type;
	}
	final String? data = jsonConvert.convert<String>(json['data']);
	if (data != null) {
		heroCategoryEntity.data = data;
	}
	return heroCategoryEntity;
}

Map<String, dynamic> $HeroCategoryEntityToJson(HeroCategoryEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_id'] = entity.sId;
	data['icon'] = entity.icon;
	data['staticIcon'] = entity.staticIcon;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['data'] = entity.data;
	return data;
}