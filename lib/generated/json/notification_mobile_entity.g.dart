import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/notification_mobile_entity.dart';

NotificationMobileEntity $NotificationMobileEntityFromJson(Map<String, dynamic> json) {
	final NotificationMobileEntity notificationMobileEntity = NotificationMobileEntity();
	final String? pesan = jsonConvert.convert<String>(json['pesan']);
	if (pesan != null) {
		notificationMobileEntity.pesan = pesan;
	}
	final String? currentStatus = jsonConvert.convert<String>(json['currentStatus']);
	if (currentStatus != null) {
		notificationMobileEntity.currentStatus = currentStatus;
	}
	final String? idEmergency = jsonConvert.convert<String>(json['idEmergency']);
	if (idEmergency != null) {
		notificationMobileEntity.idEmergency = idEmergency;
	}
	return notificationMobileEntity;
}

Map<String, dynamic> $NotificationMobileEntityToJson(NotificationMobileEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['pesan'] = entity.pesan;
	data['currentStatus'] = entity.currentStatus;
	data['idEmergency'] = entity.idEmergency;
	return data;
}