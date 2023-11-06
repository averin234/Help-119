import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/hospital_entity.dart';

HospitalEntity $HospitalEntityFromJson(Map<String, dynamic> json) {
	final HospitalEntity hospitalEntity = HospitalEntity();
	final String? website = jsonConvert.convert<String>(json['website']);
	if (website != null) {
		hospitalEntity.website = website;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		hospitalEntity.address = address;
	}
	final String? director = jsonConvert.convert<String>(json['director']);
	if (director != null) {
		hospitalEntity.director = director;
	}
	final String? cityCode = jsonConvert.convert<String>(json['city_code']);
	if (cityCode != null) {
		hospitalEntity.cityCode = cityCode;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		hospitalEntity.type = type;
	}
	final String? provinceCode = jsonConvert.convert<String>(json['province_code']);
	if (provinceCode != null) {
		hospitalEntity.provinceCode = provinceCode;
	}
	final String? phoneHumas = jsonConvert.convert<String>(json['phoneNumberHumas']);
	if (phoneHumas != null) {
		hospitalEntity.phoneHumas = phoneHumas;
	}
	final dynamic registrationDate = jsonConvert.convert<dynamic>(json['registration_date']);
	if (registrationDate != null) {
		hospitalEntity.registrationDate = registrationDate;
	}
	final String? phone = jsonConvert.convert<String>(json['phoneNumber']);
	if (phone != null) {
		hospitalEntity.phone = phone;
	}
	final dynamic district = jsonConvert.convert<dynamic>(json['district']);
	if (district != null) {
		hospitalEntity.district = district;
	}
	final dynamic lastUpdate = jsonConvert.convert<dynamic>(json['last_update']);
	if (lastUpdate != null) {
		hospitalEntity.lastUpdate = lastUpdate;
	}
	final String? name = jsonConvert.convert<String>(json['fullName']);
	if (name != null) {
		hospitalEntity.name = name;
	}
	final dynamic postalCode = jsonConvert.convert<dynamic>(json['postal_code']);
	if (postalCode != null) {
		hospitalEntity.postalCode = postalCode;
	}
	final dynamic fax = jsonConvert.convert<dynamic>(json['fax']);
	if (fax != null) {
		hospitalEntity.fax = fax;
	}
	final String? xClass = jsonConvert.convert<String>(json['class']);
	if (xClass != null) {
		hospitalEntity.xClass = xClass;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		hospitalEntity.status = status;
	}
	final int? jarak = jsonConvert.convert<int>(json['jarak']);
	if (jarak != null) {
		hospitalEntity.jarak = jarak;
	}
	final String? satuan = jsonConvert.convert<String>(json['satuan']);
	if (satuan != null) {
		hospitalEntity.satuan = satuan;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		hospitalEntity.latitude = latitude;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		hospitalEntity.longitude = longitude;
	}
	return hospitalEntity;
}

Map<String, dynamic> $HospitalEntityToJson(HospitalEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['website'] = entity.website;
	data['address'] = entity.address;
	data['director'] = entity.director;
	data['city_code'] = entity.cityCode;
	data['type'] = entity.type;
	data['province_code'] = entity.provinceCode;
	data['phoneNumberHumas'] = entity.phoneHumas;
	data['registration_date'] = entity.registrationDate;
	data['phoneNumber'] = entity.phone;
	data['district'] = entity.district;
	data['last_update'] = entity.lastUpdate;
	data['fullName'] = entity.name;
	data['postal_code'] = entity.postalCode;
	data['fax'] = entity.fax;
	data['class'] = entity.xClass;
	data['status'] = entity.status;
	data['jarak'] = entity.jarak;
	data['satuan'] = entity.satuan;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}