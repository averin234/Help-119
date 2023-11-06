import 'dart:convert';

import 'package:kreki119/app/data/model/response/error_entity.dart';
import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/firebase_user_entity.g.dart';

@JsonSerializable()
class FirebaseUserEntity extends ErrorEntity{

	@JSONField(name: "_id")
	String? sId;
	@JSONField(name: "firebase_uid")
	String? firebaseUid;
	@JSONField(name: "is_verified")
	bool? isVerified;
	@JSONField(name: "is_sandbox")
	bool? isSandbox;
	@JSONField(name: "role_id")
	String? roleId;
	String? status;
	List<UserContact>? contacts;
	@JSONField(name: "is_deleted")
	bool? isDeleted;
	List<dynamic>? documents;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "full_name")
	String? fullName;
  
  FirebaseUserEntity();

  factory FirebaseUserEntity.fromJson(Map<String, dynamic> json) => $FirebaseUserEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => $FirebaseUserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserContact {

	String? name;
	@JSONField(name: "phone_number")
	String? phoneNumber;
	String? email;
	@JSONField(name: "is_default")
	bool? isDefault;
  
  UserContact();

  factory UserContact.fromJson(Map<String, dynamic> json) => $UserContactFromJson(json);

  Map<String, dynamic> toJson() => $UserContactToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}