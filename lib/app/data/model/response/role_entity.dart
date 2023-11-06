import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/role_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RoleEntity {

	String? id;
	String? group;
  
  RoleEntity();

  factory RoleEntity.fromJson(Map<String, dynamic> json) => $RoleEntityFromJson(json);

  Map<String, dynamic> toJson() => $RoleEntityToJson(this);

  RoleEntity copyWith({String? id, String? group}) {
      return RoleEntity()..id= id ?? this.id
			..group= group ?? this.group;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}