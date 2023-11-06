import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/ambulance_entity.dart';

AmbulanceEntity $AmbulanceEntityFromJson(Map<String, dynamic> json) {
	final AmbulanceEntity ambulanceEntity = AmbulanceEntity();
	final int? jarak = jsonConvert.convert<int>(json['jarak']);
	if (jarak != null) {
		ambulanceEntity.jarak = jarak;
	}
	final AmbulanceCreatedAt? createdAt = jsonConvert.convert<AmbulanceCreatedAt>(json['createdAt']);
	if (createdAt != null) {
		ambulanceEntity.createdAt = createdAt;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		ambulanceEntity.phoneNumber = phoneNumber;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		ambulanceEntity.id = id;
	}
	final String? idCategories = jsonConvert.convert<String>(json['idCategories']);
	if (idCategories != null) {
		ambulanceEntity.idCategories = idCategories;
	}
	final String? alamat = jsonConvert.convert<String>(json['address']);
	if (alamat != null) {
		ambulanceEntity.alamat = alamat;
	}
	final bool? isDeleted = jsonConvert.convert<bool>(json['isDeleted']);
	if (isDeleted != null) {
		ambulanceEntity.isDeleted = isDeleted;
	}
	final double? latitude = jsonConvert.convert<double>(json['latitude']);
	if (latitude != null) {
		ambulanceEntity.latitude = latitude;
	}
	final String? name = jsonConvert.convert<String>(json['fullName']);
	if (name != null) {
		ambulanceEntity.name = name;
	}
	final AmbulanceUpdateAt? updateAt = jsonConvert.convert<AmbulanceUpdateAt>(json['updateAt']);
	if (updateAt != null) {
		ambulanceEntity.updateAt = updateAt;
	}
	final double? longitude = jsonConvert.convert<double>(json['longitude']);
	if (longitude != null) {
		ambulanceEntity.longitude = longitude;
	}
	final String? satuan = jsonConvert.convert<String>(json['satuan']);
	if (satuan != null) {
		ambulanceEntity.satuan = satuan;
	}
	return ambulanceEntity;
}

Map<String, dynamic> $AmbulanceEntityToJson(AmbulanceEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['createdAt'] = entity.createdAt?.toJson();
	data['phoneNumber'] = entity.phoneNumber;
	data['jarak'] = entity.jarak;
	data['jarak'] = entity.jarak;
	data['id'] = entity.id;
	data['idCategories'] = entity.idCategories;
	data['address'] = entity.alamat;
	data['isDeleted'] = entity.isDeleted;
	data['latitude'] = entity.latitude;
	data['fullName'] = entity.name;
	data['updateAt'] = entity.updateAt?.toJson();
	data['longitude'] = entity.longitude;
	data['satuan'] = entity.satuan;
	return data;
}

AmbulanceCreatedAt $AmbulanceCreatedAtFromJson(Map<String, dynamic> json) {
	final AmbulanceCreatedAt ambulanceCreatedAt = AmbulanceCreatedAt();
	final double? dSeconds = jsonConvert.convert<double>(json['_seconds']);
	if (dSeconds != null) {
		ambulanceCreatedAt.dSeconds = dSeconds;
	}
	final double? dNanoseconds = jsonConvert.convert<double>(json['_nanoseconds']);
	if (dNanoseconds != null) {
		ambulanceCreatedAt.dNanoseconds = dNanoseconds;
	}
	return ambulanceCreatedAt;
}

Map<String, dynamic> $AmbulanceCreatedAtToJson(AmbulanceCreatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.dSeconds;
	data['_nanoseconds'] = entity.dNanoseconds;
	return data;
}

AmbulanceUpdateAt $AmbulanceUpdateAtFromJson(Map<String, dynamic> json) {
	final AmbulanceUpdateAt ambulanceUpdateAt = AmbulanceUpdateAt();
	final double? dSeconds = jsonConvert.convert<double>(json['_seconds']);
	if (dSeconds != null) {
		ambulanceUpdateAt.dSeconds = dSeconds;
	}
	final double? dNanoseconds = jsonConvert.convert<double>(json['_nanoseconds']);
	if (dNanoseconds != null) {
		ambulanceUpdateAt.dNanoseconds = dNanoseconds;
	}
	return ambulanceUpdateAt;
}

Map<String, dynamic> $AmbulanceUpdateAtToJson(AmbulanceUpdateAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.dSeconds;
	data['_nanoseconds'] = entity.dNanoseconds;
	return data;
}