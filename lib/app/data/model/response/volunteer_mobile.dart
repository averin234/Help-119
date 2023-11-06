import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/volunteer_mobile.g.dart';
import 'dart:convert';

@JsonSerializable()
class VolunteerMobile {
	String? address;
	String? birthdate;
	String? photoCertificate;
	String? fullName;
	VolunteerMobileCreatedAt? createdAt;
	String? addressOffice;
	String? phoneNumber;
	bool? isDeleted;
	String? identityNumber;
	String? addressDomicile;
	String? id;
	String? email;
	String? photoKtp;
	String? status;
	VolunteerMobileUpdatedAt? updatedAt;

	VolunteerMobile();

	factory VolunteerMobile.fromJson(Map<String, dynamic> json) => $VolunteerMobileFromJson(json);

	Map<String, dynamic> toJson() => $VolunteerMobileToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VolunteerMobileCreatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	VolunteerMobileCreatedAt();

	factory VolunteerMobileCreatedAt.fromJson(Map<String, dynamic> json) => $VolunteerMobileCreatedAtFromJson(json);

	Map<String, dynamic> toJson() => $VolunteerMobileCreatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VolunteerMobileUpdatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	VolunteerMobileUpdatedAt();

	factory VolunteerMobileUpdatedAt.fromJson(Map<String, dynamic> json) => $VolunteerMobileUpdatedAtFromJson(json);

	Map<String, dynamic> toJson() => $VolunteerMobileUpdatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}