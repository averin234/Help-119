import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/my_location_entity.dart';

MyLocationEntity $MyLocationEntityFromJson(Map<String, dynamic> json) {
	final MyLocationEntity myLocationEntity = MyLocationEntity();
	final MyLocationLocation? location = jsonConvert.convert<MyLocationLocation>(json['location']);
	if (location != null) {
		myLocationEntity.location = location;
	}
	return myLocationEntity;
}

Map<String, dynamic> $MyLocationEntityToJson(MyLocationEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['location'] = entity.location?.toJson();
	return data;
}

MyLocationLocation $MyLocationLocationFromJson(Map<String, dynamic> json) {
	final MyLocationLocation myLocationLocation = MyLocationLocation();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		myLocationLocation.type = type;
	}
	final List<double>? coordinates = jsonConvert.convertListNotNull<double>(json['coordinates']);
	if (coordinates != null) {
		myLocationLocation.coordinates = coordinates;
	}
	return myLocationLocation;
}

Map<String, dynamic> $MyLocationLocationToJson(MyLocationLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['coordinates'] =  entity.coordinates;
	return data;
}