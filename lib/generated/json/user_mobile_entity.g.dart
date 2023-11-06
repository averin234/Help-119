import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/user_mobile_entity.dart';

UserMobileEntity $UserMobileEntityFromJson(Map<String, dynamic> json) {
	final UserMobileEntity userMobileEntity = UserMobileEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userMobileEntity.id = id;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		userMobileEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		userMobileEntity.message = message;
	}
	final String? idRole = jsonConvert.convert<String>(json['idRole']);
	if (idRole != null) {
		userMobileEntity.idRole = idRole;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		userMobileEntity.fullName = fullName;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		userMobileEntity.latitude = latitude;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		userMobileEntity.longitude = longitude;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		userMobileEntity.address = address;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		userMobileEntity.phoneNumber = phoneNumber;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userMobileEntity.email = email;
	}
	final String? fcm = jsonConvert.convert<String>(json['fcm']);
	if (fcm != null) {
		userMobileEntity.fcm = fcm;
	}
	final String? photo = jsonConvert.convert<String>(json['photo']);
	if (photo != null) {
		userMobileEntity.photo = photo;
	}
	final bool? verified = jsonConvert.convert<bool>(json['verified']);
	if (verified != null) {
		userMobileEntity.verified = verified;
	}
	final String? accessToken = jsonConvert.convert<String>(json['accessToken']);
	if (accessToken != null) {
		userMobileEntity.accessToken = accessToken;
	}
	final String? ktp = jsonConvert.convert<String>(json['ktp']);
	if (ktp != null) {
		userMobileEntity.ktp = ktp;
	}
	final String? photoKtp = jsonConvert.convert<String>(json['photoKtp']);
	if (photoKtp != null) {
		userMobileEntity.photoKtp = photoKtp;
	}
	final String? photoCertificate = jsonConvert.convert<String>(json['photoCertificate']);
	if (photoCertificate != null) {
		userMobileEntity.photoCertificate = photoCertificate;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		userMobileEntity.gender = gender;
	}
	final String? provinceCode = jsonConvert.convert<String>(json['province_code']);
	if (provinceCode != null) {
		userMobileEntity.provinceCode = provinceCode;
	}
	final String? cityCode = jsonConvert.convert<String>(json['city_code']);
	if (cityCode != null) {
		userMobileEntity.cityCode = cityCode;
	}
	return userMobileEntity;
}

Map<String, dynamic> $UserMobileEntityToJson(UserMobileEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['idRole'] = entity.idRole;
	data['fullName'] = entity.fullName;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['address'] = entity.address;
	data['phoneNumber'] = entity.phoneNumber;
	data['email'] = entity.email;
	data['fcm'] = entity.fcm;
	data['photo'] = entity.photo;
	data['verified'] = entity.verified;
	data['accessToken'] = entity.accessToken;
	data['ktp'] = entity.ktp;
	data['photoKtp'] = entity.photoKtp;
	data['photoCertificate'] = entity.photoCertificate;
	data['gender'] = entity.gender;
	data['province_code'] = entity.provinceCode;
	data['city_code'] = entity.cityCode;
	return data;
}