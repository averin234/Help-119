import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/user_jwt_entity.g.dart';

@Deprecated("check user entity insteand")
@JsonSerializable()
class UserJwtEntity {

	String? name;
	String? picture;
	@JSONField(name: "USER_INTERNAL_ID")
	String? userInternalId;
	@JSONField(name: "IS_ACTIVE")
	bool? isActive;
	@JSONField(name: "ROLE_GROUP")
	String? roleGroup;
	@JSONField(name: "ROLE_GROUP_NAME")
	String? roleGroupName;
	String? iss;
	String? aud;
	@JSONField(name: "auth_time")
	int? authTime;
	@JSONField(name: "user_id")
	String? userId;
	String? sub;
	int? iat;
	int? exp;
	String? email;
	@JSONField(name: "email_verified")
	bool? emailVerified;
	UserJwtFirebase? firebase;
  
  UserJwtEntity();

  factory UserJwtEntity.fromJson(Map<String, dynamic> json) => $UserJwtEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserJwtEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserJwtFirebase {

	UserJwtFirebaseIdentities? identities;
	@JSONField(name: "sign_in_provider")
	String? signInProvider;
  
  UserJwtFirebase();

  factory UserJwtFirebase.fromJson(Map<String, dynamic> json) => $UserJwtFirebaseFromJson(json);

  Map<String, dynamic> toJson() => $UserJwtFirebaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserJwtFirebaseIdentities {

	List<String>? email;
  
  UserJwtFirebaseIdentities();

  factory UserJwtFirebaseIdentities.fromJson(Map<String, dynamic> json) => $UserJwtFirebaseIdentitiesFromJson(json);

  Map<String, dynamic> toJson() => $UserJwtFirebaseIdentitiesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}