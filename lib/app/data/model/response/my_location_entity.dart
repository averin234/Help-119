import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/my_location_entity.g.dart';

@JsonSerializable()
class MyLocationEntity {

	MyLocationLocation? location;
  
  MyLocationEntity();

  factory MyLocationEntity.fromJson(Map<String, dynamic> json) => $MyLocationEntityFromJson(json);

  Map<String, dynamic> toJson() => $MyLocationEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MyLocationLocation {

	String? type;
	List<double>? coordinates;
  
  MyLocationLocation();

  factory MyLocationLocation.fromJson(Map<String, dynamic> json) => $MyLocationLocationFromJson(json);

  Map<String, dynamic> toJson() => $MyLocationLocationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}