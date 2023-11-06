import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/volunteer_mobile.dart';

VolunteerMobile $VolunteerMobileFromJson(Map<String, dynamic> json) {
	final VolunteerMobile volunteerMobile = VolunteerMobile();
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		volunteerMobile.address = address;
	}
	final String? birthdate = jsonConvert.convert<String>(json['birthdate']);
	if (birthdate != null) {
		volunteerMobile.birthdate = birthdate;
	}
	final String? photoCertificate = jsonConvert.convert<String>(json['photoCertificate']);
	if (photoCertificate != null) {
		volunteerMobile.photoCertificate = photoCertificate;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		volunteerMobile.fullName = fullName;
	}
	final VolunteerMobileCreatedAt? createdAt = jsonConvert.convert<VolunteerMobileCreatedAt>(json['createdAt']);
	if (createdAt != null) {
		volunteerMobile.createdAt = createdAt;
	}
	final String? addressOffice = jsonConvert.convert<String>(json['addressOffice']);
	if (addressOffice != null) {
		volunteerMobile.addressOffice = addressOffice;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		volunteerMobile.phoneNumber = phoneNumber;
	}
	final bool? isDeleted = jsonConvert.convert<bool>(json['isDeleted']);
	if (isDeleted != null) {
		volunteerMobile.isDeleted = isDeleted;
	}
	final String? identityNumber = jsonConvert.convert<String>(json['identityNumber']);
	if (identityNumber != null) {
		volunteerMobile.identityNumber = identityNumber;
	}
	final String? addressDomicile = jsonConvert.convert<String>(json['addressDomicile']);
	if (addressDomicile != null) {
		volunteerMobile.addressDomicile = addressDomicile;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		volunteerMobile.id = id;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		volunteerMobile.email = email;
	}
	final String? photoKtp = jsonConvert.convert<String>(json['photoKtp']);
	if (photoKtp != null) {
		volunteerMobile.photoKtp = photoKtp;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		volunteerMobile.status = status;
	}
	final VolunteerMobileUpdatedAt? updatedAt = jsonConvert.convert<VolunteerMobileUpdatedAt>(json['updatedAt']);
	if (updatedAt != null) {
		volunteerMobile.updatedAt = updatedAt;
	}
	return volunteerMobile;
}

Map<String, dynamic> $VolunteerMobileToJson(VolunteerMobile entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['address'] = entity.address;
	data['birthdate'] = entity.birthdate;
	data['photoCertificate'] = entity.photoCertificate;
	data['fullName'] = entity.fullName;
	data['createdAt'] = entity.createdAt?.toJson();
	data['addressOffice'] = entity.addressOffice;
	data['phoneNumber'] = entity.phoneNumber;
	data['isDeleted'] = entity.isDeleted;
	data['identityNumber'] = entity.identityNumber;
	data['addressDomicile'] = entity.addressDomicile;
	data['id'] = entity.id;
	data['email'] = entity.email;
	data['photoKtp'] = entity.photoKtp;
	data['status'] = entity.status;
	data['updatedAt'] = entity.updatedAt?.toJson();
	return data;
}

VolunteerMobileCreatedAt $VolunteerMobileCreatedAtFromJson(Map<String, dynamic> json) {
	final VolunteerMobileCreatedAt volunteerMobileCreatedAt = VolunteerMobileCreatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		volunteerMobileCreatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		volunteerMobileCreatedAt.iNanoseconds = iNanoseconds;
	}
	return volunteerMobileCreatedAt;
}

Map<String, dynamic> $VolunteerMobileCreatedAtToJson(VolunteerMobileCreatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}

VolunteerMobileUpdatedAt $VolunteerMobileUpdatedAtFromJson(Map<String, dynamic> json) {
	final VolunteerMobileUpdatedAt volunteerMobileUpdatedAt = VolunteerMobileUpdatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		volunteerMobileUpdatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		volunteerMobileUpdatedAt.iNanoseconds = iNanoseconds;
	}
	return volunteerMobileUpdatedAt;
}

Map<String, dynamic> $VolunteerMobileUpdatedAtToJson(VolunteerMobileUpdatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}