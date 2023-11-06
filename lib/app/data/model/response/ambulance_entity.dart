import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/ambulance_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AmbulanceEntity {
	AmbulanceCreatedAt? createdAt;
	String? phoneNumber;
	String? id;
	String? idCategories;
	String? alamat;
	String? satuan;
	int? jarak;
	bool? isDeleted;
	double? latitude;
	String? name;
	AmbulanceUpdateAt? updateAt;
	double? longitude;

	AmbulanceEntity();

	factory AmbulanceEntity.fromJson(Map<String, dynamic> json) => $AmbulanceEntityFromJson(json);

	Map<String, dynamic> toJson() => $AmbulanceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AmbulanceCreatedAt {
	@JSONField(name: "_seconds")
	double? dSeconds;
	@JSONField(name: "_nanoseconds")
	double? dNanoseconds;

	AmbulanceCreatedAt();

	factory AmbulanceCreatedAt.fromJson(Map<String, dynamic> json) => $AmbulanceCreatedAtFromJson(json);

	Map<String, dynamic> toJson() => $AmbulanceCreatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AmbulanceUpdateAt {
	@JSONField(name: "_seconds")
	double? dSeconds;
	@JSONField(name: "_nanoseconds")
	double? dNanoseconds;

	AmbulanceUpdateAt();

	factory AmbulanceUpdateAt.fromJson(Map<String, dynamic> json) => $AmbulanceUpdateAtFromJson(json);

	Map<String, dynamic> toJson() => $AmbulanceUpdateAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}