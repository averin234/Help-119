import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/role_entity.dart';

RoleEntity $RoleEntityFromJson(Map<String, dynamic> json) {
	final RoleEntity roleEntity = RoleEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		roleEntity.id = id;
	}
	final String? group = jsonConvert.convert<String>(json['group']);
	if (group != null) {
		roleEntity.group = group;
	}
	return roleEntity;
}

Map<String, dynamic> $RoleEntityToJson(RoleEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['group'] = entity.group;
	return data;
}