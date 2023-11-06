import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/psc_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PscEntity {
	String? address;
	String? gender;
	String? idRole;
	int? latitude;
	bool? verified;
	String? fullName;
	String? photo;
	String? token;
	String? isPartner;
	String? fcm;
	PscCreatedAt? createdAt;
	String? password;
	String? phoneNumber;
	bool? isDeleted;
	String? organization;
	String? idJobplace;
	String? id;
	String? heroCategory;
	bool? isSandbox;
	List<dynamic>? contacts;
	String? email;
	int? longitude;
	String? status;
	PscUpdatedAt? updatedAt;
	int? jarak;
	String? satuan;

	PscEntity();

	factory PscEntity.fromJson(Map<String, dynamic> json) => $PscEntityFromJson(json);

	Map<String, dynamic> toJson() => $PscEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PscCreatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	PscCreatedAt();

	factory PscCreatedAt.fromJson(Map<String, dynamic> json) => $PscCreatedAtFromJson(json);

	Map<String, dynamic> toJson() => $PscCreatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PscUpdatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	PscUpdatedAt();

	factory PscUpdatedAt.fromJson(Map<String, dynamic> json) => $PscUpdatedAtFromJson(json);

	Map<String, dynamic> toJson() => $PscUpdatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}