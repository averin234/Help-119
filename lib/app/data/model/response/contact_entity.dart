import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/contact_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ContactEntity {
	ContactCreatedAt? createdAt;
	String? phoneNumber;
	String? fullName;
	String? id;
	String? email;
	ContactUpdatedAt? updatedAt;

	ContactEntity();

	factory ContactEntity.fromJson(Map<String, dynamic> json) => $ContactEntityFromJson(json);

	Map<String, dynamic> toJson() => $ContactEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ContactCreatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	ContactCreatedAt();

	factory ContactCreatedAt.fromJson(Map<String, dynamic> json) => $ContactCreatedAtFromJson(json);

	Map<String, dynamic> toJson() => $ContactCreatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ContactUpdatedAt {
	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;

	ContactUpdatedAt();

	factory ContactUpdatedAt.fromJson(Map<String, dynamic> json) => $ContactUpdatedAtFromJson(json);

	Map<String, dynamic> toJson() => $ContactUpdatedAtToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}