import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/city_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CityEntity {

	String? id;
	@JSONField(name: "province_id")
	String? provinceId;
	String? name;
	@JSONField(name: "alt_name")
	String? altName;
	double? latitude;
	double? longitude;
  
  CityEntity();

  factory CityEntity.fromJson(Map<String, dynamic> json) => $CityEntityFromJson(json);

  Map<String, dynamic> toJson() => $CityEntityToJson(this);

  CityEntity copyWith({String? id, String? provinceId, String? name, String? altName, double? latitude, double? longitude}) {
      return CityEntity()..id= id ?? this.id
			..provinceId= provinceId ?? this.provinceId
			..name= name ?? this.name
			..altName= altName ?? this.altName
			..latitude= latitude ?? this.latitude
			..longitude= longitude ?? this.longitude;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}