import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/province_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProvinceEntity {

	String? id;
	String? name;
	@JSONField(name: "alt_name")
	String? altName;
	double? latitude;
	double? longitude;
  
  ProvinceEntity();

  factory ProvinceEntity.fromJson(Map<String, dynamic> json) => $ProvinceEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProvinceEntityToJson(this);

  ProvinceEntity copyWith({String? id, String? name, String? altName, double? latitude, double? longitude}) {
      return ProvinceEntity()..id= id ?? this.id
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