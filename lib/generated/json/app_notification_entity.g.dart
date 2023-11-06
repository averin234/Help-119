import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/app_notification_entity.dart';

AppNotificationEntity $AppNotificationEntityFromJson(Map<String, dynamic> json) {
	final AppNotificationEntity appNotificationEntity = AppNotificationEntity();
	final int? successCount = jsonConvert.convert<int>(json['successCount']);
	if (successCount != null) {
		appNotificationEntity.successCount = successCount;
	}
	final int? failureCount = jsonConvert.convert<int>(json['failureCount']);
	if (failureCount != null) {
		appNotificationEntity.failureCount = failureCount;
	}
	final String? fcm = jsonConvert.convert<String>(json['fcm']);
	if (fcm != null) {
		appNotificationEntity.fcm = fcm;
	}
	final List<dynamic>? errors = jsonConvert.convertListNotNull<dynamic>(json['errors']);
	if (errors != null) {
		appNotificationEntity.errors = errors;
	}
	return appNotificationEntity;
}

Map<String, dynamic> $AppNotificationEntityToJson(AppNotificationEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['successCount'] = entity.successCount;
	data['failureCount'] = entity.failureCount;
	data['fcm'] = entity.fcm;
	data['errors'] =  entity.errors;
	return data;
}