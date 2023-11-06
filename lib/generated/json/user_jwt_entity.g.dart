import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/user_jwt_entity.dart';

UserJwtEntity $UserJwtEntityFromJson(Map<String, dynamic> json) {
	final UserJwtEntity userJwtEntity = UserJwtEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userJwtEntity.name = name;
	}
	final String? picture = jsonConvert.convert<String>(json['picture']);
	if (picture != null) {
		userJwtEntity.picture = picture;
	}
	final String? userInternalId = jsonConvert.convert<String>(json['USER_INTERNAL_ID']);
	if (userInternalId != null) {
		userJwtEntity.userInternalId = userInternalId;
	}
	final bool? isActive = jsonConvert.convert<bool>(json['IS_ACTIVE']);
	if (isActive != null) {
		userJwtEntity.isActive = isActive;
	}
	final String? roleGroup = jsonConvert.convert<String>(json['ROLE_GROUP']);
	if (roleGroup != null) {
		userJwtEntity.roleGroup = roleGroup;
	}
	final String? roleGroupName = jsonConvert.convert<String>(json['ROLE_GROUP_NAME']);
	if (roleGroupName != null) {
		userJwtEntity.roleGroupName = roleGroupName;
	}
	final String? iss = jsonConvert.convert<String>(json['iss']);
	if (iss != null) {
		userJwtEntity.iss = iss;
	}
	final String? aud = jsonConvert.convert<String>(json['aud']);
	if (aud != null) {
		userJwtEntity.aud = aud;
	}
	final int? authTime = jsonConvert.convert<int>(json['auth_time']);
	if (authTime != null) {
		userJwtEntity.authTime = authTime;
	}
	final String? userId = jsonConvert.convert<String>(json['user_id']);
	if (userId != null) {
		userJwtEntity.userId = userId;
	}
	final String? sub = jsonConvert.convert<String>(json['sub']);
	if (sub != null) {
		userJwtEntity.sub = sub;
	}
	final int? iat = jsonConvert.convert<int>(json['iat']);
	if (iat != null) {
		userJwtEntity.iat = iat;
	}
	final int? exp = jsonConvert.convert<int>(json['exp']);
	if (exp != null) {
		userJwtEntity.exp = exp;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userJwtEntity.email = email;
	}
	final bool? emailVerified = jsonConvert.convert<bool>(json['email_verified']);
	if (emailVerified != null) {
		userJwtEntity.emailVerified = emailVerified;
	}
	final UserJwtFirebase? firebase = jsonConvert.convert<UserJwtFirebase>(json['firebase']);
	if (firebase != null) {
		userJwtEntity.firebase = firebase;
	}
	return userJwtEntity;
}

Map<String, dynamic> $UserJwtEntityToJson(UserJwtEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['picture'] = entity.picture;
	data['USER_INTERNAL_ID'] = entity.userInternalId;
	data['IS_ACTIVE'] = entity.isActive;
	data['ROLE_GROUP'] = entity.roleGroup;
	data['ROLE_GROUP_NAME'] = entity.roleGroupName;
	data['iss'] = entity.iss;
	data['aud'] = entity.aud;
	data['auth_time'] = entity.authTime;
	data['user_id'] = entity.userId;
	data['sub'] = entity.sub;
	data['iat'] = entity.iat;
	data['exp'] = entity.exp;
	data['email'] = entity.email;
	data['email_verified'] = entity.emailVerified;
	data['firebase'] = entity.firebase?.toJson();
	return data;
}

UserJwtFirebase $UserJwtFirebaseFromJson(Map<String, dynamic> json) {
	final UserJwtFirebase userJwtFirebase = UserJwtFirebase();
	final UserJwtFirebaseIdentities? identities = jsonConvert.convert<UserJwtFirebaseIdentities>(json['identities']);
	if (identities != null) {
		userJwtFirebase.identities = identities;
	}
	final String? signInProvider = jsonConvert.convert<String>(json['sign_in_provider']);
	if (signInProvider != null) {
		userJwtFirebase.signInProvider = signInProvider;
	}
	return userJwtFirebase;
}

Map<String, dynamic> $UserJwtFirebaseToJson(UserJwtFirebase entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['identities'] = entity.identities?.toJson();
	data['sign_in_provider'] = entity.signInProvider;
	return data;
}

UserJwtFirebaseIdentities $UserJwtFirebaseIdentitiesFromJson(Map<String, dynamic> json) {
	final UserJwtFirebaseIdentities userJwtFirebaseIdentities = UserJwtFirebaseIdentities();
	final List<String>? email = jsonConvert.convertListNotNull<String>(json['email']);
	if (email != null) {
		userJwtFirebaseIdentities.email = email;
	}
	return userJwtFirebaseIdentities;
}

Map<String, dynamic> $UserJwtFirebaseIdentitiesToJson(UserJwtFirebaseIdentities entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['email'] =  entity.email;
	return data;
}