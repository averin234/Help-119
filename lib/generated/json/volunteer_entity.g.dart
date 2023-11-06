import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/volunteer_entity.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';


VolunteerEntity $VolunteerEntityFromJson(Map<String, dynamic> json) {
	final VolunteerEntity volunteerEntity = VolunteerEntity();
	final int? jarak = jsonConvert.convert<int>(json['jarak']);
	if (jarak != null) {
		volunteerEntity.jarak = jarak;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		volunteerEntity.address = address;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		volunteerEntity.gender = gender;
	}
	final String? idRole = jsonConvert.convert<String>(json['idRole']);
	if (idRole != null) {
		volunteerEntity.idRole = idRole;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		volunteerEntity.latitude = latitude;
	}
	final bool? verified = jsonConvert.convert<bool>(json['verified']);
	if (verified != null) {
		volunteerEntity.verified = verified;
	}
	final String? photo = jsonConvert.convert<String>(json['photo']);
	if (photo != null) {
		volunteerEntity.photo = photo;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		volunteerEntity.fullName = fullName;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		volunteerEntity.token = token;
	}
	final bool? isPartner = jsonConvert.convert<bool>(json['isPartner']);
	if (isPartner != null) {
		volunteerEntity.isPartner = isPartner;
	}
	final String? fcm = jsonConvert.convert<String>(json['fcm']);
	if (fcm != null) {
		volunteerEntity.fcm = fcm;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		volunteerEntity.password = password;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		volunteerEntity.phoneNumber = phoneNumber;
	}
	final bool? isDeleted = jsonConvert.convert<bool>(json['isDeleted']);
	if (isDeleted != null) {
		volunteerEntity.isDeleted = isDeleted;
	}
	final String? organization = jsonConvert.convert<String>(json['organization']);
	if (organization != null) {
		volunteerEntity.organization = organization;
	}
	final String? idJobplace = jsonConvert.convert<String>(json['idJobplace']);
	if (idJobplace != null) {
		volunteerEntity.idJobplace = idJobplace;
	}
	final String? heroCategory = jsonConvert.convert<String>(json['heroCategory']);
	if (heroCategory != null) {
		volunteerEntity.heroCategory = heroCategory;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		volunteerEntity.id = id;
	}
	final bool? isSandbox = jsonConvert.convert<bool>(json['isSandbox']);
	if (isSandbox != null) {
		volunteerEntity.isSandbox = isSandbox;
	}
	final List<ContactEntity>? contacts = jsonConvert.convertListNotNull<ContactEntity>(json['contacts']);
	if (contacts != null) {
		volunteerEntity.contacts = contacts;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		volunteerEntity.email = email;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		volunteerEntity.longitude = longitude;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		volunteerEntity.status = status;
	}
	final String? satuan = jsonConvert.convert<String>(json['satuan']);
	if (satuan != null) {
		volunteerEntity.satuan = satuan;
	}
	return volunteerEntity;
}

Map<String, dynamic> $VolunteerEntityToJson(VolunteerEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['jarak'] = entity.jarak;
	data['address'] = entity.address;
	data['gender'] = entity.gender;
	data['idRole'] = entity.idRole;
	data['latitude'] = entity.latitude;
	data['verified'] = entity.verified;
	data['photo'] = entity.photo;
	data['fullName'] = entity.fullName;
	data['token'] = entity.token;
	data['isPartner'] = entity.isPartner;
	data['fcm'] = entity.fcm;
	data['password'] = entity.password;
	data['phoneNumber'] = entity.phoneNumber;
	data['isDeleted'] = entity.isDeleted;
	data['organization'] = entity.organization;
	data['idJobplace'] = entity.idJobplace;
	data['heroCategory'] = entity.heroCategory;
	data['id'] = entity.id;
	data['isSandbox'] = entity.isSandbox;
	data['contacts'] =  entity.contacts?.map((v) => v.toJson()).toList();
	data['email'] = entity.email;
	data['longitude'] = entity.longitude;
	data['status'] = entity.status;
	data['satuan'] = entity.satuan;
	return data;
}

VolunteerCreatedAt $VolunteerCreatedAtFromJson(Map<String, dynamic> json) {
	final VolunteerCreatedAt volunteerCreatedAt = VolunteerCreatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		volunteerCreatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		volunteerCreatedAt.iNanoseconds = iNanoseconds;
	}
	return volunteerCreatedAt;
}

Map<String, dynamic> $VolunteerCreatedAtToJson(VolunteerCreatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}

VolunteerUpdatedAt $VolunteerUpdatedAtFromJson(Map<String, dynamic> json) {
	final VolunteerUpdatedAt volunteerUpdatedAt = VolunteerUpdatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		volunteerUpdatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		volunteerUpdatedAt.iNanoseconds = iNanoseconds;
	}
	return volunteerUpdatedAt;
}

Map<String, dynamic> $VolunteerUpdatedAtToJson(VolunteerUpdatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}