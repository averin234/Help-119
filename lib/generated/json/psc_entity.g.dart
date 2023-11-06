import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/psc_entity.dart';

PscEntity $PscEntityFromJson(Map<String, dynamic> json) {
	final PscEntity pscEntity = PscEntity();
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		pscEntity.address = address;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		pscEntity.gender = gender;
	}
	final String? idRole = jsonConvert.convert<String>(json['idRole']);
	if (idRole != null) {
		pscEntity.idRole = idRole;
	}
	final int? latitude = jsonConvert.convert<int>(json['latitude']);
	if (latitude != null) {
		pscEntity.latitude = latitude;
	}
	final bool? verified = jsonConvert.convert<bool>(json['verified']);
	if (verified != null) {
		pscEntity.verified = verified;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		pscEntity.fullName = fullName;
	}
	final String? photo = jsonConvert.convert<String>(json['photo']);
	if (photo != null) {
		pscEntity.photo = photo;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		pscEntity.token = token;
	}
	final String? isPartner = jsonConvert.convert<String>(json['isPartner']);
	if (isPartner != null) {
		pscEntity.isPartner = isPartner;
	}
	final String? fcm = jsonConvert.convert<String>(json['fcm']);
	if (fcm != null) {
		pscEntity.fcm = fcm;
	}
	final PscCreatedAt? createdAt = jsonConvert.convert<PscCreatedAt>(json['createdAt']);
	if (createdAt != null) {
		pscEntity.createdAt = createdAt;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		pscEntity.password = password;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		pscEntity.phoneNumber = phoneNumber;
	}
	final bool? isDeleted = jsonConvert.convert<bool>(json['isDeleted']);
	if (isDeleted != null) {
		pscEntity.isDeleted = isDeleted;
	}
	final String? organization = jsonConvert.convert<String>(json['organization']);
	if (organization != null) {
		pscEntity.organization = organization;
	}
	final String? idJobplace = jsonConvert.convert<String>(json['idJobplace']);
	if (idJobplace != null) {
		pscEntity.idJobplace = idJobplace;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		pscEntity.id = id;
	}
	final String? heroCategory = jsonConvert.convert<String>(json['heroCategory']);
	if (heroCategory != null) {
		pscEntity.heroCategory = heroCategory;
	}
	final bool? isSandbox = jsonConvert.convert<bool>(json['isSandbox']);
	if (isSandbox != null) {
		pscEntity.isSandbox = isSandbox;
	}
	final List<dynamic>? contacts = jsonConvert.convertListNotNull<dynamic>(json['contacts']);
	if (contacts != null) {
		pscEntity.contacts = contacts;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		pscEntity.email = email;
	}
	final int? longitude = jsonConvert.convert<int>(json['longitude']);
	if (longitude != null) {
		pscEntity.longitude = longitude;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		pscEntity.status = status;
	}
	final PscUpdatedAt? updatedAt = jsonConvert.convert<PscUpdatedAt>(json['updatedAt']);
	if (updatedAt != null) {
		pscEntity.updatedAt = updatedAt;
	}
	final int? jarak = jsonConvert.convert<int>(json['jarak']);
	if (jarak != null) {
		pscEntity.jarak = jarak;
	}
	final String? satuan = jsonConvert.convert<String>(json['satuan']);
	if (satuan != null) {
		pscEntity.satuan = satuan;
	}
	return pscEntity;
}

Map<String, dynamic> $PscEntityToJson(PscEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['address'] = entity.address;
	data['gender'] = entity.gender;
	data['idRole'] = entity.idRole;
	data['latitude'] = entity.latitude;
	data['verified'] = entity.verified;
	data['fullName'] = entity.fullName;
	data['photo'] = entity.photo;
	data['token'] = entity.token;
	data['isPartner'] = entity.isPartner;
	data['fcm'] = entity.fcm;
	data['createdAt'] = entity.createdAt?.toJson();
	data['password'] = entity.password;
	data['phoneNumber'] = entity.phoneNumber;
	data['isDeleted'] = entity.isDeleted;
	data['organization'] = entity.organization;
	data['idJobplace'] = entity.idJobplace;
	data['id'] = entity.id;
	data['heroCategory'] = entity.heroCategory;
	data['isSandbox'] = entity.isSandbox;
	data['contacts'] =  entity.contacts;
	data['email'] = entity.email;
	data['longitude'] = entity.longitude;
	data['status'] = entity.status;
	data['updatedAt'] = entity.updatedAt?.toJson();
	data['jarak'] = entity.jarak;
	data['satuan'] = entity.satuan;
	return data;
}

PscCreatedAt $PscCreatedAtFromJson(Map<String, dynamic> json) {
	final PscCreatedAt pscCreatedAt = PscCreatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		pscCreatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		pscCreatedAt.iNanoseconds = iNanoseconds;
	}
	return pscCreatedAt;
}

Map<String, dynamic> $PscCreatedAtToJson(PscCreatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}

PscUpdatedAt $PscUpdatedAtFromJson(Map<String, dynamic> json) {
	final PscUpdatedAt pscUpdatedAt = PscUpdatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		pscUpdatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		pscUpdatedAt.iNanoseconds = iNanoseconds;
	}
	return pscUpdatedAt;
}

Map<String, dynamic> $PscUpdatedAtToJson(PscUpdatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}