import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/hero_category_entity.g.dart';

@JsonSerializable()
class HeroCategoryEntity {

	@JSONField(name: "_id")
	String? sId;
	String? icon;
	int? staticIcon;
	String? title;
	String? type;
	String? data;
  
  HeroCategoryEntity();

  factory HeroCategoryEntity.fromJson(Map<String, dynamic> json) => $HeroCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => $HeroCategoryEntityToJson(this);

  HeroCategoryEntity copyWith({String? sId, String? icon, int? staticIcon, String? title, String? type, String? data}) {
      return HeroCategoryEntity()..sId= sId ?? this.sId
			..icon= icon ?? this.icon
			..staticIcon= staticIcon ?? this.staticIcon
			..title= title ?? this.title
			..type= type ?? this.type
			..data= data ?? this.data;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}