import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/error_entity.g.dart';

@JsonSerializable()
class ErrorEntity {

	// int? code;
	String? message;
	String? error;
  
  ErrorEntity();

  factory ErrorEntity.fromJson(Map<String, dynamic> json) => $ErrorEntityFromJson(json);

  Map<String, dynamic> toJson() => $ErrorEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}