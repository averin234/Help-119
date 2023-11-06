import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/error_entity.dart';

ErrorEntity $ErrorEntityFromJson(Map<String, dynamic> json) {
	final ErrorEntity errorEntity = ErrorEntity();
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		errorEntity.message = message;
	}
	final String? error = jsonConvert.convert<String>(json['error']);
	if (error != null) {
		errorEntity.error = error;
	}
	return errorEntity;
}

Map<String, dynamic> $ErrorEntityToJson(ErrorEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['message'] = entity.message;
	data['error'] = entity.error;
	return data;
}