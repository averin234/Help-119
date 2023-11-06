import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/sign_in_entity.dart';

SignInEntity $SignInEntityFromJson(Map<String, dynamic> json) {
	final SignInEntity signInEntity = SignInEntity();
	final String? accessToken = jsonConvert.convert<String>(json['accessToken']);
	if (accessToken != null) {
		signInEntity.accessToken = accessToken;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		signInEntity.code = code;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		signInEntity.email = email;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		signInEntity.id = id;
	}
	final String? idRole = jsonConvert.convert<String>(json['idRole']);
	if (idRole != null) {
		signInEntity.idRole = idRole;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		signInEntity.message = message;
	}
	return signInEntity;
}

Map<String, dynamic> $SignInEntityToJson(SignInEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['accessToken'] = entity.accessToken;
	data['code'] = entity.code;
	data['email'] = entity.email;
	data['id'] = entity.id;
	data['idRole'] = entity.idRole;
	data['message'] = entity.message;
	return data;
}