import 'dart:convert';

import 'package:kreki119/app/data/model/response/hero_category_entity.dart';
import 'package:kreki119/app/data/model/response/my_location_entity.dart';
import 'package:kreki119/app/data/model/response/place_detail_entity.dart';
import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/place_entity.g.dart';

@JsonSerializable()
class PlaceEntity {

	@JSONField(name: "is_deleted")
	bool? isDeleted;
	@JSONField(name: "_id")
	String? sId;
	HeroCategoryEntity? category;
	double? distance;
	MyLocationLocation? location;
	PlaceDetailEntity? data;
  
  PlaceEntity();

  factory PlaceEntity.fromJson(Map<String, dynamic> json) => $PlaceEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlaceEntityToJson(this);

  PlaceEntity copyWith({bool? isDeleted, String? sId, HeroCategoryEntity? category,
		double? distance, MyLocationLocation? location, PlaceDetailEntity? data}) {
      return PlaceEntity()..isDeleted= isDeleted ?? this.isDeleted
			..sId= sId ?? this.sId
			..category= category ?? this.category
			..distance= distance ?? this.distance
			..location= location ?? this.location
			..data= data ?? this.data;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}