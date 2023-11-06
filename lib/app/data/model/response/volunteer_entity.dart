import 'package:kreki119/app/data/model/response/contact_entity.dart';
import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/volunteer_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class VolunteerEntity {
	int? jarak;
	String? address;
	String? gender;
	String? idRole;
	double? latitude;
	bool? verified;
	String? photo;
	String? fullName;
	String? token;
	bool? isPartner;
	String? fcm;
	// VolunteerCreatedAt? createdAt;
	String? password;
	String? phoneNumber;
	bool? isDeleted;
	String? organization;
	String? idJobplace;
	String? heroCategory;
	String? id;
	bool? isSandbox;
	List<ContactEntity>? contacts;
	String? email;
	// VolunteerUpdatedAt? updatedAt;
	double? longitude;
	String? status;
	String? satuan;

	VolunteerEntity();

	factory VolunteerEntity.fromJson(Map<String, dynamic> json) => $VolunteerEntityFromJson(json);

	Map<String, dynamic> toJson() => $VolunteerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VolunteerCreatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	VolunteerCreatedAt();

	factory VolunteerCreatedAt.fromJson(Map<String, dynamic> json) => $VolunteerCreatedAtFromJson(json);

	Map<String, dynamic> toJson() => $VolunteerCreatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VolunteerUpdatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	VolunteerUpdatedAt();

	factory VolunteerUpdatedAt.fromJson(Map<String, dynamic> json) => $VolunteerUpdatedAtFromJson(json);

	Map<String, dynamic> toJson() => $VolunteerUpdatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}