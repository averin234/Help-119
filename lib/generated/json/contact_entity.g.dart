import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';

ContactEntity $ContactEntityFromJson(Map<String, dynamic> json) {
	final ContactEntity contactEntity = ContactEntity();
	final ContactCreatedAt? createdAt = jsonConvert.convert<ContactCreatedAt>(json['createdAt']);
	if (createdAt != null) {
		contactEntity.createdAt = createdAt;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		contactEntity.phoneNumber = phoneNumber;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		contactEntity.fullName = fullName;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		contactEntity.id = id;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		contactEntity.email = email;
	}
	final ContactUpdatedAt? updatedAt = jsonConvert.convert<ContactUpdatedAt>(json['updatedAt']);
	if (updatedAt != null) {
		contactEntity.updatedAt = updatedAt;
	}
	return contactEntity;
}

Map<String, dynamic> $ContactEntityToJson(ContactEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['createdAt'] = entity.createdAt?.toJson();
	data['phoneNumber'] = entity.phoneNumber;
	data['fullName'] = entity.fullName;
	data['id'] = entity.id;
	data['email'] = entity.email;
	data['updatedAt'] = entity.updatedAt?.toJson();
	return data;
}

ContactCreatedAt $ContactCreatedAtFromJson(Map<String, dynamic> json) {
	final ContactCreatedAt contactCreatedAt = ContactCreatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		contactCreatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		contactCreatedAt.iNanoseconds = iNanoseconds;
	}
	return contactCreatedAt;
}

Map<String, dynamic> $ContactCreatedAtToJson(ContactCreatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}

ContactUpdatedAt $ContactUpdatedAtFromJson(Map<String, dynamic> json) {
	final ContactUpdatedAt contactUpdatedAt = ContactUpdatedAt();
	final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
	if (iSeconds != null) {
		contactUpdatedAt.iSeconds = iSeconds;
	}
	final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
	if (iNanoseconds != null) {
		contactUpdatedAt.iNanoseconds = iNanoseconds;
	}
	return contactUpdatedAt;
}

Map<String, dynamic> $ContactUpdatedAtToJson(ContactUpdatedAt entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_seconds'] = entity.iSeconds;
	data['_nanoseconds'] = entity.iNanoseconds;
	return data;
}