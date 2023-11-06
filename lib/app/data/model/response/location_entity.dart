import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/location_entity.g.dart';

@JsonSerializable()
class LocationEntity {

	@JSONField(name: "_id")
	String? sId;
	int? nid;
	@JSONField(name: "parent_nid")
	int? parentNid;
	String? name;
	int? serial;
	int? type;
	double? latitude;
	double? longitude;
	int? status;
  
  LocationEntity();

  factory LocationEntity.fromJson(Map<String, dynamic> json) => $LocationEntityFromJson(json);

  Map<String, dynamic> toJson() => $LocationEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

	static List<LocationEntity> parseLocations(List<dynamic>? list){
		if(list == null) {
			return [];
		}

		final locations = <LocationEntity>[];

		for (final item in list){
			locations.add(LocationEntity.fromJson(item));
		}

		return locations;

	}
}
