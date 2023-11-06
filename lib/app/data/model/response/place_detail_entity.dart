import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/place_detail_entity.g.dart';

@JsonSerializable()
class PlaceDetailEntity {

	String? name;
	String? phone;
	String? address;
  
  PlaceDetailEntity();

  factory PlaceDetailEntity.fromJson(Map<String, dynamic> json) => $PlaceDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlaceDetailEntityToJson(this);

  PlaceDetailEntity copyWith({String? name, String? phone, String? address}) {
      return PlaceDetailEntity()..name= name ?? this.name
			..phone= phone ?? this.phone
			..address= address ?? this.address;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}